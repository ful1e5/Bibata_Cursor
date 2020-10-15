#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import argparse
from argparse import ArgumentParser
from os import path, listdir
from typing import List

from builder.pkg_info import info
from builder.config import ConfigProvider
from builder.cursor import CursorBuilder


def get_args_parser() -> ArgumentParser:
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(description=info["description"])

    parser.add_argument(
        "-x",
        "--x11",
        action="store_true",
        default=False,
        help=("Bundle X11 cursors from bitmaps" " (default: %(default)s)"),
    )

    parser.add_argument(
        "-w",
        "--windows",
        action="store_true",
        default=False,
        help=("Bundle Windows cursors from bitmaps" " (default: %(default)s)"),
    )

    return parser


def build() -> None:
    """ Build Bibata cursor """
    parser = get_args_parser()
    try:
        args = parser.parse_args()
    except Exception:
        sys.exit(0)

    bitmaps_dir = "./bitmaps"
    out_dir = "./themes"

    # print builder information
    print(info["version"])

    bitmaps_dirs = listdir(bitmaps_dir)
    configs: List[ConfigProvider] = []
    builders: List[CursorBuilder] = []

    for index, name in enumerate(bitmaps_dirs):
        theme_bitmaps_dir = path.join(bitmaps_dir, name)
        configs.append(ConfigProvider(name, theme_bitmaps_dir, out_dir))
        builders.append(CursorBuilder(configs[index]))

    for builder in builders:
        if args.x11 == args.windows:
            builder.build_cursors()
        elif args.x11:
            builder.build_x11_cursors()
        elif args.windows:
            builder.build_win_cursors()


if __name__ == "__main__":
    build()
