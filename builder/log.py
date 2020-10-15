#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import os


def save_logs_to_file() -> None:
    """ Save `clickgen` logs to `build.log` in current working directory. """
    logging.basicConfig(filename='%s/build.log' % os.getcwd(), filemode='w',
                        format='%(name)s - %(levelname)s - %(message)s', level=logging.DEBUG)
