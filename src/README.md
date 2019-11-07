## Cursor Theme Source

- Do not edit cursor assets directly (i.e. those in the "Suru" folder)! 
- To modify the cursors, edit source SVG file found in this directory and render them with the appropriate script.
- To edit the cursors you will need `inkscape` installed and to build and the render the cursor set you'll need `python-pil` and `x11-apps` installed.

## Render Scripts

For simplified development, has various scripts to render and build the cursor set are provided

 - [**render-cursors.py**](./render-cursors.py) will render the cursor PNG assets into [bitmaps](./bitmaps) at the appropriate sizes; ran by passing the source filename to it: `./render-cursors.py source-cursors.svg`
 - [**x11-make.sh**](./x11-make.sh) builds the cursor assets into a Xcursor set
 - [**w32-make.sh**](./w32-make.sh) builds the cursor assets into a Windows cursor set

## Cursor SVG source

The [source SVG](./source-cursors.svg) for the cursors is laid out in such a way to make editing/creating cursors simple, with a variety of layers:

 - `hotspots` shows the exact point where the cursor is active within the 24x24 region (hidden by default)
 - `slices` is read by the render script and each 24x24 square had an ID that is the cursor file name (hidden by default)
 - `cursors` pretty self-explanatory, these are the drawn cursors
 - `labels` are just labels

Both the busy cursors (the large and pointer versions) require 60 different assets to achieve a 60 FPS animation when compiled (each variant is a 6&deg; rotation of the busy indicator).