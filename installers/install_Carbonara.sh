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
path=$(find "$ROOT_DIR" -type d -name "Carbonara" 2>/dev/null)

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

    echo -e "\n\033[01;32mupdate packages of system...\033[00;37m\n"
    echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
    sleep 2
    sudo apt update -y && sudo apt upgrade -y
    sudo dpkg --configure -a
    sudo apt install -f
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    echo -e "\n\033[01;32minstalling dependencies...\033[00;37m\n"
    sleep 3
    echo -e "\n\033[01;32mCreating folder plot in: $HOME...\033[00;37m\n"
    mkdir $HOME/plot
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling neofetch...\033[00;37m\n"
    sudo apt install neofetch -y
    echo ""
    neofetch
    echo ""
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    
    echo -e "\n\033[01;32minstalling deborphan...\033[00;37m\n"
    
    sudo apt install deborphan -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling preload...\033[00;37m\n"
    sleep 2
    sudo apt install preload
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling prelink...\033[00;37m\n"
    sleep 2
    sudo apt install prelink -y
    sudo sed -i '6s/PRELINKING=.*/PRELINKING=yes/' /etc/default/prelink >/dev/null
    sudo chmod 666 /etc/prelink.conf
    sudo prelink -amvR
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt-get install trash-cli
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling stacer...\033[00;37m\n"
    sleep 2
    sudo apt install stacer -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling flatpak...\033[00;37m\n"
    sleep 2
    sudo apt install flatpak -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minserting history format in ~/.bashrc\033[00;37m\n"
    sed -i "14s/.*/HISTTIMEFORMAT='%Y-%m-%d%T '/" ~/.bashrc
    source ~/.bashrc
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    echo
    broot_install.sh  
    sleep 1
    echo -e "\n\033[01;32minstalling Penguins-eggs...\033[00;37m\n"
    source /bin/eggs__install.sh
    echo -e "\n\033[01;05;37mLinuxBashCare-10.12.23 successfully installed!!\033[00;37m\n"
    echo "Executando LinuxBashCare-10.12.23..."
    sleep 2 
    LinuxBashCare-10.12.23.sh

fi
