#!/bin/bash

#####################################################################
#                                                                   #
# Script: reinstall__gnome-gdm3.sh                                  #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#############################################################################
#                                                                           #
# Reinstall GDM3 Script                                                     #
# This script reinstalls the GNOME Display Manager (GDM3) on a Debian-based #
# system. It checks if the user has root privileges and then proceeds to    #
# reinstall GDM3 using the 'apt' package manager. Requires root privileges  #
# to run.                                                                   #
#                                                                           #
#                                                                           #
#############################################################################

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi

echo -e "\n\033[01;32mReinstalling gdm3...\033[00;37m\n"
sleep 2
 apt install gdm3 -y
echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"