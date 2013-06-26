#!/bin/bash

set -e

echo
echo Build FFMPEG from source, as the Mint version is borked

rm -rf ~/tmp/ffmpeg
mkdir -p ~/tmp/ffmpeg
pushd ~/tmp/ffmpeg

wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
pushd yasm-1.2.0
./configure
make
sudo checkinstall --pkgname=yasm --pkgversion="1.2.0" --backup=no --deldoc=yes --default
popd

git clone --depth 1 git://git.videolan.org/x264
pushd x264
./configure --enable-static
make
sudo checkinstall --pkgname=x264 --default --pkgversion="3:$(./version.sh | \
    awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes
popd

sudo apt-get remove libmp3lame-dev
sudo apt-get install nasm
wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
pushd lame-3.99.5
./configure --enable-nasm --disable-shared
make
sudo checkinstall --pkgname=lame-ffmpeg --pkgversion="3.99.5" --backup=no --default \
    --deldoc=yes
popd

git clone --depth 1 http://git.chromium.org/webm/libvpx.git
pushd libvpx
./configure
make
sudo checkinstall --pkgname=libvpx --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no \
    --default --deldoc=yes
popd

git clone --depth 1 git://source.ffmpeg.org/ffmpeg
pushd ffmpeg
./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb \
    --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libvpx \
    --enable-libx264 --enable-nonfree --enable-version3 --enable-x11grab
make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:$(./version.sh)" --backup=no \
    --deldoc=yes --default
hash x264 ffmpeg ffplay ffprobe
popd

popd
rm -rf ~/tmp/ffmpeg
