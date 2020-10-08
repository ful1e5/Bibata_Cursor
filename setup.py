#!/usr/bin/env python
# -*- coding: utf-8 -*-

from builder import __version__
from setuptools import setup, find_namespace_packages

setup(
    name="builder",
    version=__version__,
    description="Bibata theme builder 📦",
    url="https://github.com/ful1e5/Bibata_Cursor/",
    author="Kaiz Khatri",
    author_email="kaizmandhu@gmail.com",
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
