#!/bin/bash
#######################################################################
#                                                                     #
# Script: stacer__tools.sh                                            #
# Author: Apollo Alves                                                #
# Date: 16/12/2023                                                    #
# Description: This script opens the Software Updates window in tab 4 #
#                                                                     #
#######################################################################
# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi
 software-properties-gtk --open-tab=4