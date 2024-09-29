#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

# Defines the root directory from which find will be run
ROOT_DIR="/"
CARBONARA_DIR="$HOME/Carbonara"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "LinuxBashCare" folder
path=$(find "$ROOT_DIR" -type d -name "Carbonara" 2>/dev/null)

####################################################################################
# Checks if the folder/files was found and remove
####################################################################################

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'Carbonara' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/*/*.sh
    find $path/* -ls | wc -l

    # sudo rm -rfv $path
    echo -e "\n\033[01;32mRemoving files from Carbonara...\033[00;37m\n"
    sleep 2
    find '/bin/' -name "*__*.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "*_*.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "pacmanCleanCache.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "pacman-remove.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "pamac-manager.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "pacman-system.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "pacman-update.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "carbonara.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "report.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "scripts.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "ventoy.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "menu.sh" -exec sudo rm -rfv {} \; | wc -l
    sudo rm -rfv $HOME/plot
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"
        

    echo "Thank you!"
    sleep 2 
    echo "bye!"

    exit


fi
