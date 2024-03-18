#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: remove__system.sh                                         #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################
#                                                                   #
# Remove Traces Script                                              #
# This script is designed to clean system packages. It prompts the  #
# user if they want to proceed with the cleaning process. It checks #
# for root privileges, executes the 'remove__traces.sh' script to   #
# perform the actual cleaning, and provides appropriate messages.   #
# Requires root privileges to run.                                  #
#                                                                   #
#####################################################################

MENU='/bin/ShellCare-22.0.1.sh'
REMOVETRACES='/bin/remove__traces.sh'

YES="y"
NO="n"

    echo
    echo -n 'Do you want to clean system packages (y/n) ? '
    read -r removetraces

if [ "$removetraces" = "$YES" ]; then 
        
    $REMOVETRACES
    read -rsn1 -p "Press any key to continue..."
    $MENU
fi
if [ "$removetraces" = "$NO" ]; then 

    echo "skipped!"
    $MENU

    elif [ "$removetraces" != "$YES" ] && [ "$removetraces" != "$NO" ]; then

    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2

    $MENU

fi