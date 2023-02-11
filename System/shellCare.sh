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
MENU='shellCare.sh'
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
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - Swap State\033m"
echo -e "\033[01;32m[\033[01;37m q\033[01;32m ]\033[00;37m  - Exit\033m"
echo
echo "###########################################################################################"
read -p "Option: " option_choice
echo "###########################################################################################"

if [ -z "$option_choice" ] || ! [ "$option_choice" ]; then
  echo 'The option cannot be empty!' >&2
else
  echo -e '\nOption is invalid!!\n' >&2
fi





function updateSystem {
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

}

function removeTracer {
   
    echo "\nRemoving junk system files..."
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
    #####################################################################################################################
    echo -e "\nRemoving Rubbish Bin files...\n"
    #####################################################################################################################
    trash-empty -f
    sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
    sudo rm -rfv .local/share/Trash/*
    sudo rm -rfv /home/*/.local/share/Trash/*/**
    sudo rm -rfv /root/.local/share/Trash/*/**
    echo -e "\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

}

function cleanupdateSystem {

    
    echo -e "\nCleaning and updating the system...\n"
    sleep 2
    sudo /bin/fix__packages-6.0.sh
    echo

}

function systemPerformace {

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
    
}
function createSnapshot {

    echo -e "\n\033[01;31mCreating snapshot...\033[00;37m\n"
    sleep 2
    sudo timeshift --create --verbose --comments 'shell : [ shellCare ]' --tags D
    echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
    
}

function restoreSnapshot {

   
    echo -e "\n\033[01;31mRestore snapshotlist\033[00;37m\n"
    sleep 2
    sudo timeshift --restore
    echo -e "\n\033[00;37m[\033[01;32m done!\033[00;37m ]\033m\n"
    echo
}

function nautilusDir {

    echo -e "\n Opening Nautilus...\n"
    sleep 2
    nautilus /mnt/EXT__CLONRAID/ && >/dev/null
    clear
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
}

function mysqlAssitent {

    sudo /bin/mysql__fix-1.0.sh
}

function mysqlDisableService {

    #mySQL Service
    echo -e "Disabling mysql service..."
    sudo systemctl disable mysql.service
    sleep 1
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
   
}

function broot {
    
    echo -e "\nOpening broot...\n"
    sleep 1
    sudo broot
    sleep 1
}

function disableNativeServicesSystem {
    
    echo -e "\nDisabling natives services system...\n"
    sudo disable__services.sh
}

function showJournalctl {
    
    echo -e "\nLoading journalctl -b...\n"
    sleep 1
    journalctl -b
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

}

function swapState {

    echo -e "\033[01;37mSwap state\033[00;37m"
    echo "###########################################################################################"
    sleep 1
    free -h
    echo "###########################################################################################"
    echo

}

case "$option_choice" in


    1)
    
    updateSystem
    $MENU
    ;;
2)
    removeTracer
    $MENU
    ;;
3)
    cleanupdateSystem
    $MENU
    ;;
4)
    systemPerformace
    $MENU
    ;;
5)
    systemPerformace
    $MENU
    ;;
6)
    createSnapshot
    $MENU
    ;;

7)
    restoreSnapshot
    ;;
8)
    nautilusDir
    $MENU
    ;;
9)
    mysqlAssitent
    ;;
10)
    mysqlDisableService
    $MENU
    ;;
11)
    broot
    $MENU
    ;;
12)
    disableNativeServicesSystem
    $MENU
    ;;
13)
    showJournalctl
    $MENU
    ;;
14)
    swapState
    $MENU
    ;;

q)
    echo
    echo "Exiting the program..."
    sleep 1
    clear
    ;;

esac
