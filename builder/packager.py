#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .provider import ConfigProvider


class Packager():
    """
        Create Crisp 📦 Packages for Windows & X11 Cursor Theme.
    """

    def __init__(self, config: ConfigProvider):
        self.__config = config
