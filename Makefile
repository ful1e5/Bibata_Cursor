all: clean render build

.PHONY: all

# Default
clean:
	@rm -rf bitmaps themes

render: bitmapper svg
	@cd bitmapper && make install render_modern render_original

build: bitmaps
	@cd builder && make setup build


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
	@cd builder && make setup build_modern


# Bibata Original
original:clean render_original build_original

render_original: bitmapper svg
	@cd bitmapper && make install render_original

build_original: bitmaps
	@cd builder && make setup build_original


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
THEMES = Amber Classic Ice
BIN_DIR = ../bin
prepare: bitmaps themes
	# Bitmaps
	@rm -rf bin && mkdir bin
	@cd bitmaps && zip -r $(BIN_DIR)/bitmaps.zip * && cd ..
	@cd themes
	#
	# Bibata-Original
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/Bibata-Modern-$(theme).tar.gz Bibata-Modern-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/Bibata-Modern-$(theme)-Windows.zip Bibata-Modern-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/Bibata-Modern.tar.gz Bibata-Modern-Amber Bibata-Modern-Classic Bibata-Modern-Ice
	@zip -r $(BIN_DIR)/Bibata-Modern-Windows.zip Bibata-Modern-Amber-Windows Bibata-Modern-Classic-Windows Bibata-Modern-Ice-Windows
	#
	# Bibata-Original
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/Bibata-Original-$(theme).tar.gz Bibata-Original-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/Bibata-Original-$(theme)-Windows.zip Bibata-Original-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/Bibata-Original.tar.gz Bibata-Original-Amber Bibata-Original-Classic Bibata-Original-Ice
	@zip -r $(BIN_DIR)/Bibata-Original-Windows.zip Bibata-Original-Amber-Windows Bibata-Original-Classic-Windows Bibata-Original-Ice-Windows
	#
	# Bibata.tar.gz
	#
	@tar -czvf $(BIN_DIR)/Bibata.tar.gz --exclude='*-Windows' *
	@cd ..
