#!/bin/bash

#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 03/06/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################################################################
# The script in question is a Bash script that aims to update operating system packages and optimize performance. It  #
# prompts the user to respond whether they want to update system packages or clean up system packages.                #
#                                                                                                                     #
# If the user chooses to update the packages, the script will perform the following actions:                          #
#                                                                                                                     #
# Will update system packages using sudo apt update --fix-missing command.                                            #
# It will install the base-files, sosreport and ubuntu-server packages.                                               #
# Will fix broken packages using sudo apt --fix-broken install.                                                       #
# Will resolve missing dependencies using sudo apt install -f.                                                        #
# Will upgrade all installed packages using sudo apt upgrade -y.                                                      #
# Perform a full system upgrade using sudo apt full-upgrade -y.                                                       #
# Perform a distribution upgrade using sudo apt dist-upgrade.                                                         #
# Perform a safe upgrade using sudo aptitude safe-upgrade -y.                                                         #
# Will check for Flatpak updates using flatpak update -y.                                                             #
# If the user chooses to clean up system packages, the script will perform the following actions:                     #
#                                                                                                                     #
# It will remove cache and system log files.                                                                          #
# It will run a series of commands to clear cache files and optimize the system.                                      #
# It will clean the system recycle bin.                                                                               #
# In either case, if the user enters invalid input (other than "y" or "n"), the script will display an error message. #
#                                                                                                                     #
# It is important to note that this script contains commands that require superuser (sudo) privileges, so it is       #
# recommended to run it carefully and verify the actions that will be performed before proceeding.                    #
#######################################################################################################################

YES="y"
NO="n"
echo -n 'Do you want to update system packages (y/n)? '
read -r packages_question

if [ "$YES" = "$packages_question" ]; then
    sleep 1
    echo -e "\nUpdating system packages...\n"
    #####################################################################################################################
    echo -e "\nCleaning and updating the system...\n"
    #####################################################################################################################

    sudo apt update --fix-missing
    sudo apt install base-files sosreport ubuntu-server
    sudo apt --fix-broken install
    sudo apt install -f
    sudo apt install aptitude -y
    sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt dist-upgrade
    sudo aptitude safe-upgrade -y

    echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
    flatpak update -y
    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

    echo -n 'Do you want to clean system packages (y/n)? '
    read -r removepack_kernel

    if [ "$YES" = "$removepack_kernel" ]; then
        #####################################################################################################################
        echo -e "\nRemoving cache and log files...\n"
        #####################################################################################################################

        sudo rm -rfv /var/lib/apt/lists/lock
        sudo rm -rfv /var/lib/dpkg/lock-frontend
        sudo rm -rfv /var/lib/apt/lists/* -vf
        sudo rm -rfv /var/lib/dpkg/lock
        sudo rm -rfv ~/.cache/thumbnails/*
        sudo rm -rfv ~/.cache/thumbnails/normal/*
        sudo rm -rfv /var/cache/apt/archives/lock
        sudo rm -rfv ~/.cache/tracker/
        sudo rm -Rfv /var/log/*

        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

        sudo apt autoclean -y
        sudo apt -s clean
        sudo apt clean -y
        sudo apt clean all
        sudo apt purge --autoremove
        sudo apt remove "$(deborphan)"
        sudo /bin/remove__oldsnaps.sh
        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
        sudo dpkg --configure -a
        sudo apt --fix-broken install
        sleep 1
        sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
        echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
        #####################################################################################################################
        echo -e "\nRemoving Rubbish Bin files...\n"
        #####################################################################################################################
        sudo rm -rfv .local/share/Trash/*
        sudo rm -rfv /home/*/.local/share/Trash/*/**
        sudo rm -rfv /root/.local/share/Trash/*/**

        echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    fi
    if [ "$NO" = "$removepack_kernel" ]; then
    sleep 1
    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
    fi
fi

if ! { [ "$packages_question" = "$YES" ] || [ "$packages_question" = "$NO" ]; }; then
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"

elif ! { [ "$removepack_kernel" = "$YES" ] || [ "$removepack_kernel" = "$NO" ]; }; then
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
fi
