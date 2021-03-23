#!/usr/bin/env python
# -*- coding: utf-8 -*-

from typing import Dict

# Info
AUTHOR = "Kaiz Khatri"
URL = "https://github.com/ful1e5/Bibata_Cursor"

# XCursor
X_DELAY: int = 13

# Windows Cursor
WIN_DELAY = 1

X_CURSORS_CFG: Dict[str, Dict[str, int]] = {
    ##########
    # Static #
    ##########
    "bd_double_arrow.png": {"xhot": 98, "yhot": 100},
    "bottom_left_corner.png": {"xhot": 31, "yhot": 172},
    "bottom_right_corner.png": {"xhot": 170, "yhot": 172},
    "bottom_side.png": {"xhot": 100, "yhot": 164},
    "bottom_tee.png": {"xhot": 100, "yhot": 164},
    "center_ptr.png": {"xhot": 98, "yhot": 131},
    "circle.png": {"xhot": 48, "yhot": 25},
    "context-menu.png": {"xhot": 48, "yhot": 25},
    "copy.png": {"xhot": 48, "yhot": 25},
    "cross.png": {"xhot": 98, "yhot": 96},
    "crossed_circle.png": {"xhot": 100, "yhot": 100},
    "crosshair.png": {"xhot": 99, "yhot": 99},
    "dnd_no_drop.png": {"xhot": 86, "yhot": 79},
    "dnd-ask.png": {"xhot": 86, "yhot": 79},
    "dnd-copy.png": {"xhot": 86, "yhot": 79},
    "dnd-link.png": {"xhot": 86, "yhot": 79},
    "dnd-move.png": {"xhot": 86, "yhot": 79},
    "dotbox.png": {"xhot": 100, "yhot": 100},
    "fd_double_arrow.png": {"xhot": 98, "yhot": 100},
    "grabbing.png": {"xhot": 106, "yhot": 79},
    "hand1.png": {"xhot": 113, "yhot": 95},
    "hand2.png": {"xhot": 88, "yhot": 32},
    "left_ptr.png": {"xhot": 53, "yhot": 36},
    "left_side.png": {"xhot": 35, "yhot": 100},
    "left_tee.png": {"xhot": 165, "yhot": 95},
    "link.png": {"xhot": 48, "yhot": 25},
    "ll_angle.png": {"xhot": 34, "yhot": 165},
    "lr_angle.png": {"xhot": 167, "yhot": 164},
    "move.png": {"xhot": 100, "yhot": 100},
    "pencil.png": {"xhot": 37, "yhot": 161},
    "plus.png": {"xhot": 100, "yhot": 100},
    "pointer-move.png": {"xhot": 48, "yhot": 25},
    "question_arrow.png": {"xhot": 102, "yhot": 102},
    "right_ptr.png": {"xhot": 150, "yhot": 29},
    "right_side.png": {"xhot": 163, "yhot": 98},
    "right_tee.png": {"xhot": 30, "yhot": 96},
    "sb_down_arrow.png": {"xhot": 100, "yhot": 126},
    "sb_h_double_arrow.png": {"xhot": 100, "yhot": 100},
    "sb_left_arrow.png": {"xhot": 86, "yhot": 100},
    "sb_right_arrow.png": {"xhot": 113, "yhot": 100},
    "sb_up_arrow.png": {"xhot": 99, "yhot": 86},
    "sb_v_double_arrow.png": {"xhot": 100, "yhot": 100},
    "tcross.png": {"xhot": 98, "yhot": 100},
    "top_left_corner.png": {"xhot": 29, "yhot": 27},
    "top_right_corner.png": {"xhot": 170, "yhot": 28},
    "top_side.png": {"xhot": 98, "yhot": 34},
    "top_tee.png": {"xhot": 98, "yhot": 29},
    "ul_angle.png": {"xhot": 34, "yhot": 35},
    "ur_angle.png": {"xhot": 164, "yhot": 34},
    "vertical-text.png": {"xhot": 100, "yhot": 100},
    "wayland-cursor.png": {"xhot": 100, "yhot": 100},
    "X_cursor.png": {"xhot": 100, "yhot": 100},
    "xterm.png": {"xhot": 100, "yhot": 100},
    "zoom-in.png": {"xhot": 90, "yhot": 89},
    "zoom-out.png": {"xhot": 93, "yhot": 90},
    ############
    # Animated #
    ############
    # Note: Animated cursors don't need an extension and frame numbers.
    "left_ptr_watch": {"xhot": 50, "yhot": 28},
    "wait": {"xhot": 100, "yhot": 100},
}

WIN_CURSORS_CFG: Dict[str, Dict[str, str]] = {
    ##########
    # Static #
    ##########
    "right_ptr.png": {"to": "Alternate", "position": "top_left"},
    "cross.png": {"to": "Cross"},
    "left_ptr.png": {"to": "Default", "position": "top_left"},
    "bd_double_arrow.png": {"to": "Diagonal_1"},
    "fd_double_arrow.png": {"to": "Diagonal_2"},
    "pencil.png": {"to": "Handwriting"},
    "question_arrow.png": {"to": "Help", "position.png": "top_left"},
    "sb_h_double_arrow.png": {"to": "Horizontal"},
    "xterm.png": {"to": "IBeam", "position": "top_left"},
    "hand2.png": {"to": "Link", "position": "top_left"},
    "hand1.png": {"to": "Move"},
    "circle.png": {"to": "Unavailiable", "position": "top_left"},
    "sb_v_double_arrow.png": {"to": "Vertical"},
    ############
    # Animated #
    ############
    # Note: Animated cursors don't need frame numbers.
    "left_ptr_watch": {"to": "Work", "position": "top_left"},
    "wait": {"to": "Busy"},
}
