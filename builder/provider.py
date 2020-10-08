#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import builder
from os import path
import shutil


class ConfigProvider(object):
    """
    Configure `Bibata` building process.
    """

    def __init__(self, bitmaps_dir: str, out_dir: str) -> None:

        self._bitmaps_dir: str = bitmaps_dir
        self._out_dir: str = out_dir

        if (path.isdir(out_dir)):
            shutil.rmtree(out_dir)

        os.mkdir(out_dir)

    def get_windows_script(self, theme_name: str, author: str) -> str:

        with open(path.join(builder.__path__[0], "windows.inf")) as f:
            data = f.read()
            inf_content = data.replace(
                "<inject_theme_name>", theme_name+" Cursors").replace("<inject_author_name>", author)

        return inf_content
