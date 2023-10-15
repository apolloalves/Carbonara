#!/bin/bash
source ~/.bashrc
. ~/.bashrc

#############################################
#                                           #
# Script: apititude__manager.sh             #
# Author : Apollo Alves                     #
# Date : 15/14/2023                         #
#############################################

echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
echo "Checking the existence of aptitude..."
sudo apt install aptitude -y
echo "installation completed!"
echo -e "\nopenning aptitude..."
sleep 2
sudo aptitude
echo "done"
