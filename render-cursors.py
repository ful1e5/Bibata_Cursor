#!/usr/bin/env python3
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
optParser.add_option('--name',action='store',dest='name',help='Name of theme')
optParser.add_option('-d','--debug',action='store_true',dest='debug',help='Enable extra debugging info.')
optParser.add_option('-t','--test',action='store_true',dest='testing',help='Test mode: leave temporary files for examination.')
optParser.add_option('-p','--sliceprefix',action='store',dest='sliceprefix',help='Specifies the prefix to use for individual slice filenames.')
optParser.add_option('-r','--remove-shadows',action='store_true',dest='remove_shadows',help='Remove shadows the cursors have.')
optParser.add_option('-o','--hotspots',action='store_true',dest='hotspots',help='Produce hotspot images and hotspot datafiles.')
optParser.add_option('-s','--scales',action='store_true',dest='scales',help='Produce 125% (Large) and 150% (Extra Large) scaled versions of each image as well.')
optParser.add_option('-m','--min-canvas-size',action='store',type='int',dest='min_canvas_size',default=-1, help='Cursor canvas must be at least this big (defaults to -1).')
optParser.add_option('-f','--fps',action='store',type='int',dest='fps',default=60,help='Assume that all animated cursors have this FPS (defaults to 60).')
optParser.add_option('-a','--anicursorgen',action='store_true',dest='anicur',default=False,help='Assume that anicursorgen will be used to assemble cursors (xcursorgen is assumed by default).')
optParser.add_option('-c','--corner-align',action='store_true',dest='align_corner',default=False,help='Align cursors to the top-left corner (by default they are centered).')
optParser.add_option('-i','--invert',action='store_true',dest='invert',default=False,help='Invert colors (disabled by default).')
optParser.add_option('-n','--number-of-renderers',action='store',type='int',dest='number_of_renderers',default=1, help='Number of renderer instances run in parallel. Defaults to 1. Set to 0 for autodetection.')

from xml.sax import saxutils, make_parser, SAXParseException, handler, xmlreader
from xml.sax.handler import feature_namespaces
import os, sys, tempfile, shutil, subprocess
import re
from threading import Thread
from PIL import Image
import multiprocessing
import io

svgFilename = None
hotsvgFilename = None
#sizes = [24,32,48,64,96]
sizes = [24,28,32,40,48,56,64,72,80,88,96]
scale_pairs = [(1.25, 's1'), (1.50, 's2')]
mode_shadows = ['shadows']
mode_hotspots = ['hotspots']
mode_slices = ['slices']
mode_invert = ['invert']

def natural_sort(l):
	convert = lambda text: int(text) if text.isdigit() else text.lower()
	alphanum_key = lambda key: [ convert(c) for c in re.split(b'([0-9]+)', key) ]
	return sorted(l, key = alphanum_key)

def dbg(msg):
	if options.debug:
		sys.stderr.write(msg+'\n')

def cleanup():
	global inkscape_instances
	for inkscape, inkscape_stderr, inkscape_stderr_thread in inkscape_instances:
		inkscape.communicate (('quit\n').encode())
		del inkscape
		del inkscape_stderr_thread
		del inkscape_stderr
	del inkscape_instances
	if svgFilename != None and os.path.exists(svgFilename):
		os.unlink(svgFilename)
	if hotsvgFilename != None and os.path.exists(hotsvgFilename):
		os.unlink(hotsvgFilename)

def fatalError(msg):
	sys.stderr.write(msg)
	cleanup()
	sys.exit(20)

def stderr_reader(inkscape, inkscape_stderr):
	try:
		while True:
			line = inkscape_stderr.readline()
			if line and len (line.rstrip ('\n').rstrip ('\r')) > 0:
				fatalError('ABORTING: Inkscape failed to render a slice: {}'.format (line))
			elif line:
				print (("STDERR> {}".format (line)))
			else:
				raise EOFError
	except EOFError as error:
		print(error)

def find_hotspot (hotfile):
	img = Image.open(hotfile)
	pixels = img.load()
	reddest = [-1, -1, -999999]
	for y in range(img.size[1]):
		for x in range(img.size[0]):
			redness = pixels[x,y][0] - pixels[x,y][1] - pixels[x,y][2]
			if redness > reddest[2]:
				reddest = [x, y, redness]
	return (reddest[0] + 1, reddest[1] + 1)

