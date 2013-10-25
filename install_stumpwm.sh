#!/bin/bash
set -e

echo
echo Make StumpWM use SBCL, not CLISP
apt-get purge -y clisp
if !(grep -q sbcl /etc/profile)
  then echo export LISP=sbcl >> /etc/profile
fi

echo
echo Install StumpWM and dependencies
apt-get purge -y pulseaudio
apt-get install -y stumpwm network-manager-gnome trayer cl-swank cl-clx-sbcl xloadimage alsa-utils
cp -f $(pwd)/conf/stumpwm/stumpwm.desktop /usr/share/xsessions/stumpwm.desktop

