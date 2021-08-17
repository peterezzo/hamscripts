#!/bin/sh
# set up flrig from source on a raspberry pi
# tested with an rpi3b on raspbian buster

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

# set up app dir
mkdir ~/.flrig
cp flrig.prefs Xiegu-G90.prefs ~/.flrig

# install build deps
apt build-dep flrig
apt install libxft-dev libudev-dev

# build and install
git clone https://git.code.sf.net/p/fldigi/flrig fldigi-flrig
cd fldigi-flrig
autoreconf -i && ./configure --enable-optimizations=rpi3 && make && sudo make install

# make it show up in the berry menu
mkdir ~/.local/share/pixmaps
cp data/flrig.desktop ~/.local/share/applications/
cp data/flrig.xpm ~/.local/share/pixmaps/
