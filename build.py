#!/usr/bin/env python
#
# SVGSlice
#
# Released under the GNU General Public License, version 2.
# Email Lee Braiden of Digital Unleashed at lee.b@digitalunleashed.com
# with any questions, suggestions, patches, or general uncertainties
# regarding this software.
#

usageMsg = """You need to add a layer called "slices", and draw rectangles on it to represent the areas that should be saved as slices.  It helps when drawing these rectangles if you make them translucent.

If you name these slices using the "id" field of Inkscape's built-in XML editor, that name will be reflected in the slice filenames.

Please remember to HIDE the slices layer before exporting, so that the rectangles themselves are not drawn in the final image slices."""

# How it works:
#
# Basically, svgslice just parses an SVG file, looking for the tags that define
# the slices should be, and saves them in a list of rectangles.  Next, it generates
# an XHTML file, passing that out stdout to Inkscape.  This will be saved by inkscape
# under the name chosen in the save dialog.  Finally, it calls
# inkscape again to render each rectangle as a slice.
#
# Currently, nothing fancy is done to layout the XHTML file in a similar way to the
# original document, so the generated pages is essentially just a quick way to see
# all of the slices in once place, and perhaps a starting point for more layout work.
#

from optparse import OptionParser

optParser = OptionParser()
optParser.add_option('-n','--name',dest='name',default='cursor',help='Specified name of theme')
optParser.add_option('-i','--inherit',dest='inherit',default='Adwaita',help='Specified name of theme wan to inherit DEFAULT:Adwaita')
optParser.add_option('-d','--debug',action='store_true',dest='debug',help='Enable extra debugging info.')
optParser.add_option('-t','--test',action='store_true',dest='testing',help='Test mode: leave temporary files for examination.')
optParser.add_option('-p','--sliceprefix',action='store',dest='sliceprefix',help='Specifies the prefix to use for individual slice filenames.')

from xml.sax import saxutils, make_parser, SAXParseException
from xml.sax.handler import feature_namespaces
import os, sys, tempfile, shutil ,glob ,errno

svgFilename = None

def dbg(msg):
    if options.debug:
        sys.stderr.write(msg)

def cleanup():
    if svgFilename != None and os.path.exists(svgFilename):
        os.unlink(svgFilename)

def fatalError(msg):
    sys.stderr.write(msg)
    cleanup()
    sys.exit(20)

def baseName(svgFilename):
    base=os.path.basename(svgFilename)
    base=os.path.splitext(base)[0]
    return base

def symlink(target, link_name):
    try:
        os.symlink(target, link_name)
    except OSError as e:
        if e.errno == errno.EEXIST:
            os.remove(link_name)
            os.symlink(target, link_name)
        else:
            raise e

class SVGRect:
    """Manages a simple rectangular area, along with certain attributes such as a name"""
    def __init__(self, x1,y1,x2,y2, name=None):
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        self.name = name
        dbg("New SVGRect: (%s)" % name)
    
    def renderFromSVG(self, svgFName, sliceFName):
        for size in (24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96):
            os.system("mkdir -p build/%s/pngs/%sx%s" % (options.name,size, size))
            rc = os.system('inkscape --without-gui -w %s -h %s --export-id="%s" --export-png="build/%s/pngs/%sx%s/%s" "%s"' % (size, size, self.name, options.name, size, size, sliceFName, svgFName))
            if rc > 0:
                fatalError('ABORTING: Inkscape failed to render the slice.')


class SVGHandler(saxutils.xmlreader.handler.ContentHandler):
    """Base class for SVG parsers"""
    def __init__(self):
        self.pageBounds = SVGRect(0,0,0,0)

    def isFloat(self, stringVal):
        try:
            return (float(stringVal), True)[1]
        except (ValueError, TypeError):
            return False
    
    def parseCoordinates(self, val):
        """Strips the units from a coordinate, and returns just the value."""
        if val.endswith('px'):
            val = float(val.rstrip('px'))
        elif val.endswith('pt'):
            val = float(val.rstrip('pt'))
        elif val.endswith('cm'):
            val = float(val.rstrip('cm'))
        elif val.endswith('mm'):
            val = float(val.rstrip('mm'))
        elif val.endswith('in'):
            val = float(val.rstrip('in'))
        elif val.endswith('%'):
            val = float(val.rstrip('%'))
        elif self.isFloat(val):
            val = float(val)
        else:
            fatalError("Coordinate value %s has unrecognised units.  Only px,pt,cm,mm,and in units are currently supported." % val)
        return val
    
    def startElement_svg(self, name, attrs):
        """Callback hook which handles the start of an svg image"""
        dbg('startElement_svg called')
        width = attrs.get('width', None)
        height = attrs.get('height', None)
        self.pageBounds.x2 = self.parseCoordinates(width)
        self.pageBounds.y2 = self.parseCoordinates(height)
    
    def endElement(self, name):
        """General callback for the end of a tag"""
        dbg('Ending element "%s"' % name)


