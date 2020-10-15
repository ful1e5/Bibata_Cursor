#!/usr/bin/env python
# -*- coding: utf-8 -*-

from builder.pkg_info import info
from setuptools import setup, find_namespace_packages

setup(
    name=info["name"],
    version=info["version"],
    description=info["description"],
    url=info["url"],
    author=info["author"],
    author_email=info["email"],
    install_requires=["Pillow>=7.2.0", "clickgen>=1.1.7"],
    packages=find_namespace_packages(include=["builder"]),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
    ],
    python_requires=">=3.6",
    include_package_data=True,
    zip_safe=False,
)
