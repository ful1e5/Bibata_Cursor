#!/bin/sh

# get theme name from argument
THEME=$1
# current Directory path
DIR="../.."

# enter bitmaps folder
cd $1/bitmaps

# if cursors folder doesn't exist
if [ ! -d "$DIR/"$THEME"/out/X11/"$THEME"/cursors" ]; then
	mkdir -p $DIR/"$THEME"/out/X11/"$THEME"/cursors
fi

xcursorgen crossed_circle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/03b6e0fcb3499374a867c041f52298f0
xcursorgen left_ptr_watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/3ecb610c1bf2410f44200f48c40d3599
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/5c6cd98b3f3ebcb1f9c7f1c204630408
xcursorgen left_ptr_watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/08e8e1c95fe2fc01f976f1e063a24ccd
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/9d800788f1b08800ae810202380a0822
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/14fef782d02440884392942c11205230
xcursorgen link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/640fb0e74195791501fd1ed57b41487f
xcursorgen copy.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/1081e37283d90000800003c07f3ef6bf
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/2870a09082c103050810ffdffffe0204
xcursorgen link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/3085a0e285430894940527032f8b26df
xcursorgen move.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/4498f0e0c1937ffe01fd06f973665830
xcursorgen copy.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/6407b0e94181790501fd1e167b474872
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/028006030e0e7ebffc7f7070c0600140
xcursorgen move.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/9081237383d90e509aa00f00170e968f
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/00008160000006810000408080010102
xcursorgen dnd-link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/alias
xcursorgen all-scroll.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/all-scroll
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/arrow
# xcursorgen based_arrow_down.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/based_arrow_down
# xcursorgen based_arrow_up.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/based_arrow_up
xcursorgen bd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/bd_double_arrow
xcursorgen bottom_left_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/bottom_left_corner
xcursorgen bottom_right_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/bottom_right_corner
xcursorgen bottom_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/bottom_side
xcursorgen bottom_tee.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/bottom_tee
xcursorgen bd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/c7088f0f3e6c8088236ef8e1e3e70000
xcursorgen plus.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/cell
# xcursorgen center_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/center_ptr
xcursorgen circle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/circle
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/col-resize
xcursorgen context-menu.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/context-menu
xcursorgen copy.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/copy
xcursorgen cross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/cross
xcursorgen crossed_circle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/crossed_circle
xcursorgen cross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/crosshair
xcursorgen cross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/cross_reverse
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/d9ce0ab605698f320427677b458ad60b
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/default
xcursorgen cross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/diamond_cross
xcursorgen dnd-ask.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-ask
xcursorgen dnd-copy.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-copy
xcursorgen dnd-link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-link
xcursorgen dnd-move.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-move
xcursorgen dnd-no-drop.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-no-drop
xcursorgen dnd-none.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dnd-none
xcursorgen dotbox.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dotbox
xcursorgen dotbox.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/dot_box_mask
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/double_arrow
xcursorgen right_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/draft_large
xcursorgen right_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/draft_small
xcursorgen dotbox.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/draped_box
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/e29285e634086352946a0e7090d73106
xcursorgen right_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/e-resize
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ew-resize
xcursorgen fd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/fcf1c3c7cd4491d801f1e1c78f100000
xcursorgen fd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/fd_double_arrow
xcursorgen all-scroll.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/fleur
xcursorgen hand1.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/grab
xcursorgen grabbing.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/grabbing
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/hand
xcursorgen hand1.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/hand1
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/hand2
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/h_double_arrow
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/help
xcursorgen dotbox.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/icon
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left_ptr_help
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left_ptr
xcursorgen left_ptr_watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left_ptr_watch
xcursorgen left_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left_side
xcursorgen left_tee.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left_tee
xcursorgen link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/link
xcursorgen ll_angle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ll_angle
xcursorgen lr_angle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/lr_angle
xcursorgen move.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/move
xcursorgen top_right_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ne-resize
xcursorgen fd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/nesw-resize
xcursorgen dnd-no-drop.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/no-drop
xcursorgen crossed_circle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/not-allowed
xcursorgen top_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/n-resize
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ns-resize
xcursorgen top_left_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/nw-resize
xcursorgen bd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/nwse-resize
xcursorgen pencil.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/pencil
xcursorgen X_cursor.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/pirate
xcursorgen plus.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/plus
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/pointer
xcursorgen pointer-move.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/pointer-move
xcursorgen left_ptr_watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/progress
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/question_arrow
xcursorgen right_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/right_ptr
xcursorgen right_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/right_side
xcursorgen right_tee.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/right_tee
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/row-resize
xcursorgen sb_down_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_down_arrow
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_h_double_arrow
xcursorgen sb_left_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_left_arrow
xcursorgen sb_right_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_right_arrow
xcursorgen sb_up_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_up_arrow
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sb_v_double_arrow
xcursorgen bottom_right_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/se-resize
xcursorgen all-scroll.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size_all
xcursorgen fd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size_bdiag
xcursorgen bd_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size_fdiag
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size_hor
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size_ver
xcursorgen bottom_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/s-resize
xcursorgen bottom_left_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/sw-resize
xcursorgen dotbox.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/target
xcursorgen tcross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/tcross
xcursorgen xterm.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/text
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/top_left_arrow
xcursorgen top_left_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/top_left_corner
xcursorgen top_right_corner.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/top_right_corner
xcursorgen top_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/top_side
xcursorgen top_tee.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/top_tee
xcursorgen ul_angle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ul_angle
xcursorgen ur_angle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ur_angle
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/v_double_arrow
xcursorgen vertical-text.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/vertical-text
xcursorgen watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/wait
xcursorgen watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/watch
xcursorgen left_side.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/w-resize
xcursorgen X_cursor.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/X_cursor
xcursorgen xterm.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/xterm
xcursorgen zoom-in.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/zoom-in
xcursorgen zoom-out.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/zoom-out

# KDE Cursor Links
xcursorgen left_ptr_watch.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/00000000000000020006000e7e9ffc3f 
xcursorgen link.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/a2a266d0498c3104214a47bd64ab0fc8 
xcursorgen copy.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/b66166c04f8c3109214a4fbd64a50fc8 
xcursorgen center_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/center_ptr
xcursorgen dnd-none.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/closedhand
xcursorgen tcross.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/color-picker
xcursorgen pencil.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/draft
xcursorgen sb_down_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/down-arrow
xcursorgen dnd-none.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/fcf21c00b30f7e3f83fe0dfd12e71cff
xcursorgen circle.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/forbidden
xcursorgen xterm.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/ibeam
xcursorgen sb_left_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/left-arrow
xcursorgen hand1.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/openhand
xcursorgen hand2.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/pointing_hand
xcursorgen sb_right_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/right-arrow
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size-bdiag
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size-fdiag
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size-hor
xcursorgen left_ptr.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/size-ver
xcursorgen sb_h_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/split_h
xcursorgen sb_v_double_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/split_v
xcursorgen sb_up_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/up-arrow
xcursorgen question_arrow.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/whats_this
xcursorgen wayland-cursor.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/wayland-cursor
xcursorgen X_cursor.in $DIR/"$THEME"/out/X11/"$THEME"/cursors/x-cursor


#if script generate error or success
if [ $? -ne 0 ]
    then
		exit 1
fi
# go back up two
cd ../../