#!/usr/bin/env python

import shutil
import json
import sys

from os import path, listdir, rename, remove
from config import name, bitmaps_dir, out_dir, window_install_inf_content, windows_cursors


def window_bundle(win_out_dir: str) -> None:
    # Remove & Rename cursors
    # If Key found => Rename else Remove
    for cursor in listdir(win_out_dir):
        old_path = path.join(win_out_dir, cursor)

        try:
            new_path = path.join(win_out_dir, windows_cursors[cursor])
            rename(old_path, new_path)
        except KeyError:
            remove(old_path)

    # creating install.inf file
    install_inf_path = path.join(win_out_dir, "install.inf")
    with open(install_inf_path, "w") as file:
        file.write(window_install_inf_content)


def init_build() -> None:
    """
        Print build version.
        Remove previously built packages && Check Bitmaps.
    """
    with open("./package.json", "r") as package_file:
        data = json.loads(package_file.read())
        version = data['version']
        print("⚡ Bibata Builder Version %s" % version)

    # cleanup old packages
    if path.exists(out_dir):
        shutil.rmtree(out_dir)

    # Checking Bitmaps directory
    if not path.exists(bitmaps_dir):
        print(
            "⚠ BITMAPS NOT FOUND.\n\n`yarn install && yarn render` to Generates Bitmaps")
        sys.exit(1)


def pack_it(config) -> None:
    """
        Create Crisp 📦 Packages for Windows & X11 Cursor Theme.
    """

    x11_out_dir = path.join(out_dir, config['x11_out'])
    win_out_dir = path.join(out_dir, config['win_out'])

    # Rename directory
    shutil.move(path.join(config['temp_folder'],
                          config['name'], "x11"), x11_out_dir)
    shutil.move(path.join(config['temp_folder'],
                          config['name'], "win"), win_out_dir)

    # create install.inf file in Windows Theme
    window_bundle(win_out_dir)
