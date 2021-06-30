all: clean render build

.PHONY: all

# Default
clean:
	@rm -rf bitmaps themes

render: bitmapper svg
	@cd bitmapper && make install render_modern render_original

build: bitmaps
	@cd builder && make setup build clean


# Specific platform build
unix: clean render bitmaps
	@cd builder && make setup build_unix

windows: clean render bitmaps
	@cd builder && make setup build_windows

# Bibata Modern
modern: clean render_modern build_modern

render_modern: bitmapper svg
	@cd bitmapper && make install render_modern

build_modern: bitmaps
	@cd builder && make setup build_modern clean


# Bibata Original
original:clean render_original build_original

render_original: bitmapper svg
	@cd bitmapper && make install render_original

build_original: bitmaps
	@cd builder && make setup build_original clean


# Installation
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

# generates binaries
# TODO: We can do it better
BIN_DIR = ../bin
prepare: bitmaps themes
	# Bitmaps
	@rm -rf bin && mkdir bin
	@cd bitmaps && zip -r $(BIN_DIR)/bitmaps.zip * && cd ..
	# themes
	@cd themes
	#
	# Bibata-Original
	#
	@tar -czvf $(BIN_DIR)/Bibata-Modern-Amber.tar.gz Bibata-Modern-Amber
	@zip -r $(BIN_DIR)/Bibata-Modern-Amber-Windows.zip Bibata-Modern-Amber-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Modern-Classic.tar.gz Bibata-Modern-Classic
	@zip -r $(BIN_DIR)/Bibata-Modern-Classic-Windows.zip Bibata-Modern-Classic-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Modern-Ice.tar.gz Bibata-Modern-Ice
	@zip -r $(BIN_DIR)/Bibata-Modern-Ice-Windows.zip Bibata-Modern-Ice-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Modern.tar.gz Bibata-Modern-Amber Bibata-Modern-Classic Bibata-Modern-Ice
	@zip -r $(BIN_DIR)/Bibata-Modern-Windows.zip Bibata-Modern-Amber-Windows Bibata-Modern-Classic-Windows Bibata-Modern-Ice-Windows
	#
	# Bibata-Original
	#
	@tar -czvf $(BIN_DIR)/Bibata-Original-Amber.tar.gz Bibata-Original-Amber
	@zip -r $(BIN_DIR)/Bibata-Original-Amber-Windows.zip Bibata-Original-Amber-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Original-Classic.tar.gz Bibata-Original-Classi/
	@zip -r $(BIN_DIR)/Bibata-Original-Classic-Windows.zip Bibata-Original-Classic-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Original-Ice.tar.gz Bibata-Original-Ice
	@zip -r $(BIN_DIR)/Bibata-Original-Ice-Windows.zip Bibata-Original-Ice-Windows
	@tar -czvf $(BIN_DIR)/Bibata-Original.tar.gz Bibata-Original-Amber Bibata-Original-Classic Bibata-Original-Ice
	@zip -r $(BIN_DIR)/Bibata-Original-Windows.zip Bibata-Original-Amber-Windows Bibata-Original-Classic-Windows Bibata-Original-Ice-Windows
	#
	# Bibata Unix
	#
	@tar -czvf $(BIN_DIR)/Bibata.tar.gz Bibata-Modern-Amber Bibata-Modern-Classic Bibata-Modern-Ice Bibata-Original-Amber Bibata-Original-Classic Bibata-Original-Ice
	@cd ..
