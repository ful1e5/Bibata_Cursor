#!/usr/bin/env bash

cd ./animated

# remove files
rm -rf dnd_none.svg all_scroll.svg

# creating symbolic links
ln -s ./move.svg ./dnd_none.svg
ln -s ./move.svg ./all_scroll.svg

cd ..