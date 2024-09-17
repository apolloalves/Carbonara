#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
################################################################################
#                                                                              #
# Script: release__upgrade.sh - Enter a LINE_SCRIPT after each command                #           
#                                                                              #
# Author: Apollo Alves                                                         #
# Date: 14/12/2023                                                             #
#                                                                              #
# description: This script checks if there is any version of Ubuntu available  #
################################################################################

echo
sudo pacman -Syu
echo