#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import json
import shutil
import tempfile
from os import path

from . import __path__, __author__

# Build Config
delay = 35
sizes = [22, 24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96]

# read hotspots file
with open(path.join(__path__[0], "hotspots.json")) as hotspot_file:
    hotspots = json.loads(hotspot_file.read())


class ConfigProvider():
    """
        Configure `Bibata` building process.
    """

    def __init__(self, bitmaps_dir: str, out_dir: str) -> None:

        # cleanup old packages
        if path.exists(out_dir):
            shutil.rmtree(out_dir)

        os.mkdir(out_dir)

        # Checking Bitmaps directory
        if not path.exists(bitmaps_dir):
            print(
                "⚠ BITMAPS NOT FOUND.\n\n`yarn install && yarn render` to Generates Bitmaps")
            sys.exit(1)

        self.bitmaps_dir: str = bitmaps_dir
        self.temp_out_dir: str = tempfile.mkdtemp()
        self.out_dir: str = out_dir

    def get_windows_script(self, theme_name: str) -> str:
        with open(path.join(__path__[0], "windows.inf")) as f:
            data = f.read()
            inf_content = data.replace(
                "<inject_theme_name>", theme_name+" Cursors").replace("<inject_author_name>", __author__)

        return inf_content
