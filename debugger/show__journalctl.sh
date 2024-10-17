#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: show__journalctl.sh                                       #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

##################################################################################################################
#                                                                                                                #
# Description:                                                                                                   #
# This script provides options to view and monitor system logs using journalctl. It includes commands to view    #
# failed boot messages, all system logs (including error messages during initialization), check service status,  #
# and monitor syslog. The menu-driven interface simplifies the process of accessing and analyzing system logs.   #
#                                                                                                                #
##################################################################################################################

clear
MENU='/bin/carbonara.sh'
JORNALMENU='show__journalctl.sh'
LINE_SCRIPT='line_script.sh'

# Capture Ctrl+C and return to the menu
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n\n\033[01;31mCtrl+C detected! Returning to the main menu...\033[0m"
    sleep 2
    clear
    $JORNALMENU
}

echo -e "\033[1;97;100m        Carbonara          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        DEBUUGER        \033[0m"
echo
# $LINE_SCRIPT
echo -e "\033[01;97m Input an option from the menu: \033[0m"
$LINE_SCRIPT
echo

echo -e "\033[01;32m[\033[01;37m 1\033[01;32m ]\033[00;37m - View only failed boot messages\033m"
echo -e "\033[01;32m[\033[01;37m 2\033[01;32m ]\033[00;37m - View all system logs, including error messages initialization\033m"
echo -e "\033[01;32m[\033[01;37m 3\033[01;32m ]\033[00;37m - Check service status and identify faults\033m"
echo -e "\033[01;32m[\033[01;37m 4\033[01;32m ]\033[00;37m - Syslog Monitor\033m"
echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m - Exit\033m"
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
            journalctl -b -p err
            clear
            $JORNALMENU
            ;;
        2)
            journalctl -xe
            clear
            $JORNALMENU
            ;;
        3)
            journalctl
            clear
            $JORNALMENU
            ;;

      4)
	   echo -e "\n\033[01;05;32mMapping system activities...\033[00;37m\n"
	    echo -e "\033[1;97mPress Ctrl+C at any time to exit and return to the menu\033[0m"
	    sleep 2

	    # Captura Ctrl+C durante o monitoramento com journalctl -f
	    trap ctrl_c INT

	    # Função para lidar com Ctrl+C
	    ctrl_c() {
		echo -e "\n\033[01;31mCtrl+C detected! Returning to the menu...\033[0m"
		sleep 2
		clear
		$JORNALMENU
	    }

	    # Inicia o monitoramento com journalctl -f
	    journalctl -f

	    # Após o monitoramento, desativar o trap
	    trap - INT

	    clear
	    $JORNALMENU
	    ;;


        *)
            echo -e "\nInvalid input! Please enter the number contained in the menu!.\n"
            ;;
        esac
        read -rsn1 -p "Press any key to continue..."
        clear
        $JORNALMENU
    fi
else
    $MENU
fi
