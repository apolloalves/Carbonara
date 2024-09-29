#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

#####################################################################
#                                                                   #
# Script: broot_install.sh                                          #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

###################################################################################################################
#                                                                                                                 #
# Description:                                                                                                    #
# This script installs and opens the aptitude package manager. It checks if the user has root privileges and then #
# installs aptitude. After installation, it opens aptitude for package management.                                #
#                                                                                                                 #
##################################################################################################################

echo -e "\n\033[01;37m\033[01mremoving previous versions broot...\033[00;37m\033[00m\n"

rm -rfv /usr/local/bin/broot/conf-new-style.hjson
rm -rfv /usr/local/bin/broot/system.conf
rm -rfv /usr/local/bin/broot

source ~/.bashrc

echo -e "\n\033[01;32minstalling broot...\033[00;37m\n"

curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
sleep 5
mv -v broot /usr/local/bin
chmod +x /usr/local/bin/broot
sudo su broot
echo 
print_status