def cropalign (size, filename):
	img = Image.open (filename)
	content_dimensions = img.getbbox ()
	if content_dimensions is None:
		content_dimensions = (0, 0, img.size[0], img.size[1])
	hcropped = content_dimensions[2] - content_dimensions[0]
	vcropped = content_dimensions[3] - content_dimensions[1]
	if hcropped > size or vcropped > size:
		if hcropped > size:
			left = (hcropped - size) / 2
			right = (hcropped - size) - left
		else:
			left = 0
			right = 0
		if vcropped > size:
			top = (vcropped - size) / 2
			bottom = (vcropped - size) - top
		else:
			top = 0
			bottom = 0
		content_dimensions = (content_dimensions[0] + left, content_dimensions[1] + top, content_dimensions[2] - right, content_dimensions[3] - bottom)
		sys.stderr.write ("WARNING: {} is too big to be cleanly cropped to {} ({}x{} at best), cropping to {}x{}!\n".format (filename, size, hcropped, vcropped, content_dimensions[2] - content_dimensions[0], content_dimensions[3] - content_dimensions[1]))
		sys.stderr.flush ()
	if options.testing:
		img.save (filename + ".orig.png", "png")
	dbg("{} content is {} {} {} {}".format (filename, content_dimensions[0], content_dimensions[1], content_dimensions[2], content_dimensions[3]))
	cropimg = img.crop ((content_dimensions[0], content_dimensions[1], content_dimensions[2], content_dimensions[3]))
	pixels = cropimg.load ()
	if options.testing:
		cropimg.save (filename + ".crop.png", "png")
	if options.align_corner:
		expimg = cropimg.crop ((0, 0, size, size))
		result = (content_dimensions[0], content_dimensions[1])
	else:
		hslack = size - cropimg.size[0]
		vslack = size - cropimg.size[1]
		left = hslack / 2
		top = vslack / 2
		expimg = cropimg.crop ((-left, -top, size - left, size - top))
		result = (content_dimensions[0] - left, content_dimensions[1] - top)
	pixels = expimg.load ()
	if options.invert:
		negative (expimg)
	expimg.save (filename, "png")
	del cropimg
	del img
	return result

def cropalign_hotspot (new_base, size, filename):
	if new_base is None:
		return
	img = Image.open (filename)
	expimg = img.crop ((new_base[0], new_base[1], new_base[0] + size, new_base[1] + size))
	pixels = expimg.load ()
	expimg.save (filename, "png")
	del img

def negative (img):
	pixels = img.load ()
	for y in range (0, img.size[1]):
		for x in range (0, img.size[0]):
			r, g, b, a = pixels[x,y]
			pixels[x,y] = (255 - r, 255 - g, 255 - b, a)

class SVGRect:
	"""Manages a simple rectangular area, along with certain attributes such as a name"""
	def __init__(self, x1,y1,x2,y2, name=None):
		self.x1 = x1
		self.y1 = y1
		self.x2 = x2
		self.y2 = y2
		self.name = name
		dbg("New SVGRect: (%s)" % name)
	
	def renderFromSVG(self, svgFName, slicename, skipped, roundrobin, hotsvgFName):

		def do_res (size, output, svgFName, skipped, roundrobin):
			global inkscape_instances
			if os.path.exists (output):
				skipped[output] = True
				return
			command = '-w {size} -h {size} --export-id="{export_id}" --export-png="{export_png}" {svg}\n'.format (size=size, export_id=self.name, export_png=output, svg=svgFName)
			dbg("Command: {}".format (command))
			inkscape_instances[roundrobin[0]][0].stdin.write ((command).encode())

		pngsliceFName = slicename + '.png'
		hotsliceFName = slicename + '.hotspot.png'
		
		dbg('Saving slice as: "%s"' % pngsliceFName)
		for i, size in enumerate (sizes):
			subdir = '{}/bitmaps/{}x{}'.format (options.name, size, size)
			if not os.path.exists (subdir):
				os.makedirs (subdir)
			relslice = '{}/{}'.format (subdir, pngsliceFName)
			do_res (size, relslice, svgFName, skipped, roundrobin)
			if options.hotspots:
				hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
				do_res (size, hotrelslice, hotsvgFName, skipped, roundrobin)
			for scale in scale_pairs:
				subdir = '{}/bitmaps/{}x{}_{}'.format (options.name, size, size, scale[1])
				relslice = '{}/{}'.format (subdir, pngsliceFName)
				if not os.path.exists (subdir):
					os.makedirs (subdir)
				scaled_size = int (size * scale[0])
				do_res (scaled_size, relslice, svgFName, skipped, roundrobin)
				if options.hotspots:
					hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
					do_res (scaled_size, hotrelslice, hotsvgFName, skipped, roundrobin)
			# This is not inside do_res() because we want each instance to work all scales in case scales are enabled,
			# otherwise instances that get mostly smallscale renders will finish up way before the others
			roundrobin[0] += 1
			if roundrobin[0] >= options.number_of_renderers:
				roundrobin[0] = 0

