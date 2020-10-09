#!/usr/bin/env python
# -*- coding: utf-8 -*-

import shutil
from os import path, listdir, rename, remove
from .config import ConfigProvider


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


class Bundler():
    """
    docstring
    """

    def __init__(self, name: str, config: ConfigProvider) -> None:
        """
        docsstring
        """
        self.__temp_dir = config.temp_out_dir
        self.__x11 = path.join(config.out_dir, name)
        self.__win = path.join(config.out_dir, name + "-Windows")

        self.__cur_win_dir = path.join(config.temp_out_dir, name, "win")
        self.__cur_x11_dir = path.join(config.temp_out_dir, name, "x11")
        self.__content = config.get_windows_script(name)

    def __save_win_install_script(self) -> None:
        """
        docstring
        """
        file_path = path.join(self.__win, "install.inf")
        with open(file_path, "w") as file:
            file.write(self.__content)

    def __clean_win_bundle(self) -> None:
        """
        docstring
        """
        # Remove & Rename cursors
        # If Key found => Rename else Remove
        for cursor in listdir(self.__win):
            old_path = path.join(self.__win, cursor)

            try:
                new_path = path.join(self.__win, windows_cursors[cursor])
                rename(old_path, new_path)
            except KeyError:
                remove(old_path)

        self.__save_win_install_script()

    def __clean_temp(self) -> None:
        """
        docstring
        """
        shutil.rmtree(self.__temp_dir)

    def win_bundle(self) -> None:
        """
        docstring
        """
        shutil.copytree(self.__cur_win_dir, self.__win)
        self.__clean_win_bundle()
        self.__clean_temp()

    def x11_bundle(self) -> None:
        """
        docstring
        """
        shutil.copytree(self.__cur_x11_dir, self.__x11)
        self.__clean_temp()

    def bundle(self) -> None:
        """
        docstring
        """
        shutil.copytree(self.__cur_win_dir, self.__win)
        self.__clean_win_bundle()
        shutil.copytree(self.__cur_x11_dir, self.__x11)
        self.__clean_temp()
