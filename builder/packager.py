#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .provider import ConfigsProvider


class Packager():
    """
        Create Crisp 📦 Packages for Windows & X11 Cursor Theme.
    """

    def __init__(self, configs: ConfigsProvider):
        self.__configs = configs
