#!/bin/bash

#####################################################################
#                                                                   #
# Script: update.sh                                                 #
# optimizer performance.                                            #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

############################################################################################################
#                                                                                                          #
# Description : The provided script performs the following actions:                                        #
#                                                                                                          #
# 1. Update system packages.                                                                               #
# 2. Checks and tries to fix missing or broken packages.                                                   #
# 3. Install the "aptitude" package.                                                                       #
# 4. Install the "base-files", "sosreport" and "ubuntu-server" packages.                                   #
# 5. Performs an update of packages installed on the system.                                               #
# 6. Performs a more complete update, including possible dependency changes.                               #
# 7. Performs a full upgrade, including installing new packages if needed.                                 #
# 8. Try to fix broken packages or missing dependencies.                                                   #
# 9. Install missing packages and fix broken packages.                                                     #
# 10. Automatically scans and installs recommended drivers for your system hardware.                       #
# 11. Checks and updates Flatpak packages installed on the system.                                         #
# 12. Displays informational messages during the update process.                                           #
# 13. Pause for a few seconds before ending.                                                               #
#                                                                                                          #
# In short, the script automates the process of updating the system, installing packages, checking drivers #
# and updating Flatpak packages.                                                                           #
#                                                                                                          #
############################################################################################################
echo -e "\nUpdating system packages...\n"
############################################################################################################

sleep 1
sudo apt update -y
sudo apt update --fix-missing
sudo apt install aptitude -y
sudo apt install base-files sosreport ubuntu-server
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt --fix-broken install
sudo apt install -f

echo -e "\n\033[00;37mChecking drivers updates...\033[00;37m"
sudo ubuntu-drivers autoinstall
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

echo -e "\n\033[00;37mChecking for flatpak updates...\033[00;37m"
flatpak update -y
echo -e "\n\033[01;05;37mSystem packages have been updated successfully!!\033[00;37m\n"
sleep 3


