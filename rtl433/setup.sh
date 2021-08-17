#!/bin/sh
# set up rtl_433 from source on a raspberry pi
# tested with an rpi3b on raspbian buster

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

# install build deps
sudo apt -y install libusb-1.0-0-dev

# build and install
git clone https://github.com/merbanan/rtl_433
mkdir rtl_433/build
cd rtl_433/build
cmake ../ && make && sudo make install
