#!/bin/bash

###############################################################################################
#                                                                                             #
# Script Name : shellCare.sh                                                                  #
# Author : Apollo Alves                                                                       #
#                                                                                             #
# Description : Program responsible for updating the system's internal packages, removing and #
# correcting useless packages that are no longer used by apt, performance correction          #
# of the most used apps and swap cleaning.                                                    #
#                                                                                             #
# Create : 21/01/2023                                                                         #
#                                                                                             #
###############################################################################################
MENU='sudo shellCare.sh'
neofetch
echo "###########################################################################################"
echo "Choose an option from the menu"
echo "###########################################################################################"
echo
echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - Update all system packages\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Remove traces of unused packages from the system\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Run both\033m"
echo -e "\033[01;32m[\033[01;37m 04\033[01;32m ]\033[00;37m - Optimize system performance\033m"
echo -e "\033[01;32m[\033[01;37m 05\033[01;32m ]\033[00;37m - Check space disks\033m"
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Create timeshift snapshot\033m"
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Restore timeshift snapshot\033m"
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Open CLONRAID backups\033m"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Start mysql assistent\033m"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Disable mysql"
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Open Broot\033m"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Disable services natives\033m"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - Exit\033m"
echo
echo "###########################################################################################"
read -p "Option: " opcao
echo "###########################################################################################"

#Rotinas de opções

case "$opcao" in

1)
    echo -e "\nUpdating system packages...\n"
    sleep 1

    sudo apt update --fix-missing
    sudo apt install base-files sosreport ubuntu-server
    sudo apt --fix-broken install
    sudo apt install -f
    sudo apt install aptitude -y
    sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt dist-upgrade
    sudo aptitude safe-upgrade -y

    echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
    flatpak update -y
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    $MENU
    ;;
2)
    echo
    echo "Removing junk system files..."
    sleep 2
    #####################################################################################################################
    echo -e "\nRemoving cache and logs files system...\n"
    #####################################################################################################################

    sudo rm -rfv /var/lib/apt/lists/lock
    sudo rm -rfv /var/lib/dpkg/lock-frontend
    sudo rm /var/lib/apt/lists/* -vf
    sudo rm -rfv /var/lib/dpkg/lock
    sudo rm -rfv ~/.cache/thumbnails/*
    sudo rm -rfv ~/.cache/thumbnails/normal/*
    sudo rm -rfv /var/cache/apt/archives/lock
    sudo rm -rfv ~/.cache/tracker/
    sudo rm -Rfv /var/log/*

    sudo apt autoclean -y
    sudo apt -s clean
    sudo apt clean -y
    sudo apt clean all

    sudo /bin/remove__oldsnaps.sh
    sudo apt --purge autoremove -y
    sudo apt remove $(deborphan)

    sleep 1
    sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
    #####################################################################################################################
    echo -e "\nRemoving Rubbish Bin files...\n"
    #####################################################################################################################
    sudo rm -rfv .local/share/Trash/*
    sudo rm -rfv /home/*/.local/share/Trash/*/**
    sudo rm -rfv /root/.local/share/Trash/*/**
    trash-empty -f
    echo -e "\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    
    $MENU
    ;;
3)
    echo
    echo "Cleaning and updating the system..."
    sleep 2
    sudo /bin/fix__packages-6.0.sh
    echo
    $MENU
    ;;
4)
    echo "Option 4 chosen"
    #********************************************************************************************************************
    #PRELINK
    echo -e "\n\033[01;32mOptimizing system performance...\033[00;37m\n"
    #********************************************************************************************************************
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    #*********************************************************************************************************************'
    echo -e "\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
    echo "###########################################################################################"
    sudo swapoff -a && swapon -a && free -h
    echo "###########################################################################################"
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
    $MENU
    ;;
5)
echo -e "\033[01;37mRAID PARTITIONS\033[00;37m"
    echo "###########################################################################################"
    echo
    df -h /dev/md0p* && lsblk | grep md0p3
    echo
    echo "###########################################################################################"
    echo -e "\033[01;37mEXT PARTITIONS\033[00;37m"
    echo "###########################################################################################"
    echo
    df -h /dev/sdc5 /dev/sdc6 /dev/sdc7 && lsblk | grep scd5
    echo
    echo "###########################################################################################"
    echo
    $MENU
    ;;
6)
    echo
    sleep 2
    echo -e "\n\033[01;31mCreating snapshot...\033[00;37m\n"
    sudo timeshift --create --verbose --comments 'shell : [ shellCare ]' --tags D
    echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
    echo
    $MENU
    ;;


7)
    echo
    sleep 2
    echo -e "\n\033[01;31mRestore snapshotlist\033[00;37m\n"
    sudo timeshift --restore 
    echo -e "\n\033[00;37m[\033[01;32m done!\033[00;37m ]\033m\n"
    echo
    ;;
    


8) 
    echo
    echo " Opening Nautilus..."
    echo
    sleep 2
    nautilus /mnt/EXT__CLONRAID/  && > /dev/null 
    clear
    $MENU
    echo
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
    ;;


9) 
    echo 
    sudo /bin/mysql__fix-1.0.sh
    ;;
10)
    #mySQL Service
    echo -e "Disabling mysql service..."
    sudo systemctl disable mysql.service
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
    $MENU
    ;;
11)
    echo
    echo "Opening broot..."
    sleep 1
    sudo broot
    sleep 1
    $MENU
    ;;
12)
    echo 
    echo "Disabling natives services system..."
    sudo disable__services.sh
    $MENU
    ;;
13)
    echo
    echo "Loading journalctl -b..."
    sleep 1
    journalctl -b
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    $MENU
    ;;
14)
    echo
    echo "Exiting the program..."
    sleep 1
    clear
    

esac
