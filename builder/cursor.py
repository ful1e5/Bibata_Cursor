#!/usr/bin/env python
# -*- coding: utf-8 -*-

import builder
from .provider import ConfigsProvider


class CursorBuilder():
    """
    docstring
    """

    def __init__(self, configs: ConfigsProvider):

        print("⚡ Bibata Builder Version %s" % builder.__version__)
        self.__configs = configs
