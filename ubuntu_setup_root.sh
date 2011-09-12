#!/bin/bash

# Update and upgrade from all repositories
apt-get update -y
apt-get upgrade -y

# Install StumpWM and dependencies
apt-get install -y stumpwm network-manager-gnome trayer cl-swank cl-clx-sbcl xloadimage
cp -f $(pwd)/conf/stumpwm/stumpwm.desktop /usr/share/xsessions/stumpwm.desktop

# Set up and install media players etc.
wget http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list --output-document=/etc/apt/sources.list.d/medibuntu.list
apt-get -q update
apt-get --yes -q --allow-unauthenticated install medibuntu-keyring
apt-get -q update
apt-get -y install w32codecs libdvdcss libdvdread4 ubuntu-restricted-extras vlc totem-plugins-extra mp3info
pushd /usr/share/doc/libdvdread4
./install-css.sh
popd
add-apt-repository ppa:team-xbmc
apt-get update
apt-get -y install xbmc
apt-get update

# Install Google Chrome
echo "deb http://dl.google.com/linux/deb/ stable non-free main #Google" | tee -a /etc/apt/sources.list > /dev/null
apt-get update
apt-get install -y --force-yes google-chrome-stable

# Install Skype
echo "deb http://download.skype.com/linux/repos/debian/ stable non-free #Skype" | tee -a /etc/apt/sources.list > /dev/null
apt-get update
apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
apt-get install -y --force-yes skype

# Install miscellaneous stuff
apt-get -y install flashplugin-nonfree emacs k3b gnucash ccrypt guake openjdk-6-jre openjdk-6-jdk eclipse autoconf libusb-dev xclip samba cups-pdf pdftk thunderbird gqview gimp gnome-rdp xtightvncviewer smbfs lyx latex2html lynx pwgen dosbox tofrodos gettext net-tools clojure lighttpd audacity lame php5-cli php5-curl gparted vice dia frotz inform wine curl xsane libxine1-ffmpeg build-essential git-core subversion shtool

# Install Ruby
apt-get -y install ruby ruby-dev libopenssl-ruby1.8 irb ri rdoc mysql-server sqlite3 libmysql-ruby libmysqlclient-dev libmysql-ruby libsqlite3-ruby libsqlite3-dev rails mongrel

# Manually install RubyGems instead of (justifiably) retarded Debian verison
apt-get purge -y rubgems1.8
cp $(pwd)/conf/rubygems/rubygems-1.3.7.tgz /tmp
pushd /tmp
tar -zxvf rubygems-1.3.7.tgz
pushd rubygems-1.3.7
ruby ./setup.rb
ln /usr/bin/gem1.8 /usr/bin/gem
popd
rm -rf rubygems-1.3.7 rubygems-1.3.7.tgz 
popd

# Install RoR, RoR3, Jekyll
gem install rails hobo rake uuid mysql ruby-debug jekyll --verbose 

# Install Mono stuff
apt-get -y install monodevelop monodevelop-nunit monodevelop-boo monodevelop-versioncontrol monodevelop-debugger-mdb monodevelop-java monodevelop-debugger-gdb monodevelop-vala monodevelop-python monodevelop-moonlight monodevelop-database monodoc-http monodoc-ipod-manual monodoc-njb-manual monodoc-nunit-manual monodoc-mysql-manual monodoc-taglib-manual libmono-cil-dev mono-apache-server2 mono-fastcgi-server2 mono-runtime-dbg 

# Install LISP stuff
apt-get -y install guile-1.8 sbcl plt-scheme

# Configure VICE
cp -R $(pwd)/conf/vice/* /usr/lib/vice -R

# Purge GNU CLisp and force StumpWM to use SBCL instead
apt-get purge -y clisp
if !(grep -q sbcl /etc/profile)
  then echo export LISP=sbcl >> /etc/profile
fi
