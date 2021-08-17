#!/bin/sh
# set up wsjt-x on a raspberry pi
# tested with an rpi3b on raspbian buster

#PACKAGE="wsjtx_2.4.0_arm64.deb"
PACKAGE="wsjtx_2.4.0_armhf.deb"

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

wget https://www.physics.princeton.edu/pulsar/k1jt/$PACKAGE

sudo apt install libgfortran5 libqt5widgets5 libqt5network5 \
     libqt5printsupport5 libqt5multimedia5-plugins libqt5serialport5 \
     libqt5sql5-sqlite libfftw3-single3 libgomp1 libboost-all-dev \
     libusb-1.0-0

sudo dpkg -i $PACKAGE

cp WSJT-X.ini ~/.config/
