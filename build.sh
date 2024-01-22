#!/bin/bash
# A script for preparing binaries of Bibata Cursors, by Abdulkaiz Khatri

error() (
  set -o pipefail
  "$@" 2> >(sed $'s,.*,\e[31m&\e[m,' >&2)
)

get_config_file() {
  local key="${1}"
  local cfg_file="build.toml"

  if [[ $key == *"Right"* ]]; then
    cfg_file="build.right.toml"
  fi

  echo $cfg_file
}

if ! type -p ctgen >/dev/null; then
  error ctgen
  exit 127 # exit program with "command not found" error code
fi

declare -A names
names["Bibata-Modern-Amber"]="Yellowish and rounded edge Bibata cursors."
names["Bibata-Modern-Amber-Right"]="Yellowish and rounded edge right-hand Bibata cursors."
names["Bibata-Modern-Classic"]="Black and rounded edge Bibata cursors."
names["Bibata-Modern-Classic-Right"]="Black and rounded edge right-hand Bibata cursors."
names["Bibata-Modern-Ice"]="White and rounded edge Bibata cursors."
names["Bibata-Modern-Ice-Right"]="White and rounded edge right-hand Bibata cursors."
names["Bibata-Original-Amber"]="Yellowish and sharp edge Bibata cursors."
names["Bibata-Original-Amber-Right"]="Yellowish and sharp edge right-hand Bibata cursors."
names["Bibata-Original-Classic"]="Black and sharp edge Bibata cursors."
names["Bibata-Original-Classic-Right"]="Black and sharp edge right-hand Bibata cursors."
names["Bibata-Original-Ice"]="White and sharp edge Bibata cursors."
names["Bibata-Original-Ice-Right"]="White and sharp edge right-hand Bibata cursors."

# Cleanup old builds
rm -rf themes bin

# Building Bibata XCursor binaries
for key in "${!names[@]}"; do
  comment="${names[$key]}"
  cfg=$(get_config_file key)

  ctgen "$cfg" -p x11 -d "bitmaps/$key" -n "$key" -c "$comment" &
  PID=$!
  wait $PID
done

# Building Bibata Windows binaries
for key in "${!names[@]}"; do
  comment="${names[$key]}"
  cfg=$(get_config_file key)

  ctgen "$cfg" -p windows -s 16 -d "bitmaps/$key" -n "$key-Small" -c "$comment" &
  ctgen "$cfg" -p windows -s 24 -d "bitmaps/$key" -n "$key-Regular" -c "$comment" &
  ctgen "$cfg" -p windows -s 32 -d "bitmaps/$key" -n "$key-Large" -c "$comment" &
  ctgen "$cfg" -p windows -s 48 -d "bitmaps/$key" -n "$key-Extra-Large" -c "$comment" &
  PID=$!
  wait $PID
done

# Compressing Binaries
mkdir -p bin
cd themes || exit

for key in "${!names[@]}"; do
  tar -cJvf "../bin/${key}.tar.xz" "${key}" &
  PID=$!
  wait $PID
done

# Compressing Bibata.tar.xz
cp ../LICENSE .
tar -cJvf "../bin/Bibata.tar.xz" --exclude="*-Windows" . &
PID=$!
wait $PID

# Compressing Bibata-*-Windows
for key in "${!names[@]}"; do
  zip -rv "../bin/${key}-Windows.zip" "${key}-Small-Windows" "${key}-Regular-Windows" "${key}-Large-Windows" "${key}-Extra-Large-Windows" &
  PID=$!
  wait $PID
done

cd ..

# Copying License File for 'bitmaps'
cp LICENSE bitmaps/
zip -rv bin/bitmaps.zip bitmaps
