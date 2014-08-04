#!/bin/bash
set -e

echo
echo Install Go

MACHINE_TYPE=`uname -m`

if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    curl "https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz" > go1.3.linux-amd64.tar.gz
    rm -rf ~/mint_setup_tmp/go
    mkdir -p ~/mint_setup_tmp/go

    cp go1.3.linux-amd64.tar.gz ~/mint_setup_tmp/go
    pushd ~/mint_setup_tmp/go
    tar -zxvf go1.3.linux-amd64.tar.gz
    mv go /usr/local
    popd

    rm -f go1.3.linux-amd64.tar.gz
    rm -rf ~/mint_setup_tmp/go
else
    echo Cowardly refusing to install automatically on $MACHINE_TYPE architecture ...
fi
