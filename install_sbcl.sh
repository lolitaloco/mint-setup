#!/bin/bash
set -e

echo
echo Build SBCL from source, so we are using a good version with threading enabled

apt-get -y install clisp

rm -rf ~/mint_setup_tmp/sbcl
mkdir -p ~/mint_setup_tmp/sbcl
curl "http://aarnet.dl.sourceforge.net/project/sbcl/sbcl/1.1.18/sbcl-1.1.18-source.tar.bz2" > sbcl-source.tar.bz2
cp sbcl-source.tar.bz2 ~/mint_setup_tmp/sbcl
pushd ~/mint_setup_tmp/sbcl
bunzip2 sbcl-source.tar.bz2
tar -xvf sbcl-source.tar
cd sbcl-1.1.18
sh make.sh clisp
INSTALL_ROOT=/usr/local sh install.sh
popd

rm -f sbcl-source.tar.bz2
rm -rf ~/mint_setup_tmp/sbcl
apt-get purge -y clisp
