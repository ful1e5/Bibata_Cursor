#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from pathlib import Path
from typing import Union

from clickgen.util import chdir


def add_missing_xcursor(directory: Union[str, Path]) -> None:
    """Add missing `XCursor` to the UNIX cursor package.

    :param directory: directory where XCursors are available.
    :type directory: Union[str, Path]
    """

    symlinks = [
        {
            "src": "bd_double_arrow",
            "links": [
                "c7088f0f3e6c8088236ef8e1e3e70000",
                "nwse-resize",
                "size_fdiag",
            ],
        },
        {
            "src": "bottom_left_corner",
            "links": [
                "sw-resize",
            ],
        },
        {
            "src": "bottom_right_corner",
            "links": [
                "se-resize",
            ],
        },
        {
            "src": "bottom_side",
            "links": [
                "s-resize",
            ],
        },
        {
            "src": "circle",
            "links": [
                "forbidden",
            ],
        },
        {
            "src": "copy",
            "links": [
                "1081e37283d90000800003c07f3ef6bf",
                "6407b0e94181790501fd1e167b474872",
                "b66166c04f8c3109214a4fbd64a50fc8",
            ],
        },
        {
            "src": "cross",
            "links": ["cross_reverse", "diamond_cross"],
        },
        {
            "src": "crossed_circle",
            "links": [
                "03b6e0fcb3499374a867c041f52298f0",
                "not-allowed",
            ],
        },
        {"src": "dnd_no_drop", "links": ["no-drop"]},
        {"src": "dnd-link", "links": ["alias"]},
        {"src": "dotbox", "links": ["dot_box_mask", "draped_box", "icon", "target"]},
        {
            "src": "fd_double_arrow",
            "links": ["fcf1c3c7cd4491d801f1e1c78f100000", "nesw-resize", "size_bdiag"],
        },
        {
            "src": "grabbing",
            "links": [
                "closedhand",
                "dnd-none",
                "fcf21c00b30f7e3f83fe0dfd12e71cff",
            ],
        },
        {"src": "hand1", "links": ["grab", "openhand"]},
        {
            "src": "hand2",
            "links": [
                "9d800788f1b08800ae810202380a0822",
                "e29285e634086352946a0e7090d73106",
                "pointer",
                "pointing_hand",
            ],
        },
        {
            "src": "left_ptr",
            "links": [
                "arrow",
                "default",
                "top_left_arrow",
            ],
        },
        {
            "src": "left_ptr_watch",
            "links": [
                "00000000000000020006000e7e9ffc3f",
                "08e8e1c95fe2fc01f976f1e063a24ccd",
                "3ecb610c1bf2410f44200f48c40d3599",
                "progress",
            ],
        },
        {"src": "left_side", "links": ["w-resize"]},
        {
            "src": "link",
            "links": [
                "3085a0e285430894940527032f8b26df",
                "640fb0e74195791501fd1ed57b41487f",
                "a2a266d0498c3104214a47bd64ab0fc8",
            ],
        },
        {
            "src": "move",
            "links": [
                "4498f0e0c1937ffe01fd06f973665830",
                "9081237383d90e509aa00f00170e968f",
                "all-scroll",
                "fleur",
                "size_all",
            ],
        },
        {"src": "pencil", "links": ["draft"]},
        {"src": "plus", "links": ["cell"]},
        {
            "src": "question_arrow",
            "links": [
                "5c6cd98b3f3ebcb1f9c7f1c204630408",
                "d9ce0ab605698f320427677b458ad60b",
                "help",
                "left_ptr_help",
                "whats_this",
            ],
        },
        {"src": "right_ptr", "links": ["draft_large", "draft_small"]},
        {"src": "right_side", "links": ["e-resize"]},
        {"src": "sb_down_arrow", "links": ["down-arrow"]},
        {
            "src": "sb_h_double_arrow",
            "links": [
                "028006030e0e7ebffc7f7070c0600140",
                "14fef782d02440884392942c1120523",
                "col-resize",
                "ew-resize",
                "h_double_arrow",
                "size-hor",
                "size_hor",
                "split_h",
            ],
        },
        {"src": "sb_left_arrow", "links": ["left-arrow"]},
        {"src": "sb_right_arrow", "links": ["right-arrow"]},
        {"src": "sb_up_arrow", "links": ["up-arrow"]},
        {
            "src": "sb_v_double_arrow",
            "links": [
                "00008160000006810000408080010102",
                "2870a09082c103050810ffdffffe0204",
                "double_arrow",
                "ns-resize",
                "row-resize",
                "size-ver",
                "size_ver",
                "split_v",
                "v_double_arrow",
            ],
        },
        {"src": "tcross", "links": ["color-picker"]},
        {"src": "top_left_corner", "links": ["nw-resize"]},
        {"src": "top_right_corner", "links": ["ne-resize"]},
        {"src": "top_side", "links": ["n-resize"]},
        {"src": "wait", "links": ["watch"]},
        {"src": "X_cursor", "links": ["pirate", "x-cursor"]},
        {"src": "xterm", "links": ["ibeam", "text"]},
    ]

    with chdir(directory):
        for item in symlinks:
            src = item["src"]
            for link in item["links"]:
                print(f"Creating symlink {src} -> {link}")
                os.symlink(src, link)
