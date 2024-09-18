#!/bin/bash

#####################################################################
#                                                                   #
# Script: check__space.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
#                                                                                                                   #
# Description: This shell script called "checkSpace.sh" performs some disk space checks. Here is a summary of what  # 
# it does:                                                                                                          #
# 1. Displays a space check message.                                                                                #
# 2. Wait 1 second.                                                                                                 #
# 3. Run the commands "df -h /", "df -h /home" and "df -h /mnt/MDSATA" to display disk space      #
# information in the root, /home and /mnt/EXT@ directories ST500LM012__CLONRAID, respectively.                      #
# 4. Displays a message indicating that the verification completed successfully.                                    #
#                                                                                                                   #
# Basically, this script prints information about available disk space in the mentioned directories. It can be used #
# to monitor disk space and verify that enough space is available.                                                  #
#                                                                                                                   #
#####################################################################################################################


clear_screen() {

    printf "\033c"
}

clear_screen
# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

LINE_SCRIPT='line_script.sh'
echo -e "\nChecking spaces...\n"                                      
sleep 2
df -h /dev/md127p1 && echo "" && df -h /dev/md127p2 && echo "" && df -h /mnt/MDSATA/ && echo "" && df -h /mnt/VENTOY/
echo ""
$LINE_SCRIPT
sleep  2
echo 
print_status

