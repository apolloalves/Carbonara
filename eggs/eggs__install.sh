#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
##############################################################################################
#                                                                                            #
# Script: eggs__install.sh - Penguins-eggs Installation Script                               #
#                                                                                            #
# Author: Apollo Alves                                                                       #
# Date: 16/12/2023                                                                           #
#                                                                                            #
# Description:                                                                               #
# This script automates the installation of Penguins-eggs on a Debian-                       #
# based system. It performs the following steps:                                             #
#                                                                                            #
# 1. Checks if Penguins-eggs is already installed.                                           #
# 2. Downloads the Penguins-eggs package if not present.                                     #
# 3. Installs the Penguins-eggs package using dpkg.                                          #
# 4. Marks the installed package to prevent automatic updates.                               #
# 5. Installs Penguins-eggs Calamares module.                                                #
# 6. Removes the downloaded .deb file.                                                       #
#                                                                                            #
# Note: This script assumes a Debian-based system and requires superuser                     #
#                                                                                            #
##############################################################################################

echo -e "\n\033[01;32mVerifying Penguins-eggs installation...\033[00;37m\n"

# Check if the package is already installed
if dpkg -l | grep -w "eggs" >/dev/null; then
    echo -e "\033[01;05;37mPenguins-eggs is already installed! skipped!!\033[00;37m\n"
    exit 0
fi
# .deb file name
DEB_FILE="get-eggs"

# Check if the .deb file already exists
if [ -e "$DEB_FILE" ]; then
    echo "The file $DEB_FILE already exists in the directory. Skipping the download."
else
    echo -e "\n\033[01;32mDownloading the Penguins-eggs package...\033[00;37m\n"
    # Download the Penguins-eggs package
    git clone https://github.com/pieroproietti/get-eggs && cd get-eggs && sudo ./get-eggs.sh

    # Check if the download was successful
    if [ $? -ne 0 ]; then
        echo "Error downloading the Penguins-eggs package. Leaving."
        exit 1
    fi
fi

# Install the package
apt pacman -Syu

# Check if the installation was successful
if [ $? -ne 0 ]; then
    echo "Error installing the Penguins-eggs package. Leaving.."
    exit 1
fi

sleep 2
echo -e "\n\033[01;32minstalling Penguins-eggs calamares...\033[00;37m\n"
eggs calamares --install
echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

# BLINK MESSAGE
echo -e "\n\033[01;05;37mPenguins-eggs installed successfully!!\033[00;37m\n"
sleep 5



