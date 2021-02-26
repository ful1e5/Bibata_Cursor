#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pathlib import Path
from string import Template
from typing import Dict

THEME_FILES_TEMPLATES: Dict[str, Template] = {
    "cursor.theme": Template("[Icon Theme]\nName=$theme_name\nInherits=$theme_name"),
    "index.theme": Template(
        '[Icon Theme]\nName=$theme_name\nComment=$comment\nInherits="hicolor"'
    ),
}


def XPackager(directory: Path, theme_name: str, comment: str) -> None:
    """ Create a crispy `XCursors` theme package. """

    # Writing all .theme files
    files: Dict[str, str] = {}
    for file, template in THEME_FILES_TEMPLATES.items():
        files[file] = template.safe_substitute(theme_name=theme_name, comment=comment)

    for f, data in files.items():
        fp: Path = directory / f
        fp.write_text(data)