class SVGLayerHandler(SVGHandler):
    """Parses an SVG file, extracing slicing rectangles from a "slices" layer"""
    def __init__(self):
        SVGHandler.__init__(self)
        self.svg_rects = []
        self.layer_nests = 0
    
    def inSlicesLayer(self):
        return (self.layer_nests >= 1)
    
    def add(self, rect):
        """Adds the given rect to the list of rectangles successfully parsed"""
        self.svg_rects.append(rect)
    
    def startElement_layer(self, name, attrs):
        """Callback hook for parsing layer elements
        
        Checks to see if we're starting to parse a slices layer, and sets the appropriate flags.  Otherwise, the layer will simply be ignored."""
        dbg('found layer: name="%s" id="%s"' % (name, attrs['id']))
        if attrs.get('inkscape:groupmode', None) == 'layer':
            if self.inSlicesLayer() or attrs['inkscape:label'] == 'slices':
                self.layer_nests += 1
    
    def endElement_layer(self, name):
        """Callback for leaving a layer in the SVG file
    
        Just undoes any flags set previously."""
        dbg('leaving layer: name="%s"' % name)
        if self.inSlicesLayer():
            self.layer_nests -= 1
    
    def startElement_rect(self, name, attrs):
        """Callback for parsing an SVG rectangle
        
        Checks if we're currently in a special "slices" layer using flags set by startElement_layer().  If we are, the current rectangle is considered to be a slice, and is added to the list of parsed
        rectangles.  Otherwise, it will be ignored."""
        if self.inSlicesLayer():
            x1 = self.parseCoordinates(attrs['x'])
            y1 = self.parseCoordinates(attrs['y'])
            x2 = self.parseCoordinates(attrs['width']) + x1
            y2 = self.parseCoordinates(attrs['height']) + y1
            name = attrs['id']
            rect = SVGRect(x1,y1, x2,y2, name)
            self.add(rect)
    
    def startElement(self, name, attrs):
        """Generic hook for examining and/or parsing all SVG tags"""
        if options.debug:
            dbg('Beginning element "%s"' % name)
        if name == 'svg':
            self.startElement_svg(name, attrs)
        elif name == 'g':
            # inkscape layers are groups, I guess, hence 'g'
            self.startElement_layer(name, attrs)
        elif name == 'rect':
            self.startElement_rect(name, attrs)
    
    def endElement(self, name):
        """Generic hook called when the parser is leaving each SVG tag"""
        dbg('Ending element "%s"' % name)
        if name == 'g':
            self.endElement_layer(name)
    
    def generateXHTMLPage(self):
        """Generates an XHTML page for the SVG rectangles previously parsed."""
        write = sys.stdout.write
        write('<?xml version="1.0" encoding="UTF-8"?>\n')
        write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">\n')
        write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">\n')
        write('    <head>\n')
        write('        <title>Sample SVGSlice Output</title>\n')
        write('    </head>\n')
        write('    <body>\n')
        write('        <p>Sorry, SVGSlice\'s XHTML output is currently very basic.  Hopefully, it will serve as a quick way to preview all generated slices in your browser, and perhaps as a starting point for further layout work.  Feel free to write it and submit a patch to the author :)</p>\n')
        
        write('        <p>')
        for rect in self.svg_rects:
            write('            <img src="%s" alt="%s (please add real alternative text for this image)" longdesc="Please add a full description of this image" />\n' % (sliceprefix + rect.name + '.png', rect.name))
        write('        </p>')
        
        write('<p><a href="http://validator.w3.org/check?uri=referer"><img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0!" height="31" width="88" /></a></p>')
        
        write('    </body>\n')
        write('</html>\n')


