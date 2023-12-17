#! /bin/bash

#####################################################################
#                                                                   #
# Script: showbroot__eggs.sh                                        #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
#                                                                                                                   #
# This script is responsible for opening the backup directory located at: /mnt/VENTOY which contains the list of    #
# Penguin's Eggs Files .isos files using broot as a file manager.                                                   #
#                                                                                                                   #
#####################################################################################################################
# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi


TARGETPATH="/mnt/VENTOY"

echo "Checking device..."
sleep 2
 mount /dev/sdc1 $TARGETPATH
echo -e "\nOpening broot...\n"
 broot -s -p -d --sort-by-date '/mnt/VENTOY/' 
