all: clean render build

.PHONY: all

# Default
clean:
	@rm -rf bitmaps themes

render: bitmapper svg
	@cd bitmapper && make

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
	@cd bitmapper && make install build render_modern

build_modern: bitmaps
	@cd builder && make setup build_modern


# Bibata Original
original:clean render_original build_original

render_original: bitmapper svg
	@cd bitmapper && make install build render_original

build_original: bitmaps
	@cd builder && make setup build_original


# Installation
.ONESHELL:
SHELL := /bin/bash
THEME_PREFIX = Bibata

src = ./themes/$(THEME_PREFIX)-*
local := ~/.icons
local_dest := $(local)/$(THEME_PREFIX)-*

root := /usr/share/icons
root_dest := $(root)/$(THEME_PREFIX)-*

install: themes
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Installing '$(THEME_PREFIX)' cursors inside $(local)/..."
		@mkdir -p $(local)
		@cp -r $(src) $(local)/ && echo "> Installed!"
	@else
		@echo "> Installing '$(THEME_PREFIX)' cursors inside $(root)/..."
		@mkdir -p $(root)
		@sudo cp -r $(src) $(root)/ && echo "> Installed!"
	@fi

uninstall:
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Removing '$(THEME_PREFIX)' cursors from '$(local)'..."
		@rm -rf $(local_dest)
	@else
		@echo "> Removing '$(THEME_PREFIX)' cursors from '$(root)'..."
		@sudo rm -rf $(root_dest)
	@fi

reinstall: uninstall install


# generates binaries
THEMES = Amber Classic Ice
BIN_DIR = ../bin

modern = $(THEME_PREFIX)-Modern
original = $(THEME_PREFIX)-Original
prepare: bitmaps themes
	# Bitmaps
	@rm -rf bin && mkdir bin
	@cd bitmaps && zip -r $(BIN_DIR)/bitmaps.zip * && cd ..
	@cd themes
	#
	# Bibata-Modern
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/$(modern)-$(theme).tar.gz $(modern)-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/$(modern)-$(theme)-Windows.zip $(modern)-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/$(modern).tar.gz $(modern)-Amber $(modern)-Classic $(modern)-Ice
	@zip -r $(BIN_DIR)/$(modern)-Windows.zip $(modern)-Amber-Windows $(modern)-Classic-Windows $(modern)-Ice-Windows
	#
	# Bibata-Original
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/$(original)-$(theme).tar.gz $(original)-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/$(original)-$(theme)-Windows.zip $(original)-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/$(original).tar.gz $(original)-Amber $(original)-Classic $(original)-Ice
	@zip -r $(BIN_DIR)/$(original)-Windows.zip $(original)-Amber-Windows $(original)-Classic-Windows $(original)-Ice-Windows
	#
	# Bibata.tar.gz
	#
	@tar -czvf $(BIN_DIR)/Bibata.tar.gz --exclude='*-Windows' *
	@cd ..
