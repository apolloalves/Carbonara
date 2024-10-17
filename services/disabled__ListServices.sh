#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: disabled__ListServices.sh                                 #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################
# This script, when executed with root privileges, generates a list   #
# of disabled services on the system and saves it to a log file.      #
# The log file is located at $HOME/plot/Disable-ServicesList.log.     #
# It uses systemctl to list unit files of type service, filters the   #
# ones marked as 'disable', and outputs the list with LINE_SCRIPT     #
# numbers.                                                            #
# A separator LINE_SCRIPT is displayed before and after the list.     #
#                                                                     #
# Usage:                                                              #
#   - Execute the script with root privileges.                        #
#                                                                     #
# Example:                                                            #
#    ./disabled__ListServices.sh                                      #
#                                                                     #
######################################################################

clear
LINE_SCRIPT='line_script.sh'
MENU='/bin/carbonara.sh'
PLOT="/home/apollo/plot/Disable-ServicesList.log"

echo -e "\nGenerating list..\n"

echo "File Path: " $PLOT
$LINE_SCRIPT
echo

sudo systemctl list-unit-files --type=service | grep disabled > $PLOT
cat $PLOT
echo
$LINE_SCRIPT
read -rsn1 -p "Press any key to continue..."
clear
$MENU
echo
