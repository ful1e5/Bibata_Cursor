#!/usr/bin/env python
# -*- coding: utf-8 -*-

import contextlib
import os
from pathlib import Path


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


def link_missing_svgs(src_dir, dst_dir) -> None:
    dst = Path(dst_dir)
    for file in Path(src_dir).glob("*"):
        if file.stem in files:
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


link_missing_svgs("original", "modern")
