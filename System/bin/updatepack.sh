#!/bin/bash

#####################################################################
#                                                                   #
# Script: fix__packages-7.0.sh For updates packages of system and   #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################################################################
# The script in question is a Bash script that aims to update operating system packages and optimize performance. It  #
# prompts the user to respond whether they want to update system packages or clean up system packages.                #
#                                                                                                                     #
# If the user chooses to update the packages, the script will perform the following actions:                          #
#                                                                                                                     #
# Will update system packages using sudo apt update --fix-missing command.                                            #
# It will install the base-files, sosreport and ubuntu-server packages.                                               #
# Will fix broken packages using sudo apt --fix-broken install.                                                       #
# Will resolve missing dependencies using sudo apt install -f.                                                        #
# Will upgrade all installed packages using sudo apt upgrade -y.                                                      #
# Perform a full system upgrade using sudo apt full-upgrade -y.                                                       #
# Perform a distribution upgrade using sudo apt dist-upgrade.                                                         #
# Perform a safe upgrade using sudo aptitude safe-upgrade -y.                                                         #
# Will check for Flatpak updates using flatpak update -y.                                                             #
# If the user chooses to clean up system packages, the script will perform the following actions:                     #
#                                                                                                                     #
# It will remove cache and system log files.                                                                          #
# It will run a series of commands to clear cache files and optimize the system.                                      #
# It will clean the system recycle bin.                                                                               #
# In either case, if the user enters invalid input (other than "y" or "n"), the script will display an error message. #
#                                                                                                                     #
# It is important to note that this script contains commands that require superuser (sudo) privileges, so it is       #
# recommended to run it carefully and verify the actions that will be performed before proceeding.                    #
#######################################################################################################################

YES="y"
NO="n"
SHELLCARE='shellCare-2.0.1.sh'
removepack='removepack.sh'

echo -n 'Do you want to update system packages (y/n)? '
read -r packages_question


if [ "$packages_question" = "$YES" ]; then
    sleep 1
    echo -e "\nUpdating system packages...\n"
    #####################################################################################################################
    echo -e "\nCleaning and updating the system...\n"
    #####################################################################################################################

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
    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
fi

if [ "$packages_question" = "$NO" ]; then

    
    $removepack
    
   elif [ "$packages_question" != "$YES" ] && [ "$packages_question" != "$NO" ]; then
    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
fi