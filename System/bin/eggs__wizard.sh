#!/bin/bash
source ~/.bashrc
. ~/.bashrc
clear
#####################################################################
#                                                                   #
# Script: eggs__wizard.sh                                           #
# Author: Apollo Alves                                              #
# Date: 14/10/2023                                                  #
#                                                                   #
#####################################################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    exit 1
fi

######################################################################################################################################################################################
MENU='shellCare-23.0.4.sh'
EGGSMENU='eggs__wizard.sh'
EGGSCREATE='eggs__create.sh'
EGGSCHECK='eggs__check.sh'
EGGSBROOT='showbroot__eggs.sh'
######################################################################################################################################################################################
LINE='line.sh'
echo -e "\033[1;97;100m        ShellCare System          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  23.04.1        \033[0m"
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
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m - Exit\033m"

######################################################################################################################################################################################

echo
$LINE
read -p "Input option : " option_choice
$LINE

valid_option=true

if [ "$option_choice" != "e" ]; then

    if [ "$valid_option" = true ]; then
       

        case "$option_choice" in
        1)
           
            $EGGSCREATE
            ;;
        2)
            
            $EGGSCHECK
            ;;
        3)
            # systemctl --failed
            $EGGSBROOT
        ;;

        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac
        read -rsn1 -p "Press any key to continue..."
        $EGGSMENU
        # $MENU
    # else
    #     echo -e "\nops!\n"
    #     echo -e "\033[01;05;37m'$option_choice' command not found!\033[00m\n"
    #     echo -e "Invalid input! Please enter the number contained in the menu!.\n"
    #     $JORNALMENU

    fi
else
    $MENU
fi
