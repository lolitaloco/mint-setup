#!/bin/bash
set -e

echo
echo Installing fonts
echo

mkdir -p /usr/share/fonts/truetype
cp $(pwd)/conf/fonts/*.ttf /usr/share/fonts/truetype
fc-cache -fv
