#!/bin/sh
# set up pcf8523 chip as rtc
# tested with an rpi3b on raspbian buster

if [ $(id -u) -ne 0 ]; then
    echo "Please run this via sudo"
    exit 1
fi

# enable i2c
raspi-config

i2cdetect -y 1  # should see 68 or UU depending on driver status

grep rtc /boot/config.txt || echo 'dtoverlay=i2c-rtc,pcf8523' | sudo tee -a /boot/config.txt

apt update
apt remove -y fake-hwclock
update-rc.d -f fake-hwclock remove
systemctl disable fake-hwclock

patch /lib/udev/hwclock-set < hwclock-set.patch

echo 'reboot is required'
