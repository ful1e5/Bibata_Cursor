#!/bin/bash

animate_fix(){
    cursor=$1
    file=$2

    path=./$cursor/bitmaps/$file.in
    #sort -k 4 ./move/left_ptr_watch.in
    mv -f $path $path.bak


    for j in {1..5}
    do
        for i in {1..60}
        do
        line=`sed -n '1~60'p $path.bak | sed -n "$j"p`
        number=`echo $i | awk '{ printf "%04i\n", $0 }'`
        line=${line/${file}_0001.png/${file}_${number}.png}
        echo "$line" >> $path
        
        #echo "$line"
        done
    done

    fixed_line=`sed 's/[0-9] [0-9]*$/25/' $path`
    echo "$fixed_line" > $path

    rm -rf $path.bak
}

animate_fix "$1" "left_ptr_watch"
animate_fix "$1" "watch"

#if script generate error or success
if [ $? -ne 0 ]
    then
		exit 1
fi