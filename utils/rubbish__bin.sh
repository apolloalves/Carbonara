#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: rubbish__bin.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################
#                                                                     #
# Rubbish Bin Script                                                  #
# This script is designed to be run with root privileges and removes  #
# rubbish bin files and clears recently-used.xbel in the home         #
# directory. It utilizes commands to remove specific files related to #
# the rubbish bin and close any active Nautilus instances.            #
#                                                                     #
#######################################################################

MENU='/bin/carbonara.sh'

pkill nautilus
echo "nautilus is closed!"
trash-empty --all -f
echo "The trash was cleanup!"

rm -rf  /home/*/.local/share/recently-used.xbel
rm -rf ~/.local/share/Trash/*i >/dev/null

echo "Rubish bin is clean!"
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
sleep 2
read -rsn1 -p "Press any key to continue..."
clear
$MENU
