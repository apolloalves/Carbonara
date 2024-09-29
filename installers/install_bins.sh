#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
####################################################################################
#                                                                                  #
# Script: install.sh - LinuxBashCare Setup Script                                  #
#                                                                                  #
# Author: Apollo Alves                                                             #
# Date: 16/12/2023                                                                 #
#                                                                                  #
# Description:                                                                     #
# This script automates the setup process for LinuxBashCare. It performs           #
# various tasks, including locating the LinuxBashCare folder, setting              #
# execute permissions, copying executables to /bin, updating the system,           #
# installing dependencies, and configuring system utilities.                       #
#                                                                                  #
# Note: This script assumes a Debian-based system and requires superuser           #
# (sudo) privileges for certain operations.                                        #
#                                                                                  #
####################################################################################

# Defines the root directory from which find will be run
ROOT_DIR="/"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "LinuxBashCare" folder
path=$(find "$ROOT_DIR" -type d -name "LinuxBashCare" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'LinuxBashCare' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    echo -e "\n\033[01;32msetting execute permissions on shell files...\033[00;37m"
    sleep 2
    sudo chmod +x $path/System/bin/*.sh
    echo -e "\n\033[01;32mcopying the executables to the /bin folder...\033[00;37m\n"
    sleep 2
    sudo rsync -avh --progress $path/System/bin/*.sh /bin/
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
fi