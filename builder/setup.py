#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup

setup(
    name="bbpkg",
    version="1.1.0",
    description="Generate 'Bibata' cursor theme from PNGs file",
    url="https://github.com/ful1e5/Bibata_Cursor",
    packages=["bbpkg"],
    package_dir={"bbpkg": "bbpkg"},
    author="Kaiz Khatri",
    author_email="kaizmandhu@gamil.com",
    install_requires=["clickgen==1.1.9"],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
    ],
    python_requires=">=3.8",
    zip_safe=True,
)
