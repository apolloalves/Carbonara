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

MENU='shellCare-1.2.sh'
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
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Open CLONRAID backups\033m"
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Start mysql assistent\033m"
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Disable mysql"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Open Broot\033m"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Disable services natives\033m"
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Reinstall GNOME gdm3 \033m"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - STACER \033m"
echo -e "\033[01;32m[\033[01;37m 15\033[01;32m ]\033[00;37m - Create Penguin's Eggs \033m"


echo -e "\033[01;32m[\033[01;37m q\033[01;32m ]\033[00;37m  - QUIT\033m"
echo
echo "###########################################################################################"
read -p "Option: " option_choice
echo "###########################################################################################"

if ! $option_choice 2>/dev/null && [ -z "$option_choice" ]; then
  echo "$option_choice"


fi

function updateSystem {
    echo -e "\n Updating system packages...\n" 
    sleep 1

    sudo apt update -y 
    sudo apt update --fix-missing
    sudo apt install aptitude -y
    sudo apt upgrade -y
    sudo apt install base-files sosreport ubuntu-server
    sudo apt dist-upgrade -y 
    sudo apt full-upgrade -y
    sudo apt --fix-broken install 
    sudo apt install -f
    echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
    flatpak update -y
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

}

function removeTracer {
   
    echo -e "\n Removing junk system files..."
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
    
    sudo /bin/remove__oldsnaps.sh
    sudo apt --purge autoremove -y

    sudo apt autoclean -y
    sudo apt -s clean
    sudo apt clean -y
    sudo apt clean all

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
    sudo /bin/cls.sh

}

function cleanupdateSystem {
    
    echo -e "\nCleaning and updating the system...\n"
    sleep 1
    sudo /bin/fix__packages-7.0.sh
    echo

}

function systemPerformace {

    echo "Option 4 choosen"
    #********************************************************************************************************************
    #PRELINK
    echo -e "\n\033[01;32mOptimizing system performance...\033[00;37m\n"
    #********************************************************************************************************************
    
    sleep 1
    echo -e "\n\033[01;32mCleaning drop_caches...\033[00;37m\n"
	sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'  

    
    echo -e "\n\033[01;32mRemoving old kernels...\033[00;37m\n"

	sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
	sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
	sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)
    sudo dpkg -l 'linux-*' | awk '/^ii/{print $2}' | grep -v "$(uname -r)" | xargs sudo apt remove -y
	sudo dpkg --configure -a
    sudo dpkg install -f

    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'  

    echo -e "\n\033[01;32mPrelink is improving the performance of executables...\033[00;37m\n"
    sudo prelink -amR
    sudo /etc/cron.daily/prelink
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
        
    echo -e "###########################################################################################"


    echo -e "\n\033[01;32mClearing RAM memory...\033[00;37m\n"
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

    

}

function checkSpace {
    echo -e "\n Check spaces...\n"
    sleep 1 
    df -h / && echo "" && df -h /home && echo "" && df -h /mnt/EXT@ST500LM012__CLONRAID && echo "" &&  df -h /mnt/EXT@ST500LM012__STORAGE/
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
}

function nautilusDir {

    echo -e "\n Opening Nautilus...\n"
    sleep 2
    nautilus /mnt/EXT@ST500LM012__CLONRAID/ && >/dev/null
    clear
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    echo
}

function mysqlAssitent {

    sudo /bin/mysql__fix-1.0.sh
}

function stacer {

    sudo /bin/stacer.sh
}


function mysqlDisableService {

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

function gnomeGdm3 {

echo -e "\n\033[01;32mReinstalling gdm3...\033[00;37m\n"
sleep 2
sudo apt install gdm3 -y

}

function mountDisk {
    echo -n 
    sudo /bin/ext__disk-1.0.sh
}


function eggsCreate {

    /bin/btrfs_balance.sh
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
    checkSpace
    $MENU
    ;;

6)
    nautilusDir
    $MENU
    ;;
7)
    mysqlAssitent
    ;;
8)
    mysqlDisableService
    $MENU
    ;;
9)
    broot
    $MENU
    ;;
10)
    disableNativeServicesSystem
    $MENU
    ;;
11)
    showJournalctl
    $MENU
    ;;
12)
    swapState
    $MENU
    ;;
13)
    gnomeGdm3
    $MENU
    ;;

14)
    stacer
    $MENU
    ;;
15)
    eggsCreate
    $MENU
    ;;

q)
    echo
    echo "Exiting the program..."
    sleep 1
    clear
    ;;

esac
