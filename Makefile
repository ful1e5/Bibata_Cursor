# Usage:
# make  NAME=CURSOR_NAME     # build cursor
# make link NAME=CURSOR_NAME #for generating cursor X11 and Window both
# make clean  # remove ALL cursors and objects

.DEFAULT_GOAL := build

build:
	@echo "installing Requirements..."
	pip3 install -r requirements.txt 
	@echo "Building $(NAME)..."
	python3 render-cursors.py ./src/$(NAME)/source-cursors.svg -o -a --name $(NAME)

.PHONY := link
link:
	./x11-make.sh $(NAME)
	cp src/$(NAME)/*.theme $(NAME)/out/X11/$(NAME)
	./w32-make.sh $(NAME)

.PHONY := clean	
clean:
	@echo "Cleaning Up..."
	rm -rf ./Bibata_*