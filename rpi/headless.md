Steps to configure Raspberry Pi to boot up on your network

1. Burn image to disk
2. Mount/view the fat32 boot partition
3. touch ssh
4. cp wpa_supplicant.conf
5. Unmount/eject

This is performed by special systemd scripts described [here](https://gijs-de-jong.nl/posts/how-raspberry-pi-enbales-ssh-when-boot-ssh-file-is-present/)
