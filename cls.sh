#!/bin/bash
sudo rm -rfv  /home/apollo__nicolly/.local/share/recently-used.xbel
sudo umount -l -f /dev/sdc8 /mnt/ATK__HAIRY/ 
sudo trash-empty --all -f
nautilus --quit

echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"



