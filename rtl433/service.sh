#!/bin/sh
# set up rtl443 service
# tested with an rpi3b on raspbian buster

if [ $(id -u) -ne 0 ]; then
    echo "Please run this via sudo"
    exit 1
fi

cp rtl433.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable rtl433
systemctl start rtl433
