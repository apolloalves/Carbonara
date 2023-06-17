#!/bin/bash

    echo -e "\n Optiminzing performance system...\n"
    sleep 2
    echo -e "\n\033[01;32mCleaning drop_caches...\033[00;37m\n"
	
    sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    #####################################################################################################################
    #PRELINK
    #####################################################################################################################
    echo -e "\n\033[01;32mExecuting prelink...\033[00;37m\n"
    sleep 1
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    
    #####################################################################################################################
    #RAM MEMORY
    #####################################################################################################################
    echo -e "\n\033[01;32mCleaning RAM memory...\033[00;37m\n"
    sleep 1 
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    sleep 1 
    echo -e "\n\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"
    #####################################################################################################################
