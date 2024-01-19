#!/usr/bin/env python
# -*- coding: utf-8 -*-

import contextlib
import os
from pathlib import Path
from typing import List


@contextlib.contextmanager
def cwd(dir):
    curdir = os.getcwd()
    try:
        os.chdir(dir)
        yield
    finally:
        os.chdir(curdir)


files = [
    "X_cursor",
    "bottom_left_corner",
    "bottom_right_corner",
    "bottom_side",
    "bottom_tee",
    "cross",
    "crossed_circle",
    "crosshair",
    "dnd-ask",
    "dnd-copy",
    "dnd-link",
    "dnd_no_drop",
    "dotbox",
    "grabbing",
    "hand1",
    "hand2",
    "left_side",
    "left_tee",
    "ll_angle",
    "lr_angle",
    "pencil",
    "plus",
    "question_arrow",
    "right_side",
    "right_tee",
    "tcross",
    "top_left_corner",
    "top_right_corner",
    "top_side",
    "top_tee",
    "ul_angle",
    "ur_angle",
    "vertical-text",
    "wait",
    "wayland-cursor",
    "xterm",
    "zoom-in",
    "zoom-out",
]

right_files = files + [
    "bd_double_arrow",
    "fd_double_arrow",
    "move",
    "sb_down_arrow",
    "sb_h_double_arrow",
    "sb_left_arrow",
    "sb_right_arrow",
    "sb_up_arrow",
    "sb_v_double_arrow",
]


def gen_symlinks(fnames: List[str], src_dir: str, dst_dir: str) -> None:
    dst = Path(dst_dir)
    for file in Path(src_dir).glob("*"):
        if file.stem in fnames:
            link = dst / file.name
            if os.path.exists(link):
                os.remove(link)

            print(f"Creating symlink for {link.name}")
            with cwd(dst):
                os.symlink(
                    os.path.relpath(file, dst),
                    link.name,
                )
        else:
            print(f"Ignoring {file.name}")


gen_symlinks(files, "original", "modern")
gen_symlinks(right_files, "modern", "modern-right")
gen_symlinks(right_files, "original", "original-right")
