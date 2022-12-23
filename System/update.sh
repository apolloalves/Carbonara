#!/bin/bash

# This program contains routine automation scripts for:

# Full kernel update;
# Complete update of the list of repositories;
# Application update via flatpak update
# Complete device driver update;
# GRUB update after kernel update;

# Automatic removal and correction of apt/dpkg packages;
# Removal and correction of traces of unused packages;
# Automatic removal of orphaned packages that only occupy spaces;

# Cleaning exchange;
# Disk usage space summary;

# In addition, we have included scripts to remove traces of unused dpkgs and apts packages that take up unnecessary space and also remove the accumulated kernel.
# For it to work effectively, we recommend installing some dependencies:

# STACER - System Optimizer and Monitor
# https://github.com/oguzhaninan/Stacer

# TRASH-CLI - REMOVAL RUBBISH BIN FILES
# https://github.com/andreafrancia/trash-cli

# ORPHANER - REMOVAL OF ORPHAN PACKAGES
# sudo apt install deborphan

# TIMESHIFT - SYSTEM RESTORATION
# https://github.com/teejee2008/timeshift

# Instructions:

# 1 - Download the file;
# 2 - Give him execution privileges (X) as root;
# 3 - Move the file to the /bin directory
# 4 - Run the command in the terminal with sudo

# ATTENTION!
# At your own risk, we are not responsible for any system failures or damages that may occur with your GNU/LINUX distribution.
# The resource developed in this project is completely open source, we do not tolerate improper distribution or for profit. Modify it 
# and distribute it for free to everyone!
# We encourage you to feel free to further improve our code. After all, that's what the GNU/LINUX universe was born for!

# Good luck! Greetings!
#********************************************************************************************************************
#Highlights commands
#********************************************************************************************************************
#Print google
#echo -e '\033[01;34;47mG\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'
#********************************************************************************************************************
#Print Fatal Error "RED" - "Blink"
#echo -e '\033[05;31mERRO FATAL\033[00;37m'
#********************************************************************************************************************
#Print in "white bold Ubuntu" and "Green Underscore" "Focal Fossa"
#echo -e '\033[01;37mUbuntu \033[04;32mFocal Fossa\033[00;37m!!!'
#********************************************************************************************************************

#HOSTNAMECTL
echo -e "\033[01;32mMACHINE REPORT\033[00:37m"
hostnamectl
#lsb_release -cs
echo -e '************************************************************************************************************'

echo -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo -e '************************************************************************************************************'

#OK
#********************************************************************************************************************
#echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e "\033[00;32mCLEARING TRACES OF PACKAGES...\033[00;33m\n"
#********************************************************************************************************************
    sudo apt update -y sudo apt upgrade -y 
	sudo apt full-upgrade -y
	sudo apt-get dist-upgrade
	sudo apt install -f
	sudo apt update --fix-missing
	sudo apt --fix-broken install
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt clean -y 
	sudo apt --purge autoremove -y
	sudo apt-get install base-files sosreport ubuntu-server
	sudo apt-get install aptitude -y
	sudo aptitude safe-upgrade
	sudo apt remove $(deborphan)
