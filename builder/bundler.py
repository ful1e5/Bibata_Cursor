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
    "bd_double_arrow.cur": "SizeNWSE.cur",
    "sb_v_double_arrow.cur": "SizeNS.cur",
    "fd_double_arrow.cur": "SizeNESW.cur",
    "sb_h_double_arrow.cur": "SizeWE.cur",
    "sb_up_arrow.cur": "UpArrow.cur",
    "wait.ani": "Wait.ani",
}


class Bundler():
    """
        Create crisp package for Bibata Windows & X11 packages 📦.
    """

    def __init__(self, config: ConfigProvider) -> None:
        """
        docsstring
        """
        self.__name = config.name
        self.__tmpdir = config.tmpdir
        self.__x11_dest = path.join(config.out_dir, self.__name)
        self.__win_dest = path.join(config.out_dir, self.__name + "-Windows")
        self.__content = config.get_windows_script()

    def __save_win_install_script(self) -> None:
        """
        docstring
        """
        file_path = path.join(self.__win_dest, "install.inf")
        with open(file_path, "w") as file:
            file.write(self.__content)

    def __clean_win_bundle(self) -> None:
        """
        docstring
        """
        # Remove & Rename cursors
        # If Key found => Rename else Remove
        for cursor in listdir(self.__win_dest):
            old_path = path.join(self.__win_dest, cursor)

            try:
                new_path = path.join(self.__win_dest, windows_cursors[cursor])
                rename(old_path, new_path)
            except KeyError:
                remove(old_path)

        self.__save_win_install_script()

    def win_bundle(self) -> None:
        """
        docstring
        """
        src = path.join(self.__tmpdir, self.__name, "win")
        shutil.copytree(src, self.__win_dest)
        self.__clean_win_bundle()

    def x11_bundle(self) -> None:
        """
        docstring
        """
        src = path.join(self.__tmpdir, self.__name, "x11")
        shutil.copytree(src, self.__x11_dest, symlinks=True)

    def bundle(self) -> None:
        """
        docstring
        """
        x11_src = path.join(self.__tmpdir, self.__name, "x11")
        shutil.copytree(x11_src, self.__x11_dest, symlinks=True)

        win_src = path.join(self.__tmpdir, self.__name, "win")
        shutil.copytree(win_src, self.__win_dest)
        self.__clean_win_bundle()
