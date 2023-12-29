#!/bin/bash

#####################################################################
#                                                                   #
# Script: eggs__wizard.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################
######################################################################################################################
#                                                                                                                    #
# Description:                                                                                                       #
# This script serves as a menu for managing Penguin's Eggs, providing options to create, check, and open files with  #
# broot or Nautilus file managers. It also allows installation of Penguin's Eggs and Calamares.                      #
#                                                                                                                    #
######################################################################################################################

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc
clear

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    exit 1
fi

######################################################################################################################################################################################
MENU='/bin/LinuxBashCare-10.12.23.sh'
EGGSCREATE='/bin/eggs__create.sh'
EGGSCHECK='/bin/eggs__check.sh'
EGGSBROOT='/bin/showbroot__eggs.sh'
MANAGER='/bin/nautilus.sh'
EGGSINSTALL='/bin/eggs__install.sh'
EGGSMENU='/bin/eggs__wizard.sh'

######################################################################################################################################################################################
LINE='line.sh'
echo -e "\033[1;97;100m        LinuxBashCare System          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  23.04.1        \033[0m"
######################################################################################################################################################################################
echo
# $LINE
echo -e "\033[01;97m Input an option from the menu: \033[0m"
$LINE
echo
######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m 1\033[01;32m ]\033[00;37m - Create Penguin's Eggs\033m"
echo -e "\033[01;32m[\033[01;37m 2\033[01;32m ]\033[00;37m - Check Penguin's Eggs .iso\033m"
echo -e "\033[01;32m[\033[01;37m 3\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files - broot file manager\033m"
echo -e "\033[01;32m[\033[01;37m 4\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files - Nautilus file manager\033m"
# echo -e "\033[01;32m[\033[01;37m 5\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files in Google Drive backup folders \033m"
echo -e "\033[01;32m[\033[01;37m 5\033[01;32m ]\033[00;37m - Penguin's Eggs and Calamares Install \033m"
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m - Exit\033m"

######################################################################################################################################################################################

echo
$LINE
read -p "Input option : " option_choice
$LINE

valid_option=true

if [ "$option_choice" != "E" || "$option_choice" != "e" ]; then

    if [ "$valid_option" = true ]; then

        case "$option_choice" in
        1)

            $EGGSCREATE
            ;;
        2)

            $EGGSCHECK
            ;;
        3)
            $EGGSBROOT
            ;;
        4)
            $MANAGER
            ;;
        5)

            $EGGSINSTALL
            ;;
        
        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac

        read -rsn1 -p "Press any key to continue..."

        $EGGSMENU

    fi
else
    $MENU
fi
