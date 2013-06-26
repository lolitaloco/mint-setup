#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

rm -rf /tmp/emacs
mkdir /tmp/emacs
cp $(pwd)/conf/emacs/emacs-24.2.tar.gz /tmp/emacs
pushd /tmp/emacs
tar -zxvf emacs-24.2.tar.gz
cd emacs-24.2
./configure
make
make install
popd
rm -rf /tmp/emacs
