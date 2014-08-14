#!/bin/bash
set -e

rm -rf ~/mint_setup_tmp
mkdir ~/mint_setup_tmp

echo
echo Update and upgrade from all repositories
apt-get update -y
apt-get upgrade -y

echo
echo Install miscellaneous stuff
apt-get -y install acidrip audacity autoconf automake build-essential ccrypt checkinstall chromium-browser cinnamon-screensaver curl dia dosbox ec2-api-tools eclipse frotz g++ gettext gimp git-core gitg gnome-rdp gnutls-bin gparted geeqie hfsprogs inform inotify-tools irssi k3b lame latex2html libav-tools libfaac-dev libgif-dev libgtk2.0-dev libjpeg-dev libncurses-dev libnotify-bin libopencore-amrnb-dev libpng-dev libpq-dev libreadline6-dev libsqlite3-dev libssl-dev libtheora-dev libtiff-dev libtool libusb-dev libvorbis-dev libx11-dev libxine1-ffmpeg libxpm-dev libxslt-dev lynx lyx markdown nautilus nemo net-tools openssh-server pdftk php5-cli php5-curl pinta postgresql pwgen python-pip rdesktop shtool subversion terminator texinfo tmux tofrodos tree unison usb-creator-gtk vice vim wine xclip xsane xscreensaver xscreensaver-gl xtightvncviewer

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

echo
echo Configuring swapcaps on resume
rm -f /etc/pm/sleep.d/swapcaps
ln -s $(pwd)/conf/bin/swapcaps /etc/pm/sleep.d/swapcaps
chmod a+x /etc/pm/sleep.d/swapcaps

./install_sbcl.sh
./install_stumpwm.sh
./install_spotify.sh
./install_sublime.sh
./install_emacs.sh
./install_rsense.sh
./install_go.sh
./install_mac_kb.sh
./install_virtualbox.sh

rm -rf ~/mint_setup_tmp
