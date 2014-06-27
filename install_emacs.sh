#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

apt-get install -y libtiff-dev

rm -rf ~/mint_setup_tmp/emacs
mkdir ~/mint_setup_tmp/emacs
pushd ~/mint_setup_tmp/emacs
wget ftp://alpha.gnu.org/gnu/emacs/pretest/emacs-24.3.91.tar.xz
tar -xvf emacs-24.3.91.tar.xz
cd emacs-24.3.91
./configure
make
make install
popd
rm -rf ~/mint_setup_tmp/emacs
