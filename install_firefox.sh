#!/bin/bash
set -e

echo
echo Installing Firefox
echo

apt-get -y purge firefox

rm -rf ~/mint-setup-tmp/firefox
mkdir -p ~/mint-setup-tmp/firefox
pushd ~/mint-setup-tmp/firefox
wget https://download.mozilla.org/\?product\=firefox-40.0.3-SSL\&os\=linux64\&lang\=en-US -O firefox.tar.bz2
bunzip2 firefox.tar.bz2
tar -xvf firefox.tar
rm -rf /opt/firefox
mv firefox /opt
ln -s /opt/firefox/firefox /usr/local/bin/firefox

popd
rm -rf ~/mint-setup-tmp/firefox
