#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
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
echo -e "\n\033[01;32mRestating gdm3...\033[00;37m\n"
sleep 2
systemctl restart gdm.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"