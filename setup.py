#!/usr/bin/env python
# -*- coding: utf-8 -*-

from builder import __pkg_name__, __version__, __author__, __info__, __email__, __url__
from setuptools import setup, find_namespace_packages

setup(
    name=__pkg_name__,
    version=__version__,
    description=__info__,
    url=__url__,
    author=__author__,
    author_email=__email__,
    install_requires=["Pillow>=7.2.0", "clickgen>=1.1.7"],
    packages=find_namespace_packages(include=['builder']),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
    ],
    python_requires=">=3.6",
    include_package_data=True,
    zip_safe=False,
)
