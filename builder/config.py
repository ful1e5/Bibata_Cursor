#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import log
import sys
import json
import builder
import tempfile
from os import path, listdir
import shutil


class ConfigProvider():
    """
        Configure `Bibata` building process.
    """

    # Build Config
    delay = 35
    sizes = [22, 24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96]

    # Windows Cursors Config
    windows_cursors = {
        "left_ptr_watch.ani": "AppStarting.ani",
        "left_ptr.cur": "Arrow.cur",
        "crosshair.cur": "Cross.cur",
        "hand2.cur": "Hand.cur",
        "pencil.cur": "Handwriting.cur",
        "dnd-ask.cur": "Help.cur",
        "xterm.cur": "IBeam.cur",
        "circle.cur": "NO.cur",
        "all-scroll.cur": "SizeAll.cur",
        "bd_double_arrow.cur": "SizeNESW.cur",
        "sb_v_double_arrow.cur": "SizeNS.cur",
        "fd_double_arrow.cur": "SizeNWSE.cur",
        "sb_h_double_arrow.cur": "SizeWE.cur",
        "sb_up_arrow.cur": "UpArrow.cur",
        "wait.ani": "Wait.ani",
    }

    def __init__(self, bitmaps_dir: str, out_dir: str) -> None:

        # cleanup old packages
        if path.exists(out_dir):
            shutil.rmtree(out_dir)

        # Checking Bitmaps directory
        if not path.exists(bitmaps_dir):
            print(
                "⚠ BITMAPS NOT FOUND.\n\n`yarn install && yarn render` to Generates Bitmaps")
            sys.exit(1)

        os.mkdir(out_dir)

        self.bitmaps_dir: str = bitmaps_dir
        self.temp_out_dir: str = tempfile.mkdtemp()
        self.out_dir: str = out_dir

        # read hotspots file
        with open(path.join(builder.__path__[0], "hotspots.json")) as hotspot_file:
            self.hotspots = json.loads(hotspot_file.read())

    def get_windows_script(self, theme_name: str, author: str) -> str:

        with open(path.join(builder.__path__[0], "windows.inf")) as f:
            data = f.read()
            inf_content = data.replace(
                "<inject_theme_name>", theme_name+" Cursors").replace("<inject_author_name>", author)

        return inf_content
