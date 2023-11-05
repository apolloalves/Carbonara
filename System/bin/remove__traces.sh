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

##############################################################################################################################
# Description : This shell script called "removepack.sh" performs a series of actions to update system packages and optimize #
# performance. Here is a summary of what it does:                                                                            #
#                                                                                                                            #
# 1. Remove cache files and system logs.                                                                                     #
# - Removes file locks related to the apt package manager.                                                                   #
# - Removes apt cache files.                                                                                                 #
# - Removes thumbnails from cache.                                                                                           #
# - Removes icon cache files.                                                                                                #
# - Remove cache tracker.                                                                                                    #
# - Removes system logs.                                                                                                     #
#                                                                                                                            #
# 2. Cleans the system.                                                                                                      #
# - Runs "apt autoclean" and "apt clean" commands to clear apt's package cache.                                              #
# - Remove orphaned packages using the "deborphan" command.                                                                  #
# - Configure pending dpkg packages.                                                                                         #
# - Fix broken packages using "apt --fix-broken install".                                                                    #
# - Remove history file from file manager.                                                                                   #
#                                                                                                                            #
# 3. Remove files from recycle bin.                                                                                          #
# - Removes files from the recycle bin in the user's and all users' current directory.                                       #
# - Empty the trash using the "trash-empty" command.                                                                         #
#                                                                                                                            #
# 4. Remove old versions of snaps packages.                                                                                  #
# - Lists all disabled snaps and removes old versions.                                                                       #
#                                                                                                                            #
# In short, the script removes cache files and system logs, cleans up the system by removing unnecessary packages            #
# and files, empties the recycle bin, and removes old versions of snap packages. These actions are performed with            #
# the aim of freeing up disk space, optimizing performance and removing unwanted files from the system.                      #
#                                                                                                                            #
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
echo -e "\n\033[01;37m[\033[00;32m done!\033[01;37m ]\033m\n"
sleep 5