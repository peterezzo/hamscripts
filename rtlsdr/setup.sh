#!/bin/sh
# set up rtl-sdr v3 from source on a raspberry pi
# tested with an rpi3b on raspbian buster
# special thanks to https://ranous.wordpress.com/rtl-sdr4linux/

if [ $(id -u) -eq 0 ]; then
    echo "Please run this as an unprivileged user" 
    exit 1
fi

# blacklist module
sudo cp blacklist-rtl.conf /etc/modprobe.d

# install build deps
sudo apt install libusb-1.0-0-dev

# fedora things
# sudo dnf install libusb-devel
# echo '/usr/local/lib64' | sudo tee /etc/ld.so.conf.d/rtlsdr.conf

# build and install
git clone https://git.osmocom.org/rtl-sdr
mkdir rtl-sdr/build
cd rtl-sdr/build
cmake ../ -DINSTALL_UDEV_RULES=ON && make && sudo make install && sudo ldconfig
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && sudo udevadm trigger

# wrap up
echo "Run rtl_test -s 2400000 to verify operation"
