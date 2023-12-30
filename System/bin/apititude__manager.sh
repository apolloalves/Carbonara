#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

#####################################################################
#                                                                   #
# Script: apititude__manager.sh                                     #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

########################################################################################
#                                                                                      #
# Description:                                                                         #
#                                                                                      #
# This script installs and opens the aptitude package manager. It checks if the user   #
# has root privileges and then                                                         #
# installs aptitude. After installation, it opens aptitude for package management.     #
#                                                                                      #
########################################################################################

echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
echo "Checking the existence of aptitude..."
apt install aptitude -y
echo "installation completed!"

echo -e "\nopenning aptitude..."
sleep 2
aptitude
echo "done"
