#!/bin/bash

set -e

echo
echo Installing Anki

mkdir -p ~/tmp/anki
pushd ~/tmp/anki
wget https://anki.googlecode.com/files/anki-2.0.12.deb
sudo apt-get install -y python-sqlalchemy
dpkg -i anki-2.0.12.deb
popd
rm -rf ~/tmp/anki
