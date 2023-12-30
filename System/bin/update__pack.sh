#!/bin/bash
# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi

#####################################################################
#                                                                   #
# Script: update__pack-.sh                                          #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################################################################
#                                                                                                                     #      
# The script in question is a Bash script that aims to update operating system packages and optimize performance. It  #
# prompts the user to respond whether they want to update system packages or clean up system packages.                #
#                                                                                                                     #
# If the user chooses to update the packages, the script will perform the following actions:                          #
#                                                                                                                     #
# Will update system packages using  apt update --fix-missing command.                                                #
# It will install the base-files, sosreport and ubuntu-server packages.                                               #
# Will fix broken packages using  apt --fix-broken install.                                                           #
# Will resolve missing dependencies using  apt install -f.                                                            #
# Will upgrade all installed packages using  apt upgrade -y.                                                          #
# Perform a full system upgrade using  apt full-upgrade -y.                                                           #
# Perform a distribution upgrade using  apt dist-upgrade.                                                             #
# Perform a safe upgrade using  aptitude safe-upgrade -y.                                                             #
# Will check for Flatpak updates using flatpak update -y.                                                             #
# If the user chooses to clean up system packages, the script will perform the following actions:                     #
#                                                                                                                     #
# It will remove cache and system log files.                                                                          #
# It will run a series of commands to clear cache files and optimize the system.                                      #
# It will clean the system recycle bin.                                                                               #
# In either case, if the user enters invalid input (other than "y" or "n"), the script will display an error message. #
#                                                                                                                     #
# It is important to note that this script contains commands that require superuser () privileges, so it is           #
# recommended to run it carefully and verify the actions that will be performed before proceeding.                    #
#                                                                                                                     #
#######################################################################################################################

##############################################################################
# COMMANDS                                                                   #
#                                                                            #
# 1. Update the package list                                                 #
# 2. Fix missing or broken packages                                          #
# 3. Perform distribution upgrade (more aggressive in dependency resolution) #
# 4. Upgrade packages                                                        #
# 5. Ensure all dependencies are satisfied (optional)                        #
# 6. Install or update specific packages                                     #
# 7. Fix potential configuration issues with dpkg                            #
# 8. Install aptitude (optional)                                             #
# 9. Resolve missing dependencies (optional)                                 #
#                                                                            #
##############################################################################

# GREEN MESSAGE
##############################################################################
echo -e "\n\033[01;32mUpdating system packages...\033[00;37m\n"              #                                      
##############################################################################

sleep 1
sudo apt update -y
sudo apt --fix-missing install
sudo apt --fix-broken install
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt install base-files sosreport
sudo dpkg --configure -a
sudo apt install aptitude -y
sudo apt install -f

# GREEN MESSAGE
##############################################################################
echo -e "\n\033[01;32mChecking drivers updates...\033[00;37m\n"              #
##############################################################################

ubuntu-drivers autoinstall

# GREEN MESSAGE
##############################################################################
echo -e "\n\033[01;32mChecking for flatpak updates...\033[00;37m\n"          #
##############################################################################

flatpak update -y

# BLINK MESSAGE
echo -e "\n\033[01;05;32mSystem packages have been updated successfully!!\033[00;37m\n"
sleep 1


