#!/bin/bash
################################################################################
#                                                                              #
# Script: release__upgrade.sh - Enter a line after each command                #           
#                                                                              #
# Author: Apollo Alves                                                         #
# Date: 14/12/2023                                                             #
#                                                                              #
# description: This script checks if there is any version of Ubuntu available  #
################################################################################
# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi


do-release-upgrade