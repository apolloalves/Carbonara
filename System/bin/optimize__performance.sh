#!/bin/bash
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

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi


SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE='/bin/line.sh'

    #####################################################################################################################
    echo -e "\n\033[01;32mRemoving drop_caches files system...\033[00;37m\n"
    #####################################################################################################################
    
    sleep 2
  
     sync; echo 1 > /proc/sys/vm/drop_caches
	 sync; echo 2 > /proc/sys/vm/drop_caches
	 sync; echo 3 > /proc/sys/vm/drop_caches
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
     prelink -amvR
     /etc/cron.daily/prelink
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
     sync && echo 3 |  tee /proc/sys/vm/drop_caches
    #####################################################################################################################
    # CLEAN SWAP
    cleanup__swap.sh
    echo -e "\n\033[01;05;37mSystem successfully optimized!!\033[00;37m\n"

    
    
