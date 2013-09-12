#!/bin/bash
set -e

echo
echo Downloading and installing RSense

mkdir -p ~/mint_setup_tmp/rsense
pushd ~/mint_setup_tmp/rsense

wget http://cx4a.org/pub/rsense/rsense-0.3.zip
unzip rsense-0.3.zip
cp -av rsense-0.3 /opt

popd
rm -rf ~/mint_setup_tmp/rsense