def get_next_size (index, current_size):
	if index % 2 == 0:
		# 24->32, 48->64, 96->128, 192->256
		return (current_size * 4) / 3
	else:
		# 32->48, 64->96, 128->192, 256->384
		return (current_size * 3) / 2

def get_csize (index, current_size):
	size = current_size
	if len (scale_pairs) > 0:
		size = get_next_size (index, size)
	return max (options.min_canvas_size, size)

def postprocess_slice (slicename, skipped):
	pngsliceFName = slicename + '.png'
	hotsliceFName = slicename + '.hotspot.png'
	
	for i, size in enumerate (sizes):
		subdir = '{}/bitmaps/{}x{}'.format (options.name, size, size)
		relslice = '{}/{}'.format (subdir, pngsliceFName)
		csize = get_csize (i, size)
		if relslice not in skipped:
			# new_base = cropalign (csize, relslice)
			if options.hotspots:
				hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
				# cropalign_hotspot (new_base, csize, hotrelslice)
		for scale in scale_pairs:
			subdir = '{}/bitmaps/{}x{}_{}'.format (options.name, size, size, scale[1])
			relslice = '{}/{}'.format (subdir, pngsliceFName)
			if relslice not in skipped:
				# new_base = cropalign (csize, relslice)
				if options.hotspots:
					hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
					# cropalign_hotspot (new_base, csize, hotrelslice)

def write_xcur(slicename):
	pngsliceFName = slicename + '.png'
	hotsliceFName = slicename + '.hotspot.png'

	framenum = -1
	if slicename[-5:].startswith ('_'):
		try:
			framenum = int (slicename[-4:])
			slicename = slicename[:-5]
		except:
			pass

	# This relies on the fact that frame 1 is the first frame of an animation in the rect list
	# If that is not so, the *icongen input file will end up missing some of the lines
	if framenum == -1 or framenum == 1:
		mode = 'wb'
	else:
		mode = 'ab'
	if framenum == -1:
		fps_field = ''
	else:
		if options.anicur:
			# For anicursorgen use jiffies
			fps_field = ' {}'.format (int (60.0 / options.fps))
		else:
			# For xcursorgen use milliseconds
			fps_field = ' {}'.format (int (1000.0 / options.fps))
	xcur = {}
	xcur['s0'] = open ('{}/bitmaps/{}.in'.format (options.name, slicename), mode)
	if len (scale_pairs) > 0:
		xcur['s1'] = open ('{}/bitmaps/{}.s1.in'.format (options.name, slicename), mode)
		xcur['s2'] = open ('{}/bitmaps/{}.s2.in'.format (options.name, slicename), mode)
	for i, size in enumerate (sizes):
		subdir = '{}/bitmaps/{}x{}'.format (options.name, size, size)
		relslice = '{}/{}'.format (subdir, pngsliceFName)
		hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
		hot = find_hotspot (hotrelslice)
		csize = get_csize (i, size)
		xcur['s0'].write ("{csize} {hotx} {hoty} {filename}{fps_field}\n".format (csize=csize, hotx=hot[0], hoty=hot[1], filename='{}x{}/{}'.format (size, size, pngsliceFName), fps_field=fps_field).encode())
		for scale in scale_pairs:
			subdir = '{}/bitmaps/{}x{}_{}'.format (options.name, size, size, scale[1])
			relslice = '{}/{}'.format (subdir, pngsliceFName)
			scaled_size = int (size * scale[0])
			hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
			hot = find_hotspot (hotrelslice)
			xcur[scale[1]].write ("{csize} {hotx} {hoty} {filename}{fps_field}\n".format (csize=csize, hotx=hot[0], hoty=hot[1], filename='{}x{}_{}/{}'.format (size, size, scale[1], pngsliceFName), fps_field=fps_field))
	xcur['s0'].close ()
	if len (scale_pairs) > 0:
		xcur['s1'].close ()
		xcur['s2'].close ()

