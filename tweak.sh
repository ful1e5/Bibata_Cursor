#!/bin/bash

animate_fix(){
    cursor=$1
    file=$2

    path="./$cursor/bitmaps/$file.in"
    sort -k 4 -o "$path" "$path"
    mv -f "$path" "$path.bak"

    # j for total size 24,28,32,40,48,56,64,72,80,88,96 = 11
    for j in {1..11}
    do
        for i in {1..60}
        do
        line=`sed -n '1~60'p $path.bak | sed -n "$j"p`
        # echo "$line"
        number=`echo $i | awk '{ printf "%04i\n", $0 }'`
        # echo "$number"
        line=${line/${file}_0001.png/${file}_${number}.png}
        # echo "$line"
        echo "$line" >> $path
        
        # echo "$line"
        done
    done

    fixed_line=`sed 's/[0-9][0-9]*$/40/' $path`
    echo "$fixed_line" > $path

    rm -rf $path.bak
}

if [ "$1" != "" ]; then
    animate_fix "$1" "left_ptr_watch"
    animate_fix "$1" "watch"
else
    exit 1
fi


# if script generate error or success
if [ $? -ne 0 ]
    then
		exit 1
fi