#!/bin/bash

#####################################################################
#                                                                   #
# Script: apititude__manager.sh                                     #
# Author: Apollo Alves                                              #
# Date: 15/14/2023                                                  #
#                                                                   #
#####################################################################

###################################################################################################################
#                                                                                                                 #
# Description:                                                                                                    #
# This script installs and opens the aptitude package manager. It checks if the user has root privileges and then #
# installs aptitude. After installation, it opens aptitude for package management.                                #
#                                                                                                                 #
##################################################################################################################

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

echo -e "\n\033[01;37m\033[01mremoving previous versions broot...\033[00;37m\033[00m\n"

sudo rm -rfv /usr/local/bin/broot/conf-new-style.hjson
sudo rm -rfv /usr/local/bin/broot/system.conf
sudo rm -rfv /usr/local/bin/broot

source ~/.bashrc

echo -e "\n\033[01;32minstalling broot...\033[00;37m\n"

curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
sleep 5
sudo mv -v broot /usr/local/bin
sudo chmod +x /usr/local/bin/broot
echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
