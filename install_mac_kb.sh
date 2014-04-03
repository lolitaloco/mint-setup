#!/bin/bash
set -e

echo
echo Installing config for mac keyboard

cp conf/modprobe/hid_apple.conf /etc/modprobe.d
update-initramfs -u
