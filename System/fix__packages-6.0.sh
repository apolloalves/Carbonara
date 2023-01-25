#!/bin/bash
########################################################################################################################
#                                                                                                                      #
#                                                                                                                      #
# THIS PROGRAM CONTAINS ROUTINE AUTOMATION SCRIPTS FOR:                                                                #
#                                                                                                                      #
# FULL KERNEL UPDATE;                                                                                                  #
# COMPLETE UPDATE OF THE LIST OF REPOSITORIES;                                                                         #
# APPLICATION UPDATE VIA FLATPAK UPDATE                                                                                #
# COMPLETE DEVICE DRIVER UPDATE;                                                                                       #
# GRUB UPDATE AFTER KERNEL UPDATE;                                                                                     #
#                                                                                                                      #
# AUTOMATIC REMOVAL AND CORRECTION OF APT/DPKG PACKAGES;                                                               #
# REMOVAL AND CORRECTION OF TRACES OF UNUSED PACKAGES;                                                                 #
# AUTOMATIC REMOVAL OF ORPHANED PACKAGES THAT ONLY OCCUPY SPACES;                                                      #
#                                                                                                                      #
# CLEANING EXCHANGE;                                                                                                   #
# DISK USAGE SPACE SUMMARY;                                                                                            #
#                                                                                                                      #
# IN ADDITION, WE HAVE INCLUDED SCRIPTS TO REMOVE TRACES OF UNUSED DPKGS AND APTS PACKAGES THAT TAKE UP UNNECESSARY    #
# SPACE AND                                                                                                         #
# ALSO REMOVE THE ACCUMULATED KERNEL.                                                                                  #
#                                                                                                                      #
# AUTHOR : APOLLO ALVES                                                                                                                     #
#                                                                                                                      #
########################################################################################################################
# FOR IT TO WORK EFFECTIVELY, WE RECOMMEND INSTALLING SOME DEPENDENCIES:                                               #
########################################################################################################################
# STACER - SYSTEM OPTIMIZER AND MONITOR      #
# HTTPS://GITHUB.COM/OGUZHANINAN/STACER      #
#                                            #
# TRASH-CLI - REMOVAL RUBBISH BIN FILES      #
# HTTPS://GITHUB.COM/ANDREAFRANCIA/TRASH-CLI #
#                                            #
# ORPHANER - REMOVAL OF ORPHAN PACKAGES      #
# SUDO APT INSTALL DEBORPHAN                 #
#                                            #
# TIMESHIFT - SYSTEM RESTORATION             #
# HTTPS://GITHUB.COM/TEEJEE2008/TIMESHIFT    #
##############################################

# Instructions:

# 1 - Download the file;
# 2 - Give him execution privileges (X) as root;
# 3 - Move the file to the /bin directory
# 4 - Run the command in the terminal with sudo

##################################################################################################################
#                                                                                                                #
# ATTENTION!                                                                                                     #
#                                                                                                                #
# AT YOUR OWN RISK, WE ARE NOT RESPONSIBLE FOR ANY SYSTEM FAILURES OR DAMAGES THAT MAY OCCUR WITH YOUR GNU/LINUX #
# DISTRIBUTION.                                                                                                  #
#                                                                                                                #
# THE RESOURCE DEVELOPED IN THIS PROJECT IS COMPLETELY OPEN SOURCE, WE DO NOT TOLERATE IMPROPER DISTRIBUTION OR  #
# FOR PROFIT. MODIFY IT AND DISTRIBUTE IT FOR FREE TO EVERYONE!                                                  #
#                                                                                                                #
# WE ENCOURAGE YOU TO FEEL FREE TO FURTHER IMPROVE OUR CODE. AFTER ALL, THAT'S WHAT THE GNU/LINUX UNIVERSE WAS   #
# BORN FOR!                                                                                                      #
#                                                                                                                #
# # GOOD LUCK! GREETINGS!                                                                                        #
##################################################################################################################
# HIGHLIGHTS COMMANDS                                                                                            #
##################################################################################################################
#                                                                                                                #
# PRINT GOOGLE                                                                                                   #
# ECHO -E '\033[01;34;47MG\033[01;31MO\033[01;33MO\033[01;34MG\033[01;32ML \033[01;31ME\033[00;37;40M'           #
#                                                                                                                #
# PRINT FATAL ERROR "RED" - "BLINK"                                                                              #
# ECHO -E '\033[05;31MERRO FATAL\033[00;37M'                                                                     #
#                                                                                                                #
# PRINT IN "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# ECHO -E '\033[01;37MUBUNTU \033[04;32MFOCAL FOSSA\033[00;37M!!!'                                               #
#                                                                                                                #
##################################################################################################################

#HOSTNAMECTL
sudo /bin/LinuxReport.sh


echo -e '************************************************************************************************************'

echo -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo -e '************************************************************************************************************'
#********************************************************************************************************************
sleep 2
echo -e "\033[00;32mUPDATE PACKAGES OF SYSTEM..\033[00;33m\n"
#********************************************************************************************************************

      sudo apt update --fix-missing
	sudo apt install base-files sosreport ubuntu-server
	sudo apt --fix-broken install
	sudo apt install -f
	sudo apt install aptitude -y
      sudo apt upgrade -y
      sudo apt full-upgrade -y
      sudo apt dist-upgrade
	sudo aptitude safe-upgrade -y
     	echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#####################################################################################################################
