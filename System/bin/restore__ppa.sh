#!/bin/bash

#####################################################################
#                                                                   #
# Script: restore__ppa.sh                                           #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################


# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi

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
