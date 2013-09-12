#!/bin/bash
set -e

echo
echo Build SBCL from source, so we are using a good version with threading enabled

apt-get -y install clisp
rm -rf /tmp/sbcl
mkdir /tmp/sbcl
cp $(pwd)/src/sbcl-1.1.11-source.tar.bz2 /tmp/sbcl
pushd /tmp/sbcl
bunzip2 sbcl-1.1.11-source.tar.bz2
tar -xvf sbcl-1.1.11-source.tar
cd sbcl-1.1.11
sh make.sh clisp
INSTALL_ROOT=/usr/local sh install.sh
popd
rm -rf /tmp/sbcl
