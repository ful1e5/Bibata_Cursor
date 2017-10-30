#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
RAWSVGS_Bibata="src/Bibata/svgs"
INDEX_Bibata="src/Bibata/cursor.theme"
INDEX1_Bibata="src/Bibata/index.theme"
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
DIR2X_Bibata="build/Bibata/x2"
DIR1X_Bibata="build/Bibata/x1"
OUTPUT_Bibata="$(grep --only-matching --perl-regex "(?<=Name\=).*$" $INDEX_Bibata)"
OUTPUT_Bibata=${OUTPUT_Bibata// /_}
mkdir -p "$DIR2X_Bibata"
mkdir -p "$DIR1X_Bibata"
mkdir -p "$OUTPUT_Bibata/cursors"
echo 'Making Folders... DONE';


for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    echo -ne "\033[0KGenerating simple cursor pixmaps... $BASENAME\\r"

    inkscape -w 32  -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR1X_Bibata/$BASENAME.png" > /dev/null
    inkscape -w 64 -f $RAWSVGS_Bibata/"$BASENAME".svg -e "$DIR2X_Bibata/$BASENAME.png" > /dev/null
done
echo -e "\033[0KGenerating simple cursor pixmaps... DONE"



for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
do
    echo -ne "\033[0KGenerating animated cursor pixmaps... $i / 31 \\r"

    inkscape -w 32  -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR1X_Bibata/progress-$i.png" > /dev/null
    inkscape -w 64 -f $RAWSVGS_Bibata/progress-$i.svg -e "$DIR2X_Bibata/progress-$i.png" > /dev/null

    inkscape -w 32  -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR1X_Bibata/wait-$i.png" > /dev/null
    inkscape -w 64 -f $RAWSVGS_Bibata/wait-$i.svg -e "$DIR2X_Bibata/wait-$i.png" > /dev/null
done
echo -e "\033[0KGenerating animated cursor pixmaps... DONE"



echo -ne "Generating cursor theme...\\r"
for CUR in src/config/*.cursor; do
    BASENAME=$CUR
    BASENAME=${BASENAME##*/}
    BASENAME=${BASENAME%.*}

    ERR="$( xcursorgen -p build/Bibata "$CUR" "$OUTPUT_Bibata/cursors/$BASENAME" 2>&1 )"
    
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
    ln -sf "$TO" "$OUTPUT_Bibata/cursors/$FROM"
done < $ALIASES
echo -e "\033[0KGenerating shortcuts... DONE"

echo -ne "Copying Theme Index...\\r"

    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cp $INDEX_Bibata "$OUTPUT_Bibata/cursor.theme"
        cp $INDEX1_Bibata "$OUTPUT_Bibata/index.theme"
    fi
echo -e "\033[0KCopying Theme Index... DONE"


echo -ne "Generating Installer...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        cp src/in.inst Bibata_installer.sh
    fi
echo -e "\033[0KGenerating Installer... DONE"

echo -ne "Making Installer Executable...\\r"
    if ! [ -e "$OUTPUT_Bibata/$INDEX_Bibata" ] ; then
        cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
        gksu chmod +x Bibata_installer.sh
    fi

show_Msg() {
  echo -e "\033[1;34m$@\033[0m"
}
echo -e "\033[0KMaking Installer Executable... DONE"

show_Msg "For Installation Use Following Command:\n    ./Bibata_installer.sh"
exit

echo "COMPLETE!"

