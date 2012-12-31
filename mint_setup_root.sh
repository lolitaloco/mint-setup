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

echo
echo Install miscellaneous stuff
apt-get -y install emacs k3b ccrypt eclipse autoconf libusb-dev xclip pdftk gqview gimp gnome-rdp xtightvncviewer lyx latex2html lynx pwgen dosbox tofrodos gettext net-tools audacity lame php5-cli php5-curl gparted vice dia frotz inform wine curl xsane libxine1-ffmpeg git-core subversion shtool libxslt-dev libssl-dev libpq-dev inotify-tools libnotify-bin acidrip libsqlite3-dev libreadline-gplv2-dev openssh-server gitg nautilus chromium-browser libtool automake libav-tools postgresql

echo
echo Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

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

