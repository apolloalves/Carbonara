#!/bin/bash
#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #-
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

#########################################################################################################################
# This is a bash script that performs performance optimizations on the system. I'll explain what each part does:        #
#                                                                                                                       #
# The script starts with a performance optimization message.                                                            #
#                                                                                                                       #
# Next, commands are executed to clear the system cache using the drop_caches kernel parameter. These commands are run  #
# with superuser (sudo) privileges. The drop_caches parameter allows releasing the disk cache memory (pagecache), the   #
# inodes and dentries cache memory and the object slabs cache memory.                                                   #
#                                                                                                                       #
# After clearing the cache, a message is displayed indicating that the operation completed successfully.                #
#                                                                                                                       #
# The next section of the script runs the prelink command for optimizing shared libraries. prelink is a tool            #
# that pre-allocates memory addresses for shared libraries, speeding up program load times. The prelink -amR            #
# and /etc/cron.daily/prelink commands are run with superuser privileges to perform the optimization.                   #
#                                                                                                                       #
# Then, the script cleans up the RAM using the drop_caches parameter again.                                             #
#                                                                                                                       #
# Finally, a message is displayed indicating that the RAM cleaning was successfully completed.                          #
#                                                                                                                       #
# Note: The script uses commands with superuser (sudo) privileges, so you need to run it with proper permissions. Also, #
# it is important to be careful when running scripts that make changes to the system, as they can affect the normal     #
# functioning of the operating system.                                                                                  #
#                                                                                                                       #
#                                                                                                                       #
#########################################################################################################################

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi

SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE='/bin/line.sh'

    #####################################################################################################################
    echo -e "\n\033[01;32mRemoving drop_caches files system...\033[00;37m\n"
    #####################################################################################################################
    
    sleep 2
  
    sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
    sudo prelink -amvR
    sudo /etc/cron.daily/prelink
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    #####################################################################################################################
    # CLEAN SWAP
    cleanup__swap.sh
    echo -e "\n\033mall done!\033m\n"
    
    
