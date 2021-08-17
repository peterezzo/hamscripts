#!/bin/sh
# set up raspberry pi
# tested with an rpi3b on raspbian buster

if [ $(id -u) -ne 0 ]; then
    echo "Please run this via sudo"
    exit 1
fi

raspi-config

sed -i 's/#deb-src/deb-src/' /etc/apt/sources.list
sed -i 's/CONF_SWAPSIZE=.*/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile

apt update
apt -y install xrdp 
apt -y install raspberrypi-ui-mods lxterminal
apt -y install build-essential git cmake

echo 'reboot is recommended'
