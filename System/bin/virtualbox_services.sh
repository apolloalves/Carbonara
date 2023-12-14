#!/bin/bash
source ~/.bashrc
. ~/.bashrc

#############################################
#                                           #
# Script: virtualbox_services               #
# Author : Apollo Alves                     #
# Date : 09/12/2023                         #
#############################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo"
    exit 1
fi

echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
echo "uploading virtualbox services..."
sleep 2

sudo systemctl start vboxdrv.service
sudo systemctl start vboxballoonctrl-service.service
sudo systemctl start vboxweb-service.service

echo "done"
