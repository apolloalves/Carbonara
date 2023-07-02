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

SHELLCARE='shellCare-2.0.1.sh'
YES="y"
NO="n"


    echo -n 'Do you want to clean system packages (y/n)? '
    read -r removepack_kernel

    if [ "$removepack_kernel" = "$YES" ]; then 
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
        echo -e "\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
        sudo dpkg --configure -a
        sudo apt --fix-broken install
        sleep 1
        sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
        #####################################################################################################################
        echo -e "\nRemoving Rubbish Bin files...\n"
        #####################################################################################################################
        sudo rm -rfv .local/share/Trash/*
        sudo rm -rfv /home/*/.local/share/Trash/*/**
        sudo rm -rfv /root/.local/share/Trash/*/**
        echo -e '\n\033[01;37m[\033[00;32m rubbish bin files was clean!\033[01;37m ]\033m\n'

        echo -e '\n\033[01;37m[\033[00;32m all clean!\033[01;37m ]\033m\n'

    fi 
if [ "$removepack_kernel" = "$no" ]; then 
     $SHELLCARE


    elif [ "$removepack_kernel" != "$YES" ] && [ "$removepack_kernel" != "$NO" ]; then
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
fi