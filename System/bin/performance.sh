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
SWAPPINESS=$(cat /proc/sys/vm/swappiness)
LINE='/bin/line.sh'

    #####################################################################################################################
    echo -e "\n\033[01;32mRemoving cache and logs files system...\033[00;37m\n"
    #####################################################################################################################
    sleep 2

    sudo rm -rfv /var/lib/apt/lists/lock
    sudo rm -rfv /var/lib/dpkg/lock-frontend
    sudo rm /var/lib/apt/lists/* -vf
    sudo rm -rfv /var/lib/dpkg/lock
    sudo rm -rfv ~/.cache/thumbnails/*
    sudo rm -rfv ~/.cache/thumbnails/normal/*
    sudo rm -rf ~/.cache/icon*
    sudo rm -rfv /var/cache/apt/archives/lock
    sudo rm -rfv ~/.cache/tracker/
    sudo rm -Rfv /var/log/*
    sudo apt --purge autoremove -y
    sudo apt autoclean -y
    sudo apt -s clean
    sudo apt clean -y
    sudo apt clean all
    sudo /bin/remove__oldsnaps.sh
    sudo apt remove $(deborphan)
    $LINE
    sleep 1
    #####################################################################################################################
    echo -e "\n\033[01;32mRemoving Rubbish Bin files...\033[00;37m\n"
    #####################################################################################################################
    sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
    sudo rm -rfv .local/share/Trash/*
    sudo rm -rfv /home/*/.local/share/Trash/*/**
    sudo rm -rfv /root/.local/share/Trash/*/**
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    sleep 1
    echo -e "\n\033[01;32mCleaning drop_caches...\033[00;37m\n"
	
    sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    #####################################################################################################################
    echo -e "\033[01;32mOptiminzing performance system...\033[00;37m\n"
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    $LINE
    #####################################################################################################################
    # CLEAN SWAP
    echo -e "\n\033[01;32mCleaning Swap...\033[00;37m\n"
    echo -e "wait...\n"
    sleep 1 
    free -h
    echo
    sudo swapoff -a -v
    echo -e "\n\033[01;37m[\033[00;32m swap data was clean\033[01;37m ]\033m\n"
    $LINE
    sleep 1 
    echo -e "\n\033[01;32mActivating swap...\033[00;37m\n"
    sleep 1
    echo
    sudo swapon -a -v
    $LINE
    sudo sysctl -w vm.swappiness=10
    echo 
    free -h
    echo 
    echo -e "swappiness set :" $SWAPPINESS
    echo -e "\n\033[01;37m[\033[00;32m swap is active now!\033[01;37m ]\033m\n"
    sleep 1 
    echo -e "\n\033mall done!\033m\n"
    
    
