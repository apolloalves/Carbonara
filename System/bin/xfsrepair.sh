#!/bin/bash

#####################################################################
#                                                                   #
# Script: xfsrepair.sh                                              #
# Repair systemfiles - boot                                         #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 12/10/2023                                                  #
#                                                                   #
#####################################################################
# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi   
#####################################################################################################################
echo -e "\n Repairing...\n"
#####################################################################################################################
     
xfs_repair -L -d -f /dev/md127p1
xfs_repair -L -d -f /dev/md127p2
xfs_repair -L -d -f /dev/md127p3


echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"
echo -e "\n rebooting...\n"
sleep 3
reboot
