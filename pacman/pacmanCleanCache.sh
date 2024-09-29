#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi


############################################################################
#                                                                          #
# Script: removepack.sh For updates packages of system and                 #
# optimizer performance.                                                   #
#                                                                          #
# Author: Apollo Alves                                                     #
# Date: 16/12/2023                                                         #
#                                                                          #
############################################################################

#############################################################################
#                                                                           #
# Remove Package and Optimize Performance Script                            #
# This script is designed to update system packages and optimize            #
# system performance. It removes cache and log files, cleans the            #
# system, removes orphaned libraries, clears the rubbish bin, and           #
# removes old snaps. It checks for root privileges before executing.        #
# Requires root privileges to run.                                          #
#                                                                           #
#############################################################################

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}


# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemoving cache and logs files system...\033[00;37m\n" #
#############################################################################

sleep 2
rm -rfv /var/lib/apt/lists/lock
rm -rfv /var/lib/dpkg/lock-frontend
rm -rfv /var/lib/apt/lists/*
rm -rfv /var/lib/dpkg/lock
rm -rfv ~/.cache/thumbnails/*
rm -rfv ~/.cache/thumbnails/normal/*
rm -rf ~/.cache/icon*
rm -rfv /var/cache/apt/archives/lock
rm -rfv ~/.cache/tracker/
find /var/log/ ! -name 'syslog' -type f -exec rm -fv {} +
# rm -Rfv /var/log/*

# OK MESSAGE
print_status

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mCleaning files system...\033[00;37m\n" #              #
#############################################################################

pacman -Scc --noconfirm

# OK MESSAGE
print_status

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemoving Rubbish Bin files...\033[00;37m\n"           #
#############################################################################

rm -rfv .local/share/Trash/*
rm -rfv /home/*/.local/share/Trash/*/**
rm -rfv /root/.local/share/Trash/*/**
rm -rfv ~/.local/share/Trash/*i
rm -rfv /home/*/.local/share/recently-used.xbel
sudo journalctl --vacuum-size=50M
# history -c && history -w

# OK MESSAGE
print_status


