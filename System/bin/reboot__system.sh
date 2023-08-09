#!/bin/bash

#####################################################################
#                                                                   #
# Script: reboot__system.sh                                         #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 26/07/2023                                                  #
#                                                                   #
#####################################################################

MENU="shellCare-22.0.1.sh"
YES="y"
NO="n"

echo
echo -n 'Do you want to restart the system now? (y/n) ? '
read -r rebootSystem


if [ "$rebootSystem" = "$YES" ]; then
     
     sudo init 6

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

