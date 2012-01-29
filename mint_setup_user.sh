#!/bin/bash
set -e

echo Linking custom config
if [ ! -f ~/.xinitrc   ]; then ln -s $(pwd)/conf/x/xinitrc ~/.xinitrc           ; fi  
if [ ! -f ~/.emacs     ]; then ln -s $(pwd)/conf/emacs/emacs ~/.emacs           ; fi
if [ ! -d ~/.emacs.d   ]; then ln -s $(pwd)/conf/emacs/emacs.d ~/.emacs.d       ; fi
if [ ! -f ~/.stumpwmrc ]; then ln -s $(pwd)/conf/stumpwm/stumpwmrc ~/.stumpwmrc ; fi  

if grep -q "037b7c29-5804-43e2-8054-d1ebfb0f3293" ~/.bashrc ;
then
    echo Bash confugration extras already added to ~/.bashrc.
else
    echo Adding custom Bash setup
    mkdir ~/bin
    echo >> ~/.bashrc
    echo \# Personal Bash configuration extras, added by ubuntu_setup.sh >> ~/.bashrc
    echo \# 037b7c29-5804-43e2-8054-d1ebfb0f3293 >> ~/.bashrc
    echo . $(pwd)/conf/bash/bash_extras.sh >> ~/.bashrc
    echo >> ~/.bashrc
fi

echo Setting up personal binary path
if [ ! -d ~/bin ]; then mkdir ~/bin ; fi

echo Getting WineTricks for future use
if [ -f ~/bin/winetricks.sh ]; then rm -f ~/bin/winetricks.sh ; fi  
wget http://www.kegel.com/wine/winetricks
mv $(pwd)/winetricks ~/bin/winetricks.sh
chmod a+x ~/bin/winetricks.sh

echo Setting up RVM
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm remove 1.9.2 
rvm install 1.9.2 -C --with-openssl-dir=$HOME/.rvm/usr
rvm 1.9.2
gem install bundler

echo Configuring Gnome to be less intrusive
gconftool-2 -s -t bool /apps/nautilus/preferences/show_desktop false
gconftool-2 -s -t bool /desktop/gnome/background/draw_background false
