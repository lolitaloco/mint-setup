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
apt-get -y install acidrip audacity autoconf automake build-essential ccrypt checkinstall chromium-browser curl dia dosbox eclipse frotz gettext gimp git-core gitg gnome-rdp gparted gqview inform inotify-tools k3b lame latex2html libav-tools libfaac-dev libgif-dev libgtk2.0-dev libjpeg-dev libncurses-dev libnotify-bin libopencore-amrnb-dev libpng-dev libpq-dev libreadline6-dev libreadline-gplv2-dev libsqlite3-dev libssl-dev libtheora-dev libtiff-dev libtool libusb-dev libvorbis-dev libx11-dev libxine1-ffmpeg libxpm-dev libxslt-dev lynx lyx markdown nautilus net-tools openssh-server pdftk php5-cli php5-curl postgresql pwgen shtool subversion texinfo tofrodos vice wine xclip xsane xtightvncviewer

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

echo
echo Build FFMPEG from source, as the Mint version is borked
./build_ffmpeg.sh

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

echo
echo Make StumpWM use SBCL, not CLISP
apt-get purge -y clisp
if !(grep -q sbcl /etc/profile)
  then echo export LISP=sbcl >> /etc/profile
fi

echo
echo Installing Spotify
echo deb http://repository.spotify.com stable non-free | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
apt-get update
apt-get install spotify-client -y

echo
echo Downloading and installing Emacs from source
echo
rm -rf /tmp/emacs
mkdir /tmp/emacs
cp $(pwd)/conf/emacs/emacs-24.2.tar.gz /tmp/emacs
pushd /tmp/emacs
tar -zxvf emacs-24.2.tar.gz
cd emacs-24.2
./configure
make
make install
popd
rm -rf /tmp/emacs

echo
echo Downloading and installing RSense
./install_rsense.sh
