#!/bin/bash
set -e

echo
echo Installing Spotify

echo deb http://repository.spotify.com stable non-free | tee -a /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
apt-get update
apt-get install spotify-client -y
