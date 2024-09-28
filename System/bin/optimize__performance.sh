#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

#####################################################################
#                                                                   #
# Script: optmize__performance.sh                                   #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

############################################################################
#                                                                          #
# Optimize Performance Script                                              #
# This script is designed to optimize the performance of a Linux system.   #
# It includes operations such as clearing page cache, executing prelink    #
# for shared library optimization, cleaning RAM memory, and handling swap. #
# Ensure it is run with root privileges.                                   #
#                                                                          #
#                                                                          #
############################################################################

SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE_SCRIPT='/bin/line_script.sh'

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

# Clear page cache
############################################################################
echo -e "\n\033[01;32mRemoving caches...\033[00;37m\n"   #
############################################################################

sudo pacman -Scc --noconfirm
print_status






#RAM MEMORY
############################################################################
echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"                 #
############################################################################

cleanup__swap.sh

############################################################################
echo -e "\n\033[01;05;37mSystem successfully optimized!!\033[00;37m\n"     #
############################################################################

