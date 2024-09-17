#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: clonraid__Backups                                         #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

####################################################################################################################
#                                                                                                                  #
# Description:                                                                                                     #
# This script opens Nautilus file manager to access a specific directory. It provides feedback indicating whether  #
# the operation was successful.                                                                                    #
#                                                                                                                  #
####################################################################################################################

echo -e "\n Opening Nautilus...\n"

sleep 1
nautilus /mnt/MDSATA/ && >/dev/null
clear
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
echo
