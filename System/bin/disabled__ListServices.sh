#!/bin/bash

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
# ones marked as 'disable', and outputs the list with line numbers.   #
# A separator line is displayed before and after the list.            #
#                                                                     #
# Usage:                                                              #
#   - Execute the script with root privileges.                        #
#                                                                     #
# Example:                                                            #
#   sudo ./disabled__ListServices.sh                                  #
#                                                                     #
######################################################################

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    exit 1
fi

LINE='line.sh'
PLOT="$HOME/plot/Disable-ServicesList.log"

echo -e "\nGenerating list..\n"

echo "File Path: " $PLOT
$LINE
echo
sleep 1
# systemctl list-unit-files --type=service | grep disable
systemctl list-unit-files --type=service | grep disable >$PLOT && cat -n $PLOT
echo
$LINE
echo
