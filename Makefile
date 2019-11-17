# Usage:
# make        # build cursors
# make clean  # remove ALL cursors and objects

.DEFAULT_GOAL := build

build:

	@echo "installing Requirements..."
	pip3 install --allow-all-external requirements.txt 

	@echo "Building Bibata Classic..."
	python render-cursors.py ./src/Bibata_Classic/source-cursors.svg -o -a --name Bibata_Classic
	sh x11-make.sh Bibata_Classic
	cp src/Bibata_Classic/*.theme Bibata_Classic/out/X11/Bibata_Classic
	sh w32-make.sh Bibata_Classic

	@echo "Building Bibata Oil..."
	python render-cursors.py ./src/Bibata_Oil/source-cursors.svg -o -a --name Bibata_Oil
	sh x11-make.sh Bibata_Oil
	cp src/Bibata_Oil/*.theme Bibata_Oil/out/X11/Bibata_Oil
	sh w32-make.sh Bibata_Oil

	@echo "Building Bibata Ice..."
	python render-cursors.py ./src/Bibata_Ice/source-cursors.svg -o -a --name Bibata_Ice
	sh x11-make.sh Bibata_Ice
	cp src/Bibata_Ice/*.theme Bibata_Ice/out/X11/Bibata_Ice
	sh w32-make.sh Bibata_Ice

	@echo "Building Bibata Amber..."
	python render-cursors.py ./src/Bibata_Amber/source-cursors.svg -o -a --name Bibata_Amber
	sh x11-make.sh Bibata_Amber
	cp src/Bibata_Amber/*.theme Bibata_Amber/out/X11/Bibata_Amber
	sh w32-make.sh Bibata_Amber

clean:
	@echo "Cleaning Up..."
	rm -rf ./Bibata_*