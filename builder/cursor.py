#!/usr/bin/env python
# -*- coding: utf-8 -*-

import builder
from .provider import ConfigProvider


class CursorBuilder():
    """
    docstring
    """

    def __init__(self, config: ConfigProvider):

        print("⚡ Bibata Builder Version %s" % builder.__version__)
        self.__config = config
