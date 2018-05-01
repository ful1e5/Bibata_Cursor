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
DIR4X_Bibata="build/Bibata_Oil/48x48"
DIR3X_Bibata="build/Bibata_Oil/32x32"
DIR2X_Bibata="build/Bibata_Oil/28x28"
DIR1X_Bibata="build/Bibata_Oil/24x24"

DIR4X_Bibata_Light="build/Bibata_Ice/48x48"
DIR3X_Bibata_Light="build/Bibata_Ice/32x32"
DIR2X_Bibata_Light="build/Bibata_Ice/28x28"
DIR1X_Bibata_Light="build/Bibata_Ice/24x24"

DIR4X_Bibata_Amber="build/Bibata_Amber/48x48"
DIR3X_Bibata_Amber="build/Bibata_Amber/32x32"
DIR2X_Bibata_Amber="build/Bibata_Amber/28x28"
DIR1X_Bibata_Amber="build/Bibata_Amber/24x24"


OUTPUT_Bibata="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata)"
OUTPUT_Bibata=${OUTPUT_Bibata// /_}
OUTPUT_Bibata_Light="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Light)"
OUTPUT_Bibata_Light=${OUTPUT_Bibata_Light// /_}
OUTPUT_Bibata_Amber="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Amber)"
OUTPUT_Bibata_Amber=${OUTPUT_Bibata_Amber// /_}


mkdir -p "$DIR4X_Bibata"
mkdir -p "$DIR3X_Bibata"
mkdir -p "$DIR2X_Bibata"
mkdir -p "$DIR1X_Bibata"
mkdir -p "$DIR4X_Bibata_Light"
mkdir -p "$DIR3X_Bibata_Light"
mkdir -p "$DIR2X_Bibata_Light"
mkdir -p "$DIR1X_Bibata_Light"
mkdir -p "$DIR4X_Bibata_Amber"
mkdir -p "$DIR3X_Bibata_Amber"
mkdir -p "$DIR2X_Bibata_Amber"
mkdir -p "$DIR1X_Bibata_Amber"

mkdir -p "$OUTPUT_Bibata/cursors"
mkdir -p "$OUTPUT_Bibata_Light/cursors"
mkdir -p "$OUTPUT_Bibata_Amber/cursors"
echo 'Making Folders... DONE';


for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps... $BASENAME\\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR1X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR2X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR3X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR4X_Bibata/$BASENAME.png" > /dev/null

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR1X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR2X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR3X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR4X_Bibata_Light/$BASENAME.png" > /dev/null

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR1X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR2X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR3X_Bibata_Amber/$BASENAME.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/"$BASENAME".svg -e "$DIR4X_Bibata_Amber/$BASENAME.png" > /dev/null

done
echo -e "\033[0KGenerating simple cursor pixmaps... DONE"



for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Oil... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR1X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR2X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR3X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR4X_Bibata/progress-$i.png" > /dev/null

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR1X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR2X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR3X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR4X_Bibata/wait-$i.png" > /dev/null

done
echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Oil... DONE"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Ice... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR1X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR2X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR3X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR4X_Bibata_Light/progress-$i.png" > /dev/null

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR1X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR2X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR3X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR4X_Bibata_Light/wait-$i.png" > /dev/null

done
echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Ice... DONE"

for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps For Bibata Amber... $i / 45 \\r"

    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR1X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR2X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR3X_Bibata_Amber/progress-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/progress-$i.svg -e "$DIR4X_Bibata_Amber/progress-$i.png" > /dev/null


    inkscape -w 24 -h 24 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR1X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 28 -h 28 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR2X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 32 -h 32 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR3X_Bibata_Amber/wait-$i.png" > /dev/null
    inkscape -w 48 -h 48 --without-gui -f $RAWSVGS_Bibata_Amber/wait-$i.svg -e "$DIR4X_Bibata_Amber/wait-$i.png" > /dev/null

done
echo -e "\033[0KGenerating animated cursor pixmaps For Bibata Amber... DONE"


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
