#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: restore__ppa.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

####################################################################
#                                                                  #
# Restore PPA Script                                               #
# This script is designed to be run as root and restores the APT   #
# configuration files to their original state using previously     #
# created backups. It checks for root privileges and the existence #
# of backup files before performing the restoration.               #
#                                                                  #
####################################################################

# Check if the backup files exist
if [[ ! -f /etc/apt/sources.list.bak || ! -d /etc/apt/sources.list.d.bak ]]; then
    echo "Backup files not found. Please make sure you have previously created the backups."
    exit 1
fi

# Restore the original sources.list file
cp /etc/apt/sources.list.bak /etc/apt/sources.list

# Restore the original sources.list.d directory
rm -rf /etc/apt/sources.list.d
cp -R /etc/apt/sources.list.d.bak /etc/apt/sources.list.d

echo "APT configuration files have been successfully restored to their original state."
