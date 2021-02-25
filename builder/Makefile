all: clean setup build

bitmaps_dir = "../bitmaps"

.PHONY: all

.ONESHELL:
SHELL:=/bin/bash

X_SIZES ?=22 24 28 32 40 48 56 64 72 80 88 96
WIN_CANVAS_SIZE ?= 32
WIN_SIZE ?= 24

clean:
	@rm -rf applbuild.egg-info build dist
	@find -iname "*.pyc" -delete

	# Removing setup.py package files if installed
	@if [ -f "files.txt" ]; then
		@xargs rm -rf < files.txt
		@rm -rf files.txt
	@fi

setup: setup.py
	@test -d venv || python3 -m venv venv
	@. venv/bin/activate; python3 setup.py install --record files.txt

build: build_modern build_original

build_modern: build.py
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Modern-Amber" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Modern-Classic" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Modern-Ice" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)

build_original: build.py
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Original-Amber" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Original-Classic" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py -p "$(bitmaps_dir)/Bibata-Original-Ice" --xsizes $(X_SIZES) --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)

build_unix: build_modern_unix build_original_unix

build_modern_unix: build.py
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Modern-Amber" --xsizes $(X_SIZES)
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Modern-Classic" --xsizes $(X_SIZES)
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Modern-Ice" --xsizes $(X_SIZES)

build_original_unix: build.py
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Original-Amber" --xsizes $(X_SIZES)
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Original-Classic" --xsizes $(X_SIZES)
	@. venv/bin/activate; python3 build.py unix -p "$(bitmaps_dir)/Bibata-Original-Ice" --xsizes $(X_SIZES)

build_windows: build_modern_windows build_original_windows

build_modern_windows: build.py
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Modern-Amber" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Modern-Classic" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Modern-Ice" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)

build_original_windows: build.py
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Original-Amber" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Original-Classic" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
	@. venv/bin/activate; python3 build.py windows -p "$(bitmaps_dir)/Bibata-Original-Ice" --win-size $(WIN_SIZE) --win-canvas-size $(WIN_CANVAS_SIZE)
