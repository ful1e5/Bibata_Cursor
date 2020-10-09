#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .bundler import Bundler
from .config import ConfigProvider, hotspots, sizes, delay
from clickgen import build_x11_cursor_theme, build_cursor_theme, build_win_cursor_theme


class CursorBuilder():
    """
        Bibata cursors builder 🚀
    """

    def __init__(self, name: str, config: ConfigProvider) -> None:
        self.__name = name
        self.__config = config
        self.__bundler = Bundler(name, config)

    def build_x11_cursors(self) -> None:
        print('🌈 Building %s Theme ...' % self.__name)
        build_x11_cursor_theme(
            name=self.__name,
            image_dir=self.__config.bitmaps_dir,
            cursor_sizes=sizes,
            hotspots=hotspots,
            out_path=self.__config.temp_out_dir,
            archive=False,
            delay=delay
        )

        self.__bundler.x11_bundle()

    def build_win_cursors(self) -> None:
        print('🌈 Building %s Theme ...' % self.__name)
        build_win_cursor_theme(
            name=self.__name,
            image_dir=self.__config.bitmaps_dir,
            cursor_sizes=sizes,
            hotspots=hotspots,
            out_path=self.__config.temp_out_dir,
            archive=False,
            delay=delay
        )

        self.__bundler.win_bundle()

    def build_cursors(self) -> None:
        print('🌈 Building %s Theme ...' % self.__name)
        build_cursor_theme(
            name=self.__name,
            image_dir=self.__config.bitmaps_dir,
            cursor_sizes=sizes,
            hotspots=hotspots,
            out_path=self.__config.temp_out_dir,
            archive=False,
            delay=delay
        )

        self.__bundler.bundle()