if __name__ == '__main__':
    # parse command line into arguments and options
    (options, args) = optParser.parse_args()

    if len(args) != 1:
        fatalError("\nCall me with the SVG as a parameter.\n\n")
    originalFilename = args[0]

    svgFilename = originalFilename + '.svg'
    shutil.copyfile(originalFilename, svgFilename)
    
    # setup program variables from command line (in other words, handle non-option args)
    basename = os.path.splitext(svgFilename)[0]
    
    if options.sliceprefix:
        sliceprefix = options.sliceprefix
    else:
        sliceprefix = ''
    
    # initialise results before actually attempting to parse the SVG file
    svgBounds = SVGRect(0,0,0,0)
    rectList = []
    
    # Try to parse the svg file
    xmlParser = make_parser()
    xmlParser.setFeature(feature_namespaces, 0)
    
    # setup XML Parser with an SVGLayerHandler class as a callback parser ####
    svgLayerHandler = SVGLayerHandler()
    xmlParser.setContentHandler(svgLayerHandler)
    try:
        xmlParser.parse(svgFilename)
    except SAXParseException as e:
        fatalError("Error parsing SVG file '%s': line %d,col %d: %s.  If you're seeing this within inkscape, it probably indicates a bug that should be reported." % (svgFilename, e.getLineNumber(), e.getColumnNumber(), e.getMessage()))
    
    # verify that the svg file actually contained some rectangles.
    if len(svgLayerHandler.svg_rects) == 0:
        fatalError("""No slices were found in this SVG file.  Please refer to the documentation for guidance on how to use this SVGSlice.  As a quick summary:""" + usageMsg)
    else:
        dbg("Parsing successful.")
    
    #svgLayerHandler.generateXHTMLPage()
    
    # loop through each slice rectangle, and render a PNG image for it
    for rect in svgLayerHandler.svg_rects:
        sliceFName = sliceprefix + rect.name + '.png'
        
        dbg('Saving slice as: "%s"' % sliceFName)
        rect.renderFromSVG(svgFilename, sliceFName)

    cleanup()

    dbg('\n\nSlicing complete.\n')

    """Generate cursor files based on 96x96 size hotspots."""

    files = (
        (45.5, 46.8, "X_cursor"),
        (50, 46, "bd_double_arrow"),
        (16, 84, "bottom_left_corner"),
        (84, 84, "bottom_right_corner"),
        (50, 72, "bottom_side"),
        (48, 72, "bottom_tee"),
        (14.5, 10.6, "circle"),
        (23.1, 74.1, "color-picker"),
        (18.8, 11.2, "copy"),
        (44, 44, "cross"),
        (48, 48, "crossed_circle"),
        (44, 44, "crosshair"),
        (45, 50, "dnd-ask"),
        (45, 50, "dnd-copy"),
        (45, 50, "dnd-link"),
        (45, 50, "dnd-move"),
        (45, 50, "dnd-none"),
        (46, 46, "dotbox"),
        (46, 46, "fd_double_arrow"),
        (48, 50, "grabbing"),
        (47.6, 28, "hand1"),
        (36, 20, "hand2"),
        (27, 15, "left_ptr"),
        (23.2, 13.2, "left_ptr_watch"),
        (24, 50, "left_side"),
        (28, 48, "left_tee"),
        (19, 11.4, "link"),
        (21, 67, "ll_angle"),
        (72, 67, "lr_angle"),
        (19, 11, "move"),
        (28.6, 82.6, "pencil"),
        (48, 48, "plus"),
        (46, 80, "question_arrow"),
        (65, 16, "right_ptr"),
        (76, 50, "right_side"),
        (72, 48, "right_tee"),
        (50, 72, "sb_down_arrow"),
        (47, 46, "sb_h_double_arrow"),
        (24, 45.6, "sb_left_arrow"),
        (75, 45, "sb_right_arrow"),
        (51, 17, "sb_up_arrow"),
        (45, 45, "sb_v_double_arrow"),
        (50, 46, "tcross"),
        (21, 21, "top_left_corner"),
        (72, 21, "top_right_corner"),
        (50, 20, "top_side"),
        (48, 24, "top_tee"),
        (22, 25, "ul_angle"),
        (72, 25, "ur_angle"),
        (48, 46, "watch"),
        (50, 50, "xterm"),
    )

    """Genrate CursorList"""

    content="""
00000000000000020006000e7e9ffc3f progress
00008160000006810000408080010102 size_ver
03b6e0fcb3499374a867c041f52298f0 circle
08e8e1c95fe2fc01f976f1e063a24ccd progress
3ecb610c1bf2410f44200f48c40d3599 progress
5c6cd98b3f3ebcb1f9c7f1c204630408 help
9d800788f1b08800ae810202380a0822 pointer
640fb0e74195791501fd1ed57b41487f alias
1081e37283d90000800003c07f3ef6bf copy
3085a0e285430894940527032f8b26df alias
4498f0e0c1937ffe01fd06f973665830 dnd-move
6407b0e94181790501fd1e167b474872 copy
9081237383d90e509aa00f00170e968f dnd-move
a2a266d0498c3104214a47bd64ab0fc8 alias
b66166c04f8c3109214a4fbd64a50fc8 copy
d9ce0ab605698f320427677b458ad60b help
e29285e634086352946a0e7090d73106 pointer
fcf21c00b30f7e3f83fe0dfd12e71cff dnd-move
alias copy
all-scroll fleur
bottom_left_corner size_bdiag
bottom_right_corner size_fdiag
cell crosshair
center_ptr default
circle not-allowed
closedhand dnd-move
col-resize size_hor
color-picker crosshair
context-menu default
copy dnd-move
cross crosshair
tcross crosshair
crossed_circle not-allowed
dnd-copy copy
dnd-none dnd-move
dnd-no-drop not-allowed
draft pencil
e-resize size_hor
forbidden no-drop
h_double_arrow size_hor
half-busy progress
hand1 pointer
hand2 pointer
help default
ibeam text
left_ptr default
left_ptr_help help
left_ptr_watch progress
left_side left-arrow
link alias
move dnd-move
n-resize size-ver
no-drop not-allowed
plus cell
pointing_hand pointer
question_arrow help
right_ptr default
right_side right-arrow
row-resize size_ver
s-resize size_ver
sb_h_double_arrow size_hor
sb_v_double_arrow size_ver
size_all fleur
split_h col-resize
split_v row-resize
top_left_corner size_fdiag
top_right_corner size_bdiag
top_side up-arrow
v_double_arrow size_ver
vertical-text text
w-resize size_hor
watch wait
whats_this help
xterm text
dnd-move default
down-arrow default
crosshair default
fleur default
left-arrow default
not-allowed default
openhand default
pencil default
pirate default
pointer default
progress default
right-arrow default
size-bdiag default
size-fdiag default
size-hor default
size-ver default
text default
up-arrow default
wait default
x-cursor default
wayland-cursor default
zoom-in default
zoom-out default
ne-resize size_bdiag
sw-resize size_bdiag
nw-resize size_fdiag
se-resize size_fdiag
"""

    #create build/config directory
    os.system("mkdir -p build/config")

    #create & write hotspot
    for file_ in files:
        with open("build/config/%s.cursor" % file_[2], "w") as f:
            for size in (24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96):
                f.write("{size} {xhot} {yhot} {size}x{size}/{file_}.png\n".format(
                    size = size,
                    xhot = round(file_[0] / 96 * size),
                    yhot = round(file_[1] / 96 * size),
                    file_= file_[2]
                ))

    #create CursorList
    fileCursorList=open("build/cursorList","w")
    fileCursorList.write(content)
    fileCursorList.close()

    dbg('\n\nConfig successfully generated\n')

    os.system("mkdir -p %s/cursors"%(options.name))

    for filepath in glob.iglob('build/config/*.cursor'):
        base=os.path.basename(filepath)
        base=os.path.splitext(base)[0]
        print('Genrating %s'%(base))
        rc = os.system('xcursorgen -p build/%s/pngs "%s" "%s/cursors/%s"' % (options.name, filepath,options.name, base))
        if rc > 0:
            fatalError('\n\nABORTING: Xcursorgen failed to generate the cursor.\n')
            fatalError('\nFAIL: %s %s \n'%(filepath, rc))
    
    try:
        cursor_config=open('build/cursorList', 'r')
        #change wrok dir for symblink
        os.chdir('%s/cursors'%(options.name))
        while cursor_config.readline():
            line = cursor_config.readline()
            line=line.strip('\n')
            # print(line)
            fromlink, tolink =line.split(' ', 1)
           
            if os.path.exists(fromlink):
                continue

            print('Linking %s -> %s'%(fromlink, tolink))
            symlink(tolink, fromlink)
            
        cursor_config.close()
    except FileNotFoundError:
        fatalError('\n\nFAIL: cursorList does not exist\n')
        print('FAIL: cursorList does not exist')
    
    dbg('\n\nCursor build complete.\n')

    #create .theme files
    #go to parent directory here is Options.name
    os.chdir('..')
    #cursor.theme content
    print('\n\nCreating indexing...')
    fileCursorTheme = open('cursor.theme','w')
    fileCursorTheme.write('[Icon Theme]\n')
    fileCursorTheme.write('Name=%s\n'%(options.name))
    fileCursorTheme.write('Inherits=%s\n'%(options.inherit))
    fileCursorTheme.close()
    #index.theme content
    fileIndexTheme = open('index.theme','w')
    fileIndexTheme.write('[Icon Theme]\n')
    fileIndexTheme.write('Name=%s\n'%(options.name))

    for lang in ('ar','bg','ca','cs','da','de','dz','el','en_CA','en_GB','eo','es','et','eu','fi','fr','ga','gl','gu','he','hr','hu','id','it','ja','km','ko','lt','mk','ms','nb','ne','nl','pa','pl','pt_BR','pt','ro','ru','rw','sk','sr_Latn','sr','sv','tr','tt','uk','vi','xh','yi','zh_CN','zh_TW'):
        fileIndexTheme.write('Name[%s]=%s\n'%(lang, options.name))
    fileIndexTheme.write('Comment=%s cursor theme'%(options.name))
    fileIndexTheme.close()
    print('\nCreating indexing... DONE')
    dbg('\n\nCursor indexing complete.\n')
