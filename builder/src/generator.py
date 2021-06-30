#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pathlib import Path
from typing import Any, Dict, NamedTuple

from clickgen.builders import WindowsCursor, XCursor
from clickgen.core import CursorAlias
from clickgen.packagers import WindowsPackager, XPackager

from .constants import AUTHOR, URL
from .symlinks import add_missing_xcursor


class Info(NamedTuple):
    """Important cursor package's information field"""

    name: str
    comment: str


def xbuild(config: Dict[str, Dict[str, Any]], x_out_dir: Path, info: Info) -> None:
    """Build `Bibata` cursor theme for only `X11`(UNIX) platform.

    :param config: `Bibata` configuration.
    :type config: Dict[str, Dict[str, Any]]

    :param x_out_dir: Path to the output directory, \
                      Where the `X11` cursor theme package will generate.\
                      It also creates a directory if not exists.
    :type x_out_dir: Path

    :param info: Content theme name & comment
    :type info: Info
    """

    for _, item in config.items():
        png = item["png"]
        hotspot = item["hotspot"]
        x_sizes = item["x_sizes"]
        delay = item["delay"]

        with CursorAlias.from_bitmap(png, hotspot) as alias:
            x_cfg = alias.create(x_sizes, delay)
            print(f"Building '{x_cfg.stem}' XCursor...")
            XCursor.create(x_cfg, x_out_dir)

    add_missing_xcursor(x_out_dir / "cursors")
    XPackager(x_out_dir, info.name, info.comment)


def wbuild(config: Dict[str, Dict[str, Any]], win_out_dir: Path, info: Info) -> None:
    """Build `Bibata` cursor theme for only `Windows` platforms.

    :param config: `Bibata` configuration.
    :type config: Dict[str, Dict[str, Any]]

    :param win_out_dir: Path to the output directory,\
                        Where the `Windows` cursor theme package will \
                        generate. It also creates a directory if not exists.
    :type win_out_dir: Path

    :param info: Content theme name & comment
    :type info: Dict
    """

    for _, item in config.items():
        png = item["png"]
        hotspot = item["hotspot"]
        x_sizes = item["x_sizes"]
        delay = item["delay"]

        with CursorAlias.from_bitmap(png, hotspot) as alias:
            alias.create(x_sizes, delay)

            if item.get("win_key"):
                position = item["position"]
                win_size = item["win_size"]
                win_key = item["win_key"]
                canvas_size = item["canvas_size"]
                win_delay = item["win_delay"]

                win_cfg = alias.reproduce(
                    win_size, canvas_size, position, delay=win_delay
                ).rename(win_key)
                print(f"Building '{win_cfg.stem}' Windows Cursor...")
                WindowsCursor.create(win_cfg, win_out_dir)

    WindowsPackager(win_out_dir, info.name, info.comment, AUTHOR, URL)


def build(
    config: Dict[str, Dict[str, Any]], x_out_dir: Path, win_out_dir: Path, info: Info
) -> None:
    """Build `Bibata` cursor theme for `X11` & `Windows` platforms.

    :param config: `Bibata` configuration.
    :type config: Dict[str, Dict[str, Any]]

    :param win_out_dir: Path to the output directory,\
                        Where the `Windows` cursor theme package will \
                        generate. It also creates a directory if not exists.
    :type win_out_dir: Path

    :param info: Content theme name & comment
    :type info: Dict
    """

    def win_build(item: Dict[str, Any], alias: CursorAlias) -> None:
        position = item["position"]
        win_size = item["win_size"]
        win_key = item["win_key"]
        canvas_size = item["canvas_size"]
        win_delay = item["win_delay"]

        win_cfg = alias.reproduce(
            win_size, canvas_size, position, delay=win_delay
        ).rename(win_key)
        print(f"Building '{win_cfg.stem}' Windows Cursor...")
        WindowsCursor.create(win_cfg, win_out_dir)

    for _, item in config.items():
        png = item["png"]
        hotspot = item["hotspot"]
        x_sizes = item["x_sizes"]
        delay = item["delay"]

        with CursorAlias.from_bitmap(png, hotspot) as alias:
            x_cfg = alias.create(x_sizes, delay)
            print(f"Building '{x_cfg.stem}' XCursor...")
            XCursor.create(x_cfg, x_out_dir)

            if item.get("win_key"):
                win_build(item, alias)

    add_missing_xcursor(x_out_dir / "cursors")
    XPackager(x_out_dir, info.name, info.comment)

    WindowsPackager(win_out_dir, info.name, info.comment, AUTHOR, URL)