echo -e "\033[01;37m\nRemoving Rubbish Bin files...\033[01;33m"
#####################################################################################################################
      sleep 1 
      sudo rm -rfv .local/share/Trash/*
      sudo rm -rfv /home/*/.local/share/Trash/*/**
      sudo rm -rfv /root/.local/share/Trash/*/**
      #OK
      echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
#####################################################################################################################
echo 'Removing open recents files...'
#####################################################################################################################
      sleep 1
      sudo rm -rfv /home/apollo__nicolly/.local/share/recently-used.xbel
      #OK
      echo -e '\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n'	
#####################################################################################################################
echo -e "\033[01;32mCLEANNING SYSTEM...\033[00;37m\n"
#####################################################################################################################
    
      sudo rm -rfv /var/lib/apt/lists/lock
      sudo rm -rfv /var/lib/dpkg/lock-frontend
      sudo rm /var/lib/apt/lists/* -vf
	sudo rm -f /var/lib/dpkg/lock
	sudo rm -rfv ~/.cache/thumbnails/*
	sudo rm -f ~/.cache/thumbnails/normal/*
	sudo rm -f /var/cache/apt/archives/lock
	sudo rm -rfv ~/.cache/tracker/ 
	sudo rm -Rfv /var/log/*

	sudo apt autoclean -y
      sudo apt -s clean
	sudo apt clean -y 
      sudo apt clean all

      sudo /bin/remove__oldsnaps.sh 
	sudo apt --purge autoremove -y
      sudo apt remove $(deborphan)

      echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n" 
#####################################################################################################################
echo -e "\n\033[01;32mCleaning up cache entries...\033[01;37m\n"
#####################################################################################################################

sleep 2

	sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

	sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
	sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
	sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)
	sudo dpkg --configure -a
      sudo dpkg install -f
      echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'  

#********************************************************************************************************************
#PRELINK 
echo -e "\n\033[01;32mOptimizing system performance...\033[00;37m\n"
#********************************************************************************************************************
sudo prelink -amR
sudo /etc/cron.daily/prelink
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#*********************************************************************************************************************'
echo -e "\n\033[01;32mChecking for flatpak updates...\033[00;37m"
#********************************************************************************************************************
      flatpak update -y

# echo -e "\n\033[01;32mReinstalling Nvidia Drivers...\033[00;37m\n"
# sleep 2
# sudo ubuntu-drivers autoinstall
#********************************************************************************************************************
# echo -e "\n\033[01;32mReinstalling gdm3...\033[00;37m\n"
# sleep 2
# sudo apt install gdm3 -y

echo 'mysql installation in course...'
sleep 2
sudo mysql__fix-1.0.sh 

#####################################################################################################################
#UPDATE GRUB
#####################################################################################################################
echo -e "\n033[01;05;31mATTENTION GRUB IS BEING UPDATED!! DOUGLAS DO NOT INTERRUPT THE PROCESS!!\033[00;37m\n"
sudo update-grub

echo -e "\n\033[01;05;32mUPDADE GRUB OK!!\033[00;37m\n"

echo '************************************************************************************************************'
echo -e "\033[01;32mSTATE RAID0 PARTITIONS\033[00;37m"
echo '************************************************************************************************************'
      df -h /dev/md0p* && lsblk | grep md0p3

echo -e '\n************************************************************************************************************'
echo -e "\033[01;32mSTATE /DEV/SD5 PARTITIONS\033[00;37m"
echo '************************************************************************************************************'
            df -h /dev/sdc5 && lsblk | grep scd5
echo -e '\n************************************************************************************************************'
            df -h /dev/sdc6 && lsblk | grep scd6
echo -e '\n************************************************************************************************************'

echo -e "\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
echo '************************************************************************************************************'
        sudo swapoff -a && swapon -a && free -h
echo '************************************************************************************************************'

#####################################################################################################################
#STACER/TIMESHIFT CONDITIONAL
#####################################################################################################################


 echo -n 'Do you want to open stacer ( y/n ) ? or press any key to exit '
 read -r stacer_question

if
            echo "${VALIDATE}"
            then
            echo -e "Operation canceled by the user\n"   
fi

 if test "n" = "$stacer_question"
                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 

fi

 if test "y" = "$stacer_question"

    then

      echo "stacer is running..."
      sleep 2
      stacer &        

      until ! pgrep -x "stacer" > /dev/null
      
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sleep 2
      done
      
      echo -e '\n'
      echo -n 'Can I create a new snapshot containing the current state of the system ( y/n ) ? or press any key to exit '
      read -r timeshift_question

fi

  if test "y" = "$timeshift_question"

            then

            echo "initializing timeshift..."
            sleep 2
            echo -e "\n\033[01;31mCreating snapshot...\033[00;37m\n"
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.4.sh ]' --tags D
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 
      fi

      if test "n" = "$timeshift_question"

                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            echo -e '\n************************************************************************************************************\n'
            lsb_release -a      
            echo -e '\n************************************************************************************************************\n'
            neofetch 
            

      fi
#####################################################################################################################################
# ORPHANER CONDITIONAL                                                                                                             #
#####################################################################################################################################

# echo -n 'Want to check for orphaned packages? ( y/n ) '
# read -r orphaner

# if test "y" = "$orphaner"
#       then 
#       echo -e "\033[01;32mOPENNING DEBORPHAN...\033[01;37m"
#       sudo orphaner

# elif test 'n'
#       then 
#       echo 'skipping ...'
#       sleep 1
# fi



