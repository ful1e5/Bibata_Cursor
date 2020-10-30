#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import json
import shutil
from os import path, mkdir
import tempfile

from . import __path__
from .pkg_info import info

# Build Config
delay = 35
sizes = [22, 24, 28, 32, 40, 48, 56, 64, 72, 80, 88, 96]

# read hotspots file
with open(path.join(__path__[0], "hotspots.json")) as hotspot_file:
    hotspots = json.loads(hotspot_file.read())


class ConfigProvider:
    """
    Configure `Bibata` building process 🔧.
    """

    def __init__(self, name: str, bitmaps_dir: str, out_dir: str) -> None:
        # cleanup old packages
        if path.exists(out_dir):
            shutil.rmtree(out_dir)

        mkdir(out_dir)

        # Checking Bitmaps directory
        if not path.exists(bitmaps_dir):
            print(
                "⚠ BITMAPS NOT FOUND.\n\n`yarn install && yarn render` to Generates Bitmaps"
            )
            sys.exit(1)

        self.name: str = name
        self.bitmaps_dir: str = path.abspath(bitmaps_dir)
        self.tmpdir: str = tempfile.mkdtemp()
        self.out_dir: str = path.abspath(out_dir)

    def get_windows_script(self) -> str:
        """ Get `install.inf` content for this cursor theme. """
        with open(path.join(__path__[0], "windows.inf")) as f:
            data = f.read()
            inf_content = data.replace(
                "<inject_theme_name>", self.name + " Cursors"
            ).replace("<inject_author_name>", info["author"])

        return inf_content
