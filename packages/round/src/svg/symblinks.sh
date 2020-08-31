#!/usr/bin/env bash

cd ./static

# remove files
rm -rf dnd_none.svg

# creating symbolic links
ln -s ./move.svg ./dnd_none.svg

cd ..