#!/bin/bash
set -e

echo
echo Build SBCL from source, so we are using a good version with threading enabled

apt-get -y install clisp
rm -rf /tmp/sbcl
mkdir /tmp/sbcl
cp $(pwd)/src/sbcl-1.0.54-source.tar.gz /tmp/sbcl
pushd /tmp/sbcl
tar -zxvf sbcl-1.0.54-source.tar.gz
cd sbcl-1.0.54
sh make.sh clisp
INSTALL_ROOT=/usr/local sh install.sh
popd
rm -rf /tmp/sbcl
