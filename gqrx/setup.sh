#!/bin/sh
# set up gqrx on a raspberry pi
# tested with an rpi3b on raspbian buster

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

sudo apt -y install gqrx-sdr gnuradio
