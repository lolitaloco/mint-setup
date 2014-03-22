#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

rm -rf ~/mint_setup_tmp/emacs
mkdir ~/mint_setup_tmp/emacs
pushd ~/mint_setup_tmp/emacs
wget http://mirror.aarnet.edu.au/pub/gnu/emacs/emacs-24.3.tar.gz
tar -zxvf emacs-24.3.tar.gz
cd emacs-24.3
./configure
make
make install
popd
rm -rf ~/mint_setup_tmp/emacs
