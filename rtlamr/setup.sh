#!/bin/sh
# set up rtlamr from source on a raspberry pi
# tested with an rpi3b on raspbian buster

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

# install build deps
sudo apt -y install golang

# build and install
go get github.com/bemasher/rtlamr

# link to path
ln -s ~/go/bin/rtlamr ~/bin/rtlamr
