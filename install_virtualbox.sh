#!/bin/bash

set -e

echo
echo Installing VirtualBox
echo

apt-get install -y linux-headers-generic virtualbox virtualbox-dkms virtualbox-qt
