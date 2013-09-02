#!/bin/bash

set -e

pushd ~
rm -rf ~/.rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

if grep -q "5ecd9684-b577-437a-afc8-ecfa85c85ad3" ~/.bash_profile;
then
    echo rbenv already initialized in ~/.bash_profile
else
    echo \# rbenv, added by install_rbenv.sh >> ~/.bash_profile
    echo \# 5ecd9684-b577-437a-afc8-ecfa85c85ad3 >> ~/.bash_profile
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    echo >> ~/.bash_profile
fi

# initialize rbenv so we can use it without restarting the shell
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo Installing Ruby 1.9.3 with rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 1.9.3-p327
rbenv global 1.9.3-p327
gem install bundler
rbenv rehash

popd

