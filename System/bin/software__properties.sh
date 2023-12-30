#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#######################################################################
#                                                                     #
# Script: stacer__tools.sh                                            #
# Author: Apollo Alves                                                #
# Date: 16/12/2023                                                    #
# Description: This script opens the Software Updates window in tab 4 #
#                                                                     #
#######################################################################

 software-properties-gtk --open-tab=4