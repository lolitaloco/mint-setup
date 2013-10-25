#!/bin/bash
set -e

mkdir ~/mint_setup_tmp

echo
echo Update and upgrade from all repositories
apt-get update -y
apt-get upgrade -y

echo
echo Install miscellaneous stuff
apt-get -y install acidrip audacity autoconf automake build-essential ccrypt checkinstall curl dia dosbox ec2-api-tools eclipse ffmpeg frotz g++ gettext gimp git-core gitg gnome-rdp gparted gqview hfsprogs inform inotify-tools irssi k3b lame latex2html libav-tools libfaac-dev libgif-dev libgtk2.0-dev libjpeg-dev libncurses-dev libnotify-bin libopencore-amrnb-dev libpng-dev libpq-dev libreadline6-dev libsqlite3-dev libssl-dev libtheora-dev libtiff-dev libtool libusb-dev libvorbis-dev libx11-dev libxine1-ffmpeg libxpm-dev libxslt-dev lynx lyx markdown nautilus net-tools openssh-server pdftk php5-cli php5-curl postgresql pwgen python-pip rdesktop shtool subversion texinfo tmux tofrodos usb-creator-gtk vice vim wine xclip xsane xtightvncviewer

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

./install_sbcl.sh
./install_stumpwm.sh
./install_spotify.sh
./install_emacs.sh
./install_rsense.sh
./install_nixnote.sh
./install_anki.sh

rm -rf ~/mint_setup_tmp
