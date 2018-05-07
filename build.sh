#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

# Bibata Default
RAWSVGS_Bibata="src/Bibata_Oil/svgs"
INDEX_Bibata="src/Bibata_Oil/cursor.theme"
INDEX1_Bibata="src/Bibata_Oil/index.theme"

# Bibata Light

RAWSVGS_Bibata_Light="src/Bibata_Ice/svgs"
INDEX_Bibata_Light="src/Bibata_Ice/cursor.theme"
INDEX1_Bibata_Light="src/Bibata_Ice/index.theme"

# Bibata Amber

RAWSVGS_Bibata_Amber="src/Bibata_Amber/svgs"
INDEX_Bibata_Amber="src/Bibata_Amber/cursor.theme"
INDEX1_Bibata_Amber="src/Bibata_Amber/index.theme"

ALIASES="src/cursorList"


echo -ne "Checking Requirements...\\r"

if  ! type "inkscape" > /dev/null ; then
    echo -e "\\nFAIL: inkscape must be installed"
    exit 1
fi

if  ! type "xcursorgen" > /dev/null ; then
    echo -e "\\nFAIL: xcursorgen must be installed"
    exit 1
fi
echo -e "Checking Requirements... DONE"



echo -ne "Making Folders... $BASENAME\\r"
DIR11X_Bibata="build/Bibata_Oil/96x96"
DIR10X_Bibata="build/Bibata_Oil/88x88"
DIR9X_Bibata="build/Bibata_Oil/80x80"
DIR8X_Bibata="build/Bibata_Oil/72x72"
DIR7X_Bibata="build/Bibata_Oil/64x64"
DIR6X_Bibata="build/Bibata_Oil/56x56"
DIR5X_Bibata="build/Bibata_Oil/48x48"
DIR4X_Bibata="build/Bibata_Oil/40x40"
DIR3X_Bibata="build/Bibata_Oil/32x32"
DIR2X_Bibata="build/Bibata_Oil/28x28"
DIR1X_Bibata="build/Bibata_Oil/24x24"

DIR11X_Bibata_Light="build/Bibata_Ice/96x96"
DIR10X_Bibata_Light="build/Bibata_Ice/88x88"
DIR9X_Bibata_Light="build/Bibata_Ice/80x80"
DIR8X_Bibata_Light="build/Bibata_Ice/72x72"
DIR7X_Bibata_Light="build/Bibata_Ice/64x64"
DIR6X_Bibata_Light="build/Bibata_Ice/56x56"
DIR5X_Bibata_Light="build/Bibata_Ice/48x48"
DIR4X_Bibata_Light="build/Bibata_Ice/40x40"
DIR3X_Bibata_Light="build/Bibata_Ice/32x32"
DIR2X_Bibata_Light="build/Bibata_Ice/28x28"
DIR1X_Bibata_Light="build/Bibata_Ice/24x24"


DIR11X_Bibata_Amber="build/Bibata_Amber/96x96"
DIR10X_Bibata_Amber="build/Bibata_Amber/88x88"
DIR9X_Bibata_Amber="build/Bibata_Amber/80x80"
DIR8X_Bibata_Amber="build/Bibata_Amber/72x72"
DIR7X_Bibata_Amber="build/Bibata_Amber/64x64"
DIR6X_Bibata_Amber="build/Bibata_Amber/56x56"
DIR5X_Bibata_Amber="build/Bibata_Amber/48x48"
DIR4X_Bibata_Amber="build/Bibata_Amber/40x40"
DIR3X_Bibata_Amber="build/Bibata_Amber/32x32"
DIR2X_Bibata_Amber="build/Bibata_Amber/28x28"
DIR1X_Bibata_Amber="build/Bibata_Amber/24x24"


