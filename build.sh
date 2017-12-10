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
DIR2X_Bibata="build/Bibata_Oil/x2"
DIR1X_Bibata="build/Bibata_Oil/x1"
DIR2X_Bibata_Light="build/Bibata_Ice/x2"
DIR1X_Bibata_Light="build/Bibata_Ice/x1"

OUTPUT_Bibata="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata)"
OUTPUT_Bibata=${OUTPUT_Bibata// /_}
OUTPUT_Bibata_Light="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata_Light)"
OUTPUT_Bibata_Light=${OUTPUT_Bibata_Light// /_}
mkdir -p "$DIR2X_Bibata"
mkdir -p "$DIR1X_Bibata"
mkdir -p "$DIR2X_Bibata_Light"
mkdir -p "$DIR1X_Bibata_Light"
mkdir -p "$OUTPUT_Bibata/cursors"
mkdir -p "$OUTPUT_Bibata_Light/cursors"
echo 'Making Folders... DONE';


for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps... $BASENAME\\r"

    inkscape -w 33  -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR1X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR2X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 33  -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR1X_Bibata_Light/$BASENAME.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata_Light/"$BASENAME".svg -e "$DIR2X_Bibata_Light/$BASENAME.png" > /dev/null
done
echo -e "\033[0KGenerating simple cursor pixmaps... DONE"



for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
do
    echo -ne "\033[0KGenerating animated cursor pixmaps... $i / 45 \\r"

    inkscape -w 33  -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR1X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR2X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 33  -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR1X_Bibata_Light/progress-$i.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata_Light/progress-$i.svg -e "$DIR2X_Bibata_Light/progress-$i.png" > /dev/null

    inkscape -w 33  -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR1X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR2X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 33  -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR1X_Bibata_Light/wait-$i.png" > /dev/null
    inkscape -w 66 -f $RAWSVGS_Bibata_Light/wait-$i.svg -e "$DIR2X_Bibata_Light/wait-$i.png" > /dev/null
done
echo -e "\033[0KGenerating animated cursor pixmaps... DONE"



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

