#!/bin/bash

#####################################################################
#                                                                   #
# Script: removepack.sh For updates packages of system and   #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 02/07/2023                                                  #
#                                                                   #
#####################################################################

MENU='shellCare-22.0.1.sh'
REMOVEPACK='remove.sh'

YES="y"
NO="n"

    echo -n 'Do you want to clean system packages (y/n)? '
    read -r removepack

if [ "$removepack" = "$YES" ]; then 
        
    $REMOVEPACK
    
fi
if [ "$removepack" = "$no" ]; then 
        
    $MENU

    elif [ "$removepack" != "$YES" ] && [ "$removepack" != "$NO" ]; then

    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2

    $MENU

fi