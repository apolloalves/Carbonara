#!/bin/bash

#####################################################################
#                                                                   #
# Script: removepack.sh For updates packages of system and          #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

######################################################################
#                                                                    #
# Remove Package and Optimize Performance Script                     #
# This script is designed to update system packages and optimize     #
# system performance. It removes cache and log files, cleans the     #
# system, removes orphaned libraries, clears the rubbish bin, and    #
# removes old snaps. It checks for root privileges before executing. #
# Requires root privileges to run.                                   #
#                                                                    #
#                                                                    #
######################################################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo"
    exit 1
fi
                                                                                                                     
##############################################################################################################################
echo -e "\n\033[01;32mRemoving cache and logs files system...\033[00;37m\n"
##############################################################################################################################
    
sleep 2
sudo rm -rfv /var/lib/apt/lists/lock
sudo rm -rfv /var/lib/dpkg/lock-frontend
sudo rm -rfv /var/lib/apt/lists/* 
sudo rm -rfv /var/lib/dpkg/lock
sudo rm -rfv ~/.cache/thumbnails/*
sudo rm -rfv ~/.cache/thumbnails/normal/*
sudo rm -rf ~/.cache/icon*
sudo rm -rfv /var/cache/apt/archives/lock
sudo rm -rfv ~/.cache/tracker/
sudo rm -Rfv /var/log/*
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m'

#####################################################################################################################
echo -e "\n\033[01;32mCleaning files system...\033[00;37m\n"
#####################################################################################################################

sudo apt autoclean -y
sudo apt -s clean
sudo apt clean -y
sudo apt clean all
sudo apt purge --autoremove
sudo apt autoremove -y 

#####################################################################################################################
echo -e "\n\033[01;32mRemove orphaned libraries...\033[00;37m\n"
#####################################################################################################################

sudo apt remove "$(deborphan)"
sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge
sudo deborphan | xargs sudo apt-get -y remove --purge

sudo dpkg --configure -a
sudo apt --fix-broken install
sleep 1
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
sleep 1

#####################################################################################################################
echo -e "\n\033[01;32mRemoving Rubbish Bin files...\033[00;37m\n"
#####################################################################################################################

sudo rm -rfv .local/share/Trash/*
sudo rm -rfv /home/*/.local/share/Trash/*/**
sudo rm -rfv /root/.local/share/Trash/*/**
sudo rm -rfv ~/.local/share/Trash/*i
sudo rm -rfv  /home/*/.local/share/recently-used.xbel
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

#####################################################################################################################
echo -e "\n\033[01;32mRemoving old snaps of system...\033[00;37m\n"
#####################################################################################################################

sleep 2 
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
echo -e "\n\033[01;05;37mTraces of unused packages have been successfully removed!!\033[00;37m\n"

