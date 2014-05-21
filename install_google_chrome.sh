#!/bin/bash
set -e

echo
echo Downloading and installing Emacs from source
echo

apt-get install -y libxss1

mkdir -p ~/mint-setup-tmp/chrome
pushd ~/mint-setup-tmp/chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb

popd
rm -rf ~/mint-setup-tmp/chrome
