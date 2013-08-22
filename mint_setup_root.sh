#!/bin/bash
set -e

echo
echo Update and upgrade from all repositories
apt-get update -y
apt-get upgrade -y

echo
echo Install StumpWM and dependencies
apt-get purge -y pulseaudio
apt-get install -y stumpwm network-manager-gnome trayer cl-swank cl-clx-sbcl xloadimage alsa-utils
cp -f $(pwd)/conf/stumpwm/stumpwm.desktop /usr/share/xsessions/stumpwm.desktop

echo Install RVM dependencies
apt-get -y install libreadline6-dev libyaml-dev sqlite3 libgdbm-dev bison libffi-dev

echo
echo Install miscellaneous stuff
apt-get -y install acidrip audacity autoconf automake build-essential ccrypt checkinstall chromium-browser curl dia dosbox ec2-api-tools eclipse frotz g++ gettext gimp git-core gitg gnome-rdp gparted gqview inform inotify-tools irssi k3b lame latex2html libav-tools libfaac-dev libgif-dev libgtk2.0-dev libjpeg-dev libncurses-dev libnotify-bin libopencore-amrnb-dev libpng-dev libpq-dev libreadline6-dev libreadline-gplv2-dev libsqlite3-dev libssl-dev libtheora-dev libtiff-dev libtool libusb-dev libvorbis-dev libx11-dev libxine1-ffmpeg libxpm-dev libxslt-dev lynx lyx markdown nautilus net-tools openssh-server pdftk php5-cli php5-curl postgresql pwgen python-pip rdesktop shtool subversion texinfo tmux tofrodos vice vim wine xclip xsane xtightvncviewer

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

./install_ffmpeg.sh
./install_sbcl.sh

echo
echo Make StumpWM use SBCL, not CLISP
apt-get purge -y clisp
if !(grep -q sbcl /etc/profile)
  then echo export LISP=sbcl >> /etc/profile
fi

./install_spotify.sh
./install_emacs.sh
./install_rsense.sh
./install_nixnote.sh
./install_anki.sh
