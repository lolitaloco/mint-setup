#!/bin/bash
set -e

echo
echo Make StumpWM use SBCL, not CLISP
apt-get purge -y clisp
cp -f $(pwd)/conf/stumpwm/sbcl.sh /etc/profile.d/sbcl.sh

echo
echo Install StumpWM and dependencies
apt-get install -y stumpwm network-manager-gnome trayer cl-swank cl-clx-sbcl xloadimage alsa-utils
cp -f $(pwd)/conf/stumpwm/stumpwm.desktop /usr/share/xsessions/stumpwm.desktop

