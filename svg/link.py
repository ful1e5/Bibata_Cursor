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


def gen_symlinks(src_dirs: List[str], dst_dir: str) -> None:
    dst = Path(dst_dir)
    for src_dir in src_dirs:
        for file in Path(src_dir).glob("*"):
            link = dst / file.name
            if os.path.exists(link):
                os.remove(link)

            print(f"Creating symlink for {link.name}")
            with cwd(dst):
                os.symlink(
                    os.path.relpath(file, dst),
                    link.name,
                )


# Linking Bibata Modern
gen_symlinks(
    [
        "groups/modern",
        "groups/modern-arrow",
        "groups/shared",
        "groups/hand",
    ],
    "modern",
)

# Linking Bibata Modern Right
gen_symlinks(
    [
        "groups/modern-right",
        "groups/modern-arrow",
        "groups/shared",
        "groups/hand-right",
    ],
    "modern-right",
)

# Linking Bibata Original
gen_symlinks(
    [
        "groups/original",
        "groups/original-arrow",
        "groups/shared",
        "groups/hand",
    ],
    "original",
)

# Linking Bibata Original Right
gen_symlinks(
    [
        "groups/original-right",
        "groups/original-arrow",
        "groups/shared",
        "groups/hand-right",
    ],
    "original-right",
)
