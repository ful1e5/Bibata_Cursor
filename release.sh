#!/bin/bash
# A script for preparing binaries for version release of Bibata Cursors, by Abdulkaiz Khatri


declare -A names
names["Bibata-Modern-Amber"]="Yellowish and rounded edge Bibata cursors."
names["Bibata-Modern-Classic"]="Black and rounded edge Bibata cursors."
names["Bibata-Modern-Ice"]="White and rounded edge Bibata cursors."
names["Bibata-Original-Amber"]="Yellowish and sharp edge Bibata cursors."
names["Bibata-Original-Classic"]="Black and sharp edge Bibata cursors."
names["Bibata-Original-Ice"]="White and sharp edge Bibata cursors."

# Cleanup old builds
rm -rf themes

# Building Bibata XCursor binaries
for key in "${!names[@]}";
do
    comment="${names[$key]}";
    ctgen build.toml -p x11 -d "bitmaps/$key" -n "$key" -c "$comment" &
    PID=$!
    wait $PID
done


# Building Bibata Windows binaries
for key in "${!names[@]}";
do
    comment="${names[$key]}";
    ctgen build.toml -p windows -s 16 -d "bitmaps/$key" -n "$key-Small" -c "$comment" &
    ctgen build.toml -p windows -s 24 -d "bitmaps/$key" -n "$key-Regular" -c "$comment" &
    ctgen build.toml -p windows -s 32 -d "bitmaps/$key" -n "$key-Large" -c "$comment" &
    ctgen build.toml -p windows -s 48 -d "bitmaps/$key" -n "$key-Extra-Large" -c "$comment" &
    PID=$!
    wait $PID
done

# Compressing Binaries
mkdir -p bin

for key in "${!names[@]}";
do
    tar -czvf "bin/${key}.tar.gz" "themes/${key}" &
    PID=$!
    wait $PID
done

for key in "${!names[@]}";
do
    zip -rv "bin/${key}-Windows.zip" "themes/${key}-Small-Windows" "themes/${key}-Regular-Windows" "themes/${key}-Large-Windows" "themes/${key}-Extra-Large-Windows" &
    PID=$!
    wait $PID
done
