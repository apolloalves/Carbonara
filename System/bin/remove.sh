#!/bin/bash

#####################################################################
#                                                                   #
# Script: removepack.sh For updates packages of system and   #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 02/07/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
echo -e "\nRemoving cache and logs files system...\n"
#####################################################################################################################
    
sleep 2
sudo rm -rfv /var/lib/apt/lists/lock
sudo rm -rfv /var/lib/dpkg/lock-frontend
sudo rm /var/lib/apt/lists/* -vf
sudo rm -rfv /var/lib/dpkg/lock
sudo rm -rfv ~/.cache/thumbnails/*
sudo rm -rfv ~/.cache/thumbnails/normal/*
sudo rm -rf ~/.cache/icon*
sudo rm -rfv /var/cache/apt/archives/lock
sudo rm -rfv ~/.cache/tracker/
sudo rm -Rfv /var/log/*

#####################################################################################################################
echo -e "\n\033[01;32mCleaning files system...\033[00;37m\n"
#####################################################################################################################
   
sudo apt autoclean -y
sudo apt -s clean
sudo apt clean -y
sudo apt clean all
sudo apt purge --autoremove
sudo apt remove "$(deborphan)"
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
sudo dpkg --configure -a
sudo apt --fix-broken install
sleep 1
sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
sleep 1

#####################################################################################################################
echo -e "\nRemoving Rubbish Bin files...\n"
#####################################################################################################################

sudo rm -rfv .local/share/Trash/*
sudo rm -rfv /home/*/.local/share/Trash/*/**
sudo rm -rfv /root/.local/share/Trash/*/**
trash-empty -f
echo -e '\n\033[01;37m[\033[00;32m rubbish bin files was clean!\033[01;37m ]\033m\n'

#####################################################################################################################
echo -e "\033[01;32mRemoving old snaps of system...\033[00;37m"
#####################################################################################################################

sleep 2 
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"