#!/usr/bin/env python

import argparse
import json
import log
from clickgen import build_cursor_theme, build_x11_cursor_theme

from config import version, configs, sizes, delay, temp_folder
from helper import init_build, pack_it


def cmd_parse():
    """Parse command line arguments"""
    parser = argparse.ArgumentParser(
        description="Bibata cursors builder %s" % version)

    parser.add_argument("-x", "--x11", action="store_true", default=False,
                        help=("Create X11 cursors using bitmaps"
                              " (default: %(default)s)"))

    return parser.parse_args()


def build(config) -> None:

    args = cmd_parse()

    if (args.x11):
        # build x11 cursors packages only
        build_x11_cursor_theme(
            config['name'],
            image_dir=config['bitmaps_dir'],
            cursor_sizes=sizes,
            out_path=config['temp_folder'],
            hotspots=hotspots,
            archive=False,
            delay=delay)
    else:
        # build windows & x11 cursors packages
        build_cursor_theme(
            config['name'],
            image_dir=config['bitmaps_dir'],
            cursor_sizes=sizes,
            out_path=config['temp_folder'],
            hotspots=hotspots,
            archive=False,
            delay=delay)

    pack_it(config)


if __name__ == "__main__":
    init_build()

    # read hotspots file
    with open('./hotspots.json', 'r') as hotspot_file:
        hotspots = json.loads(hotspot_file.read())

    # building themes
    for config in configs:
        print('🌈 Building %s Theme ...' % config['name'])
        build(config)