def sort_file(filename):
	with open (filename, 'rb') as src:
		contents = src.readlines ()
	with open (filename, 'wb') as dst:
		for line in natural_sort (contents):
			dst.write (line)

def sort_xcur(slicename, passed):
	pngsliceFName = slicename + '.png'

	framenum = -1
	if slicename[-5:].startswith ('_'):
		try:
			framenum = int (slicename[-4:])
			slicename = slicename[:-5]
		except:
			pass
	if slicename in passed:
		return
	passed[slicename] = True

	sort_file ('{}/bitmaps/{}.in'.format (options.name, slicename))
	if len (scale_pairs) > 0:
		sort_file ('{}/bitmaps/{}.s1.in'.format (options.name, slicename))
		sort_file ('{}/bitmaps/{}.s2.in'.format (options.name, slicename))

def delete_hotspot(slicename):
	hotsliceFName = slicename + '.hotspot.png'
	
	for i, size in enumerate (sizes):
		subdir = '{}/bitmaps/{}x{}'.format (options.name, size, size)
		hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
		if os.path.exists (hotrelslice):
			os.unlink (hotrelslice)
		for scale in scale_pairs:
			subdir = '{}/bitmaps/{}x{}_{}'.format (options.name, size, size, scale[1])
			hotrelslice = '{}/{}'.format (subdir, hotsliceFName)
			if os.path.exists (hotrelslice):
				os.unlink (hotrelslice)

class SVGHandler(handler.ContentHandler):
	"""Base class for SVG parsers"""
	def __init__(self):
		self.pageBounds = SVGRect(0,0,0,0)

	def isFloat(self, stringVal):
		try:
			return (float(stringVal), True)[1]
		except (ValueError, TypeError) as e:
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

class SVGFilter (saxutils.XMLFilterBase):
	def __init__ (self, upstream, downstream, mode, **kwargs):
		saxutils.XMLFilterBase.__init__(self, upstream)
		self._downstream = downstream
		self.mode = mode

	def startDocument (self):
		self.in_throwaway_layer_stack = [False]

	def startElement (self, localname, attrs):
		def modify_style (style, old_style, new_style=None):
			styles = style.split (';')
			new_styles = []
			if old_style is not None:
				match_to = old_style + ':'
			for s in styles:
				if len (s) > 0 and (old_style is None or not s.startswith (match_to)):
					new_styles.append (s)
			if new_style is not None:
				new_styles.append (new_style)
			return ';'.join (new_styles)

		dict = {}
		is_throwaway_layer = False
		is_slices = False
		is_hotspots = False
		is_shadows = False
		is_layer = False
		if localname == 'g':
			for key, value in attrs.items ():
				if key == 'inkscape:label':
					if value == 'slices':
						is_slices = True
					elif value == 'hotspots':
						is_hotspots = True
					elif value == 'shadows':
						is_shadows = True
				elif key == 'inkscape:groupmode':
					if value == 'layer':
						is_layer = True
		if mode_shadows in self.mode and is_shadows:
			# Only remove the shadows
			is_throwaway_layer = True
		elif mode_hotspots in self.mode and not (is_hotspots or is_slices):
			# Remove all layers but hotspots and slices
			if localname == 'g':
				is_throwaway_layer = True
		idict = {}
		idict.update (attrs)
		if 'style' not in attrs.keys ():
			idict['style'] = ''
		for key, value in idict.items():
			alocalname = key
			if alocalname == 'style':
				had_style = True
			if alocalname == 'style' and is_slices:
				# Make slices invisible. Do not check the mode, because there is
				# no circumstances where we *want* to render slices
				value = modify_style (value, 'display', 'display:none')
			if alocalname == 'style' and is_hotspots:
				if mode_hotspots in self.mode:
					# Make hotspots visible in hotspots mode
					value = modify_style (value, 'display', 'display:inline')
				else:
					# Make hotspots invisible otherwise
					value = modify_style (value, 'display', 'display:none')
			if alocalname == 'style' and mode_invert in self.mode and is_layer and is_shadows:
				value = modify_style (value, None, 'filter:url(#InvertFilter)')
			dict[key] = value

		if self.in_throwaway_layer_stack[0] or is_throwaway_layer:
			self.in_throwaway_layer_stack.insert(0, True)
		else:
			self.in_throwaway_layer_stack.insert(0, False)
			attrs = xmlreader.AttributesImpl(dict)
			self._downstream.startElement(localname, attrs)

	def characters(self, content):
		if self.in_throwaway_layer_stack[0]:
			return
		self._downstream.characters(content)

	def endElement(self, localname):
		if self.in_throwaway_layer_stack.pop(0):
			return
		self._downstream.endElement(localname)

