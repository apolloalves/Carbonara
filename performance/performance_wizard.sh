#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: performance_wizard.sh                                     #
# Author: Apollo Alves                                              #
# Date: 17/12/2024                                                  #
#                                                                   #
#####################################################################



clear
MENU='/bin/carbonara.sh'
PERFORMANCE='performance_wizard.sh'



echo
######################################################################################################################################################################################
LINE_SCRIPT='line_script.sh'
echo -e "\033[1;97;100m        Carbonara          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        PERFORMANCE WIZARD        \033[0m"
######################################################################################################################################################################################
echo
# $LINE_SCRIPT
echo -e "\033[01;97m Input an option from the menu: \033[0m"
$LINE_SCRIPT
echo
######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - View Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Cleanup Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Optimize Performance of System\033m"
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m  - Exit\033m"

######################################################################################################################################################################################

echo
$LINE_SCRIPT
formatted_prompt=$(printf "\e[1;97mInput option :\e[0m ")
read -p "$formatted_prompt" option_choice

$LINE_SCRIPT

valid_option=true

if [ "$option_choice" != "e" ] && [ "$option_choice" != "E" ]; then

    if [ "$valid_option" = true ]; then
        echo -e "\033[05;31mThe option: $option_choice will be executed:\033[00;37m\n"

        case "$option_choice" in

        1)
           swapState.sh
	   ;;
        2)
           cleanup__swap.sh
           ;;
        3)
           optimize__performance.sh
           ;;

        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac
        read -rsn1 -p "Press any key to continue..."
	$PERFORMANCE
    fi
else

$MENU
fi
