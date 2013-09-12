#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

rm -rf ~/mint_setup_tmp/emacs
mkdir ~/mint_setup_tmp/emacs
cp $(pwd)/conf/emacs/emacs-24.2.tar.gz ~/mint_setup_tmp/emacs
pushd ~/mint_setup_tmp/emacs
tar -zxvf emacs-24.2.tar.gz
cd emacs-24.2
./configure
make
make install
popd
rm -rf ~/mint_setup_tmp/emacs