OUTPUT_Bibata="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata)"
OUTPUT_Bibata=${OUTPUT_Bibata// /_}
OUTPUT_Bibata_Light="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Light)"
OUTPUT_Bibata_Light=${OUTPUT_Bibata_Light// /_}
OUTPUT_Bibata_Amber="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Amber)"
OUTPUT_Bibata_Amber=${OUTPUT_Bibata_Amber// /_}


mkdir -p "$DIR11X_Bibata" "$DIR10X_Bibata" "$DIR9X_Bibata" "$DIR8X_Bibata" "$DIR7X_Bibata" "$DIR6X_Bibata" "$DIR5X_Bibata" "$DIR4X_Bibata" "$DIR3X_Bibata" "$DIR2X_Bibata" "$DIR1X_Bibata"

mkdir -p "$DIR11X_Bibata_Light" "$DIR10X_Bibata_Light" "$DIR9X_Bibata_Light" "$DIR8X_Bibata_Light" "$DIR7X_Bibata_Light" "$DIR6X_Bibata_Light" "$DIR5X_Bibata_Light" "$DIR4X_Bibata_Light" "$DIR3X_Bibata_Light" "$DIR2X_Bibata_Light" "$DIR1X_Bibata_Light"

mkdir -p "$DIR11X_Bibata_Amber" "$DIR10X_Bibata_Amber" "$DIR9X_Bibata_Amber" "$DIR8X_Bibata_Amber" "$DIR7X_Bibata_Amber" "$DIR6X_Bibata_Amber" "$DIR5X_Bibata_Amber" "$DIR4X_Bibata_Amber" "$DIR3X_Bibata_Amber" "$DIR2X_Bibata_Amber" "$DIR1X_Bibata_Amber"


mkdir -p "$OUTPUT_Bibata/cursors"
mkdir -p "$OUTPUT_Bibata_Light/cursors"
mkdir -p "$OUTPUT_Bibata_Amber/cursors"
echo 'Making Folders... DONE';


for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata Oil... $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR1X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR2X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR3X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR4X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR5X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR6X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR7X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR8X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR9X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR10X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR11X_Bibata/$BASENAME.png" > /dev/null


done
    echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata Oil... DONE"

for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata Ice.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR1X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR2X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR3X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR4X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR5X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR6X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR7X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR8X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR9X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR10X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR11X_Bibata_Light/$BASENAME.png" > /dev/null

done
    echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata Ice... DONE"

for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps OF Bibata Amber.. $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR1X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR2X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR3X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR4X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR5X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR6X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR7X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR8X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR9X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR10X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR11X_Bibata_Amber/$BASENAME.png" > /dev/null

done
    echo -e "\033[0KGenerating simple cursor pixmaps OF Bibata Amber... DONE"

    echo -ne "\033[0KGenerating Animated Cursor Bibata Oil... \\r"
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Oil Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR1X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR2X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR3X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR4X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR5X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR6X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR7X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR8X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR9X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR10X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR11X_Bibata/progress-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Oil Process... DONE"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Oil Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR1X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR2X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR3X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR4X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR5X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR6X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR7X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR8X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR9X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR10X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR11X_Bibata/wait-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Oil Wait... DONE"
    echo -ne "\033[0KGenerating Animated Cursor Bibata Oil... DONE \\r"

    echo -ne "\033[0KGenerating Animated Cursor Bibata Ice... \\r"
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Ice Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR1X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR2X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR3X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR4X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR5X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR6X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR7X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR8X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR9X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR10X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR11X_Bibata_Light/progress-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Ice Process... DONE"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Ice Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR1X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR2X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR3X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR4X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR5X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR6X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR7X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR8X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR9X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR10X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR11X_Bibata_Light/wait-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Ice Wait... DONE"
    echo -ne "\033[0KGenerating Animated Cursor Bibata Ice... DONE \\r"

    echo -ne "\033[0KGenerating Animated Cursor Bibata Amber...  \\r"
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Amber Process... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR1X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR2X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR3X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR4X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR5X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR6X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR7X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR8X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR9X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR10X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR11X_Bibata_Amber/progress-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Amber Process... DONE"
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Amber Wait... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR1X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR2X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR3X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 40 -h 40 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR4X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR5X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 56 -h 56 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR6X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 64 -h 64 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR7X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 72 -h 72 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR8X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 80 -h 80 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR9X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 88 -h 88 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR10X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 96 -h 96 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR11X_Bibata_Amber/wait-$i.png" > /dev/null

done
    echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Amber Wait... DONE"
    echo -ne "\033[0KGenerating Animated Cursor Bibata Amber... DONE \\r"

echo -ne "Generating cursor theme...\\r"
for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata_Oil "$CUR" "$OUTPUT_Bibata/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

    ERR="$( xcursorgen -p build/Bibata_Ice "$CUR" "$OUTPUT_Bibata_Light/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

    ERR="$( xcursorgen -p build/Bibata_Amber "$CUR" "$OUTPUT_Bibata_Amber/cursors/$BASENAME" 2>&1 )"

    if [[ "$?" -ne "0" ]]; then
        echo "FAIL: $CUR $ERR"
    fi

done
echo -e "Generating cursor theme... DONE"


echo -ne "Generating shortcuts...\\r"
while read -r ALIAS ; do
    FROM=${ALIAS% *}
    TO=${ALIAS#* }

    if [ -e "$OUTPUT_Bibata/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata/cursors/$FROM"

    if [ -e "$OUTPUT_Bibata_Light/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Light/cursors/$FROM"

    if [ -e "$OUTPUT_Bibata_Amber/cursors/$FROM" ] ; then
        continue
    fi
    ln -s "$TO" "$OUTPUT_Bibata_Amber/cursors/$FROM"

done < $ALIASES
echo -e "\033[0KGenerating shortcuts... DONE"


echo -ne "Copying Theme Index...\\r"

    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cp $INDEX_Bibata "$OUTPUT_Bibata/cursor.theme"
        cp $INDEX1_Bibata "$OUTPUT_Bibata/index.theme"
    fi

    if ! [ -e "$OUTPUT_Bibata_Light/$INDEX_Bibata_Light" ] ; then
        cp $INDEX_Bibata_Light "$OUTPUT_Bibata_Light/cursor.theme"
        cp $INDEX1_Bibata_Light "$OUTPUT_Bibata_Light/index.theme"
    fi
    if ! [ -e "$OUTPUT_Bibata_Amber/$INDEX_Bibata_Amber" ] ; then
        cp $INDEX_Bibata_Amber "$OUTPUT_Bibata_Amber/cursor.theme"
        cp $INDEX1_Bibata_Amber "$OUTPUT_Bibata_Amber/index.theme"
    fi
echo -e "\033[0KCopying Theme Index... DONE"


echo -ne "Generating Installer...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        cp src/in.inst Installer_Bibata.sh
    fi
echo -e "\033[0KGenerating Installer... DONE"

echo -ne "Making Installer Executable...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        gksu chmod +x Installer_Bibata.sh
    fi

show_Msg() {
  echo -e "\033[1;34m$@\033[0m"
}
show_command() {
  echo -e "\033[1;93m$@\033[0m"
}

echo -e "\033[0KMaking Installer Executable... DONE"

show_Msg "For Installation Use Following Command:\n\n"
show_command "\t sudo ./Installer_Bibata.sh\n"
exit

echo "COMPLETE!"
