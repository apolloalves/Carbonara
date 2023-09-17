#!/bin/bash

#####################################################################
#                                                                   #
# Script: show__journalctl.sh                                       #
# Author: Apollo Alves                                              #
# Date: 19/07/2023                                                  #
#                                                                   #
#####################################################################

    sudo journalctl
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m\n"
    echo -e "exiting.."
    sleep 2 
    exit


#!/bin/bash
source ~/.bashrc
. ~/.bashrc
clear
#####################################################################
#                                                                   #
# Script: show__journalctl.sh                                       #
# Author: Apollo Alves                                              #
# Date: 19/07/2023                                                  #
#                                                                   #
#####################################################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    exit 1
fi

######################################################################################################################################################################################
MENU='shellCare-22.0.1.sh'
JORNALMENU='show__journalctl.sh'
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

echo -e "\033[01;32m[\033[01;37m 1\033[01;32m ]\033[00;37m - View only failed boot messages\033m"
echo -e "\033[01;32m[\033[01;37m 2\033[01;32m ]\033[00;37m - View all system logs, including error messages initialization\033m"
echo -e "\033[01;32m[\033[01;37m 3\033[01;32m ]\033[00;37m - Check service status and identify faults\033m"
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m - Exit\033m"

######################################################################################################################################################################################

echo
$LINE
read -p "Input option : " option_choice
$LINE

valid_option=true

if [ "$option_choice" != "e" ]; then

    if [ "$valid_option" = true ]; then
        # echo -e "\033[05;31mThe option: $option_choice will be executed:\033[00;37m\n"

        case "$option_choice" in
        1)
            journalctl -b -p err
            $JORNALMENU
            ;;
        2)
            journalctl -xe
            $JORNALMENU
            ;;
        3)
            # systemctl --failed
            journalctl
            $JORNALMENU
        ;;

        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac
        read -rsn1 -p "Press any key to continue..."
        $JORNALMENU
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