def filter_svg (input, output, mode):
	"""filter_svg(input:file, output:file, mode)
	
	Parses the SVG input from the input stream.
	For mode == 'hotspots' it filters out all
	layers except for hotspots and slices. Also makes hotspots
	visible.
	For mode == 'shadows' it filters out the shadows layer.
	"""

	mode_objs = []
	if 'hotspots' in mode:
		mode_objs.append (mode_hotspots)
	if 'shadows' in mode:
		mode_objs.append (mode_shadows)
	if 'slices' in mode:
		mode_objs.append (mode_slices)
	if 'invert' in mode:
		mode_objs.append (mode_invert)
	if len (mode_objs) == 0:
		raise ValueError()

	output_gen = saxutils.XMLGenerator(output)
	parser = make_parser()
	filter = SVGFilter(parser, output_gen, mode_objs)
	filter.setFeature(handler.feature_namespaces, False)
	filter.setErrorHandler(handler.ErrorHandler())
	# This little I/O dance is here to ensure that SAX parser does not stash away
	# an open file descriptor for the input file, which would prevent us from unlinking it later
	with open (input, 'rb') as inp:
		contents = inp.read ()
	contents_io = io.BytesIO (contents)
	source_object = saxutils.prepare_input_source (contents_io)
	filter.parse(source_object)
	del filter
	del parser
	del output_gen

def autodetect_threadcount ():
	try:
		count = multiprocessing.cpu_count()
	except NotImplementedError:
		count = 1
	return count

if __name__ == '__main__':
	# parse command line into arguments and options
	(options, args) = optParser.parse_args()

	if len(args) != 1:
		fatalError("\nCall me with the SVG as a parameter.\n\n")
	originalFilename = args[0]

	svgFilename = originalFilename + '.svg'
	hotsvgFilename = originalFilename + '.hotspots.svg'
	modes = ['slices']
	if options.remove_shadows:
		modes.append ('shadows')
	if options.invert:
		modes.append ('invert')

	with open (svgFilename, 'wb') as output:
		filter_svg(originalFilename, output, modes)

	if options.hotspots:
		with open (hotsvgFilename, 'wb') as output:
			filter_svg(originalFilename, output, ['hotspots'])
	# setup program variables from command line (in other words, handle non-option args)
	basename = os.path.splitext(svgFilename)[0]
	
	if options.sliceprefix:
		sliceprefix = options.sliceprefix
	else:
		sliceprefix = ''

	if not options.scales:
		del scale_pairs[:]

	if options.number_of_renderers <= 0:
		options.number_of_renderers = autodetect_threadcount ()

	inkscape_instances = []

	for i in range (0, options.number_of_renderers):
		inkscape = subprocess.Popen (['inkscape', '--without-gui', '--shell'], stdin=subprocess.PIPE, stderr=subprocess.PIPE)
		if inkscape is None:
			fatalError("Failed to start Inkscape shell process")
		inkscape_stderr = inkscape.stderr
		inkscape_stderr_thread = Thread (target = stderr_reader, args=(inkscape, inkscape_stderr))
		inkscape_instances.append ([inkscape, inkscape_stderr, inkscape_stderr_thread])

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
		fatalError("""No slices were found in this SVG file.  Please refer to the documentation for guidance on how to use this SVGSlice.  As a quick summary:

""" + usageMsg)
	else:
		dbg("Parsing successful.")
	
	#svgLayerHandler.generateXHTMLPage()
	del xmlParser

	skipped = {}
	roundrobin = [0]

	# loop through each slice rectangle, and render a PNG image for it
	svgLayerHandler.svg_rects
	for rect in svgLayerHandler.svg_rects:
		slicename = sliceprefix + rect.name
		rect.renderFromSVG(svgFilename, slicename, skipped, roundrobin, hotsvgFilename)

	cleanup()

	for rect in svgLayerHandler.svg_rects:
		slicename = sliceprefix + rect.name
		postprocess_slice(slicename, skipped)
		if options.hotspots:
			write_xcur(slicename)

	if options.hotspots:
		passed = {}
		for rect in svgLayerHandler.svg_rects:
			slicename = sliceprefix + rect.name
			sort_xcur(slicename, passed)
			#if not option.testing:
			#	delete_hotspot(slicename)
	print('\n')
	dbg('Slicing complete.')
