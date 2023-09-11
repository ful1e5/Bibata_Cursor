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


ignore_files = [
    # animated
    "left_ptr_watch.svg",
    # static
    "center_ptr.svg",
    "circle.svg",
    "context-menu.svg",
    "copy.svg",
    "left_ptr.svg",
    "link.svg",
    "pointer-move.svg",
    "right_ptr.svg",
]


def link_missing_svgs(src_dir, dst_dir) -> None:
    dst = Path(dst_dir)
    for file in Path(src_dir).glob("*"):
        if file.name not in ignore_files:
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
