#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import os

logging.basicConfig(filename='%s/build.log' % os.getcwd(), filemode='w',
                    format='%(name)s - %(levelname)s - %(message)s', level=logging.DEBUG)
