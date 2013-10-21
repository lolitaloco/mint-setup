#!/bin/bash

set -e

echo
echo Installing Anki

mkdir -p ~/mint_setup_tmp/anki
pushd ~/mint_setup_tmp/anki
wget http://ankisrs.net/download/mirror/anki-2.0.14.deb
sudo apt-get install -y python-sqlalchemy
dpkg -i anki-2.0.12.deb
popd
rm -rf ~/mint_setup_tmp/anki
