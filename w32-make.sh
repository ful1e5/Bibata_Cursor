#!/bin/sh

#get theme name from argument
THEME=$1
#current Directory path
DIR="../"

# $@ is for the caller to be able to supply arguments to anicursorgen (-s, in particular)

GEN=../anicursorgen.py\ "$@"

# enter bitmaps folder
cd bitmaps

if [ ! -d "$DIR/$THEME/win" ]; then
	mkdir -p $DIR/$THEME/win
fi

${GEN} --no-shadows tcross$s.in $DIR/$THEME/win/tcross.cur
${GEN} all-scroll$s.in $DIR/$THEME/win/all-scroll.cur
# ${GEN} based_arrow_down$s.in $DIR/$THEME/win/based_arrow_down.cur
# ${GEN} based_arrow_up$s.in $DIR/$THEME/win/based_arrow_up.cur
${GEN} bd_double_arrow$s.in $DIR/$THEME/win/bd_double_arrow.cur
${GEN} bottom_left_corner$s.in $DIR/$THEME/win/bottom_left_corner.cur
${GEN} bottom_right_corner$s.in $DIR/$THEME/win/bottom_right_corner.cur
${GEN} bottom_side$s.in $DIR/$THEME/win/bottom_side.cur
${GEN} bottom_tee$s.in $DIR/$THEME/win/bottom_tee.cur
# ${GEN} center_ptr$s.in $DIR/$THEME/win/center_ptr.cur
${GEN} circle$s.in $DIR/$THEME/win/circle.cur
${GEN} context-menu$s.in $DIR/$THEME/win/context-menu.cur
${GEN} copy$s.in $DIR/$THEME/win/copy.cur
${GEN} cross$s.in $DIR/$THEME/win/cross.cur
${GEN} crossed_circle$s.in $DIR/$THEME/win/crossed_circle.cur
${GEN} crosshair$s.in $DIR/$THEME/win/cell.cur
${GEN} dnd-ask$s.in $DIR/$THEME/win/dnd-ask.cur
${GEN} dnd-copy$s.in $DIR/$THEME/win/dnd-copy.cur
${GEN} dnd-link$s.in $DIR/$THEME/win/dnd-link.cur
${GEN} dnd-move$s.in $DIR/$THEME/win/dnd-move.cur
${GEN} dnd-no-drop$s.in $DIR/$THEME/win/dnd-no-drop.cur
${GEN} dnd-none$s.in $DIR/$THEME/win/dnd-none.cur
${GEN} dotbox$s.in $DIR/$THEME/win/dotbox.cur
${GEN} fd_double_arrow$s.in $DIR/$THEME/win/fd_double_arrow.cur
${GEN} grabbing$s.in $DIR/$THEME/win/grabbing.cur
${GEN} hand1$s.in $DIR/$THEME/win/hand1.cur
${GEN} hand2$s.in $DIR/$THEME/win/hand2.cur
${GEN} left_ptr$s.in $DIR/$THEME/win/left_ptr.cur
${GEN} left_ptr_watch$s.in $DIR/$THEME/win/left_ptr_watch.ani
${GEN} left_side$s.in $DIR/$THEME/win/left_side.cur
${GEN} left_tee$s.in $DIR/$THEME/win/left_tee.cur
${GEN} link$s.in $DIR/$THEME/win/link.cur
${GEN} ll_angle$s.in $DIR/$THEME/win/ll_angle.cur
${GEN} lr_angle$s.in $DIR/$THEME/win/lr_angle.cur
${GEN} move$s.in $DIR/$THEME/win/move.cur
${GEN} pencil$s.in $DIR/$THEME/win/pencil.cur
${GEN} plus$s.in $DIR/$THEME/win/plus.cur
${GEN} pointer-move$s.in $DIR/$THEME/win/pointer-move.cur
${GEN} question_arrow$s.in $DIR/$THEME/win/question_arrow.cur
${GEN} right_ptr$s.in $DIR/$THEME/win/right_ptr.cur
${GEN} right_side$s.in $DIR/$THEME/win/right_side.cur
${GEN} right_tee$s.in $DIR/$THEME/win/right_tee.cur
${GEN} sb_down_arrow$s.in $DIR/$THEME/win/sb_down_arrow.cur
${GEN} sb_h_double_arrow$s.in $DIR/$THEME/win/sb_h_double_arrow.cur
${GEN} sb_left_arrow$s.in $DIR/$THEME/win/sb_left_arrow.cur
${GEN} sb_right_arrow$s.in $DIR/$THEME/win/sb_right_arrow.cur
${GEN} sb_up_arrow$s.in $DIR/$THEME/win/sb_up_arrow.cur
${GEN} sb_v_double_arrow$s.in $DIR/$THEME/win/sb_v_double_arrow.cur
${GEN} top_left_corner$s.in $DIR/$THEME/win/top_left_corner.cur
${GEN} top_right_corner$s.in $DIR/$THEME/win/top_right_corner.cur
${GEN} top_side$s.in $DIR/$THEME/win/top_side.cur
${GEN} top_tee$s.in $DIR/$THEME/win/top_tee.cur
${GEN} ul_angle$s.in $DIR/$THEME/win/ul_angle.cur
${GEN} ur_angle$s.in $DIR/$THEME/win/ur_angle.cur
${GEN} vertical-text$s.in $DIR/$THEME/win/vertical-text.cur
${GEN} watch$s.in $DIR/$THEME/win/watch.ani
${GEN} X_cursor$s.in $DIR/$THEME/win/X_cursor.cur
${GEN} xterm$s.in $DIR/$THEME/win/xterm.cur
${GEN} zoom-in$s.in $DIR/$THEME/win/zoom-in.cur
${GEN} zoom-out$s.in $DIR/$THEME/win/zoom-out.cur

# go back up
cd ..