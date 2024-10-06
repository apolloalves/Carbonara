#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

#####################################################################
#                                                                   #
# Script: reboot__system.sh                                         #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################
#                                                                   #
# Reboot System Script                                              #
# This script prompts the user if they want to restart the system   #
# and initiates the reboot if the user chooses 'y'. It also handles #
# invalid input and provides appropriate messages. Requires root    #
# privileges to run.                                                #
#                                                                   #
#                                                                   #
#####################################################################

MENU="carbonara.sh"
YES="y"
NO="n"

echo
echo -n 'Do you want to restart the system now? (y/n) ? '
read -r rebootSystem


if [ "$rebootSystem" = "$YES" ]; then
     
      reboot now

fi

if [ "$rebootSystem" = "$NO" ]; then
     echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"    
     sleep 2
     $MENU
    
elif [ "$rebootSystem" != "$YES" ] && [ "$rebootSystem" != "$NO" ]; then
    
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2
    $MENU

fi

