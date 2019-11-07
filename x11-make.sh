#!/bin/sh

THEME=Suru
DIR="../"

# enter bitmaps folder
cd bitmaps

# if cursors folder doesn't exist
if [ ! -d "$DIR/$THEME/cursors" ]; then
	mkdir -p $DIR/$THEME/cursors
fi

xcursorgen all-scroll.in $DIR/$THEME/cursors/all-scroll
# xcursorgen based_arrow_down.in $DIR/$THEME/cursors/based_arrow_down
# xcursorgen based_arrow_up.in $DIR/$THEME/cursors/based_arrow_up
xcursorgen bd_double_arrow.in $DIR/$THEME/cursors/bd_double_arrow
xcursorgen bottom_left_corner.in $DIR/$THEME/cursors/bottom_left_corner
xcursorgen bottom_right_corner.in $DIR/$THEME/cursors/bottom_right_corner
xcursorgen bottom_side.in $DIR/$THEME/cursors/bottom_side
xcursorgen bottom_tee.in $DIR/$THEME/cursors/bottom_tee
# xcursorgen center_ptr.in $DIR/$THEME/cursors/center_ptr
xcursorgen circle.in $DIR/$THEME/cursors/circle
xcursorgen context-menu.in $DIR/$THEME/cursors/context-menu
xcursorgen copy.in $DIR/$THEME/cursors/copy
xcursorgen cross.in $DIR/$THEME/cursors/cross
xcursorgen crossed_circle.in $DIR/$THEME/cursors/crossed_circle
xcursorgen crosshair.in $DIR/$THEME/cursors/cell
# xcursorgen crosshair.in $DIR/$THEME/cursors/crosshair
xcursorgen dnd-ask.in $DIR/$THEME/cursors/dnd-ask
xcursorgen dnd-copy.in $DIR/$THEME/cursors/dnd-copy
xcursorgen dnd-link.in $DIR/$THEME/cursors/dnd-link
xcursorgen dnd-move.in $DIR/$THEME/cursors/dnd-move
xcursorgen dnd-no-drop.in $DIR/$THEME/cursors/dnd-no-drop
xcursorgen dnd-none.in $DIR/$THEME/cursors/dnd-none
xcursorgen dotbox.in $DIR/$THEME/cursors/dotbox
xcursorgen fd_double_arrow.in $DIR/$THEME/cursors/fd_double_arrow
xcursorgen grabbing.in $DIR/$THEME/cursors/grabbing
xcursorgen hand1.in $DIR/$THEME/cursors/hand1
xcursorgen hand2.in $DIR/$THEME/cursors/hand2
xcursorgen left_ptr.in $DIR/$THEME/cursors/left_ptr
xcursorgen left_ptr_watch.in $DIR/$THEME/cursors/left_ptr_watch
xcursorgen left_side.in $DIR/$THEME/cursors/left_side
xcursorgen left_tee.in $DIR/$THEME/cursors/left_tee
xcursorgen link.in $DIR/$THEME/cursors/link
xcursorgen ll_angle.in $DIR/$THEME/cursors/ll_angle
xcursorgen lr_angle.in $DIR/$THEME/cursors/lr_angle
xcursorgen move.in $DIR/$THEME/cursors/move
xcursorgen pencil.in $DIR/$THEME/cursors/pencil
xcursorgen plus.in $DIR/$THEME/cursors/plus
xcursorgen pointer-move.in $DIR/$THEME/cursors/pointer-move
xcursorgen question_arrow.in $DIR/$THEME/cursors/question_arrow
xcursorgen right_ptr.in $DIR/$THEME/cursors/right_ptr
xcursorgen right_side.in $DIR/$THEME/cursors/right_side
xcursorgen right_tee.in $DIR/$THEME/cursors/right_tee
xcursorgen sb_down_arrow.in $DIR/$THEME/cursors/sb_down_arrow
xcursorgen sb_h_double_arrow.in $DIR/$THEME/cursors/sb_h_double_arrow
xcursorgen sb_left_arrow.in $DIR/$THEME/cursors/sb_left_arrow
xcursorgen sb_right_arrow.in $DIR/$THEME/cursors/sb_right_arrow
xcursorgen sb_up_arrow.in $DIR/$THEME/cursors/sb_up_arrow
xcursorgen sb_v_double_arrow.in $DIR/$THEME/cursors/sb_v_double_arrow
xcursorgen tcross.in $DIR/$THEME/cursors/tcross
xcursorgen top_left_corner.in $DIR/$THEME/cursors/top_left_corner
xcursorgen top_right_corner.in $DIR/$THEME/cursors/top_right_corner
xcursorgen top_side.in $DIR/$THEME/cursors/top_side
xcursorgen top_tee.in $DIR/$THEME/cursors/top_tee
xcursorgen ul_angle.in $DIR/$THEME/cursors/ul_angle
xcursorgen ur_angle.in $DIR/$THEME/cursors/ur_angle
xcursorgen vertical-text.in $DIR/$THEME/cursors/vertical-text
xcursorgen watch.in $DIR/$THEME/cursors/watch
xcursorgen X_cursor.in $DIR/$THEME/cursors/X_cursor
xcursorgen xterm.in $DIR/$THEME/cursors/xterm
xcursorgen zoom-in.in $DIR/$THEME/cursors/zoom-in
xcursorgen zoom-out.in $DIR/$THEME/cursors/zoom-out

# go back up one
cd ..