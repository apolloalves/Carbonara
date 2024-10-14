#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
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
sleep 2
clear

######################################################################################################################################################################################
MENU='/bin/carbonara.sh'
EGGSCREATE='/bin/eggs__create.sh'
EGGSCHECK='/bin/eggs__check.sh'
EGGSBROOT='/bin/showbroot__eggs.sh'
EGGSINSTALL='/bin/eggs__install.sh'
MANAGER='/bin/filesManager.sh'
EGGSMENU='/bin/eggs__wizard.sh'

######################################################################################################################################################################################
LINE_SCRIPT='line_script.sh'
echo -e "\033[1;97;100m               carbonara            \033[0m\033[1;30;107m        Apollo Alves        \033[1;97;100m        Penguin's Eggs Wizard       \033[0m"
######################################################################################################################################################################################
echo
# $LINE_SCRIPT
echo -e "\033[01;97m Input an option from the menu: \033[0m"
$LINE_SCRIPT
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
$LINE_SCRIPT
formatted_prompt=$(printf "\e[1;97mInput option :\e[0m ")
read -p "$formatted_prompt" option_choice

$LINE_SCRIPT

valid_option=true

if [ "$option_choice" != "e" ] && [ "$option_choice" != "E" ]; then


    if [ "$valid_option" = true ]; then

        case "$option_choice" in

        1)
            $EGGSCREATE
            ;;
        2)

            $EGGSCHECK
            ;;
        3)
            sudo mount /dev/sdd3 /mnt/MDSATA/ >/dev/null 2>&1
            $EGGSBROOT
            ;;
        4)
            $MANAGER >/dev/null 2>&1
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
    echo -e '\nBye!'
    sleep 1 
    $MENU
fi
