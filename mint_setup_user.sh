#!/bin/bash
set -e

echo Linking custom config
if [ ! -f ~/.xinitrc   ]; then ln -s $(pwd)/conf/x/xinitrc ~/.xinitrc           ; fi
if [ ! -f ~/.stumpwmrc ]; then ln -s $(pwd)/conf/stumpwm/stumpwmrc ~/.stumpwmrc ; fi

if grep -q "037b7c29-5804-43e2-8054-d1ebfb0f3293" ~/.bashrc ;
then
    echo Bash confugration extras already added to ~/.bashrc.
else
    echo Adding custom Bash setup
    if [ ! -d ~/bin ]; then mkdir ~/bin ; fi
    echo >> ~/.bashrc
    echo \# Personal Bash configuration extras, added by ubuntu_setup.sh >> ~/.bashrc
    echo \# 037b7c29-5804-43e2-8054-d1ebfb0f3293 >> ~/.bashrc
    echo . $(pwd)/conf/bash/bash_extras.sh >> ~/.bashrc
    echo >> ~/.bashrc
fi

echo Setting up personal binary path
if [ ! -d ~/bin ];             then mkdir ~/bin                                                         ; fi
if [ ! -f ~/bin/gsa ];         then ln -s $(pwd)/conf/bin/gsa ~/bin/gsa                                 ; fi
if [ ! -f ~/bin/lock_dvd ];    then ln -s $(pwd)/conf/bin/lock_dvd ~/bin/lock_dvd                       ; fi
if [ ! -f ~/bin/unlock_dvd ];  then ln -s $(pwd)/conf/bin/unlock_dvd ~/bin/unlock_dvd                   ; fi
if [ ! -f ~/bin/markdownify ]; then ln -s $(pwd)/conf/markdownify/markdownify_cli.php ~/bin/markdownify ; fi

echo Getting WineTricks for future use
if [ -f ~/bin/winetricks.sh ]; then rm -f ~/bin/winetricks.sh ; fi
wget http://www.kegel.com/wine/winetricks
mv $(pwd)/winetricks ~/bin/winetricks.sh
chmod a+x ~/bin/winetricks.sh

echo Setting up RVM
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm remove 1.9.3
rvm install 1.9.3 -C --with-openssl-dir=$HOME/.rvm/usr
rvm --default use 1.9.3
gem install bundler

echo Configuring Gnome to be less intrusive
gconftool-2 -s -t bool /apps/nautilus/preferences/show_desktop false
gconftool-2 -s -t bool /desktop/gnome/background/draw_background false

echo Installing QuickLisp
curl -O http://beta.quicklisp.org/quicklisp.lisp
if [ ! -d ~/quicklisp ]; then sbcl --load quicklisp.lisp --eval "(progn (quicklisp-quickstart:install)(quit))" ; fi

echo Configuring RSense
ruby /opt/rsense-0.3/etc/config.rb > ~/.rsense
