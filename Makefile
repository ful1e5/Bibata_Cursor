all: clean render build

unix: clean render bitmaps
	@cd builder && make setup build_unix

windows: clean render bitmaps
	@cd builder && make setup build_windows

.PHONY: all

clean:
	@rm -rf bitmaps themes
	
modern: clean render_modern build_modern
original:clean render_original build_original

#
# Render Bibata Bitmaps
#

render: bitmapper svg
	@cd bitmapper && make install render_modern render_original

render_original: bitmapper svg
	@cd bitmapper && make install render_original

render_modern: bitmapper svg
	@cd bitmapper && make install render_modern

#
# Build Bibata Unix & Windows cursors
#

build: bitmaps
	@cd builder && make setup build clean

build_unix: bitmaps
	@rm -rf themes
	@cd builder && make setup build_unix clean

build_windows: bitmaps
	@rm -rf themes
	@cd builder && make setup build_windows clean

build_modern: bitmaps
	@cd builder && make setup build_modern clean

build_original: bitmaps
	@cd builder && make setup build_original clean

#
# Installation
#

.ONESHELL:
SHELL:=/bin/bash

src = ./themes/Bibata-*
local := ~/.icons
local_dest := $(local)/Bibata-*

root := /usr/share/icons
root_dest := $(root)/Bibata-*

install: themes
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Installing 'Bibata' cursors inside $(local)/..."
		@mkdir -p $(local)
		@cp -r $(src) $(local)/ && echo "> Installed!"
	@else
		@echo "> Installing 'Bibata' cursors inside $(root)/..."
		@mkdir -p $(root)
		@sudo cp -r $(src) $(root)/ && echo "> Installed!"
	@fi

uninstall:
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Removing 'Bibata' cursors from '$(local)'..."
		@rm -rf $(local_dest)
	@else
		@echo "> Removing 'Bibata' cursors from '$(root)'..."
		@sudo rm -rf $(root_dest)
	@fi

reinstall: uninstall install
