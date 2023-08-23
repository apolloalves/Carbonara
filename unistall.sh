#!/bin/bash

# Defines the root directory from which find will be run
ROOT_DIR="/"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "ShellCare" folder
path=$(find "$ROOT_DIR" -type d -name "ShellCare" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'ShellCare' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    # echo -e "\n\033[01;32msetting execute permissions on shell files...\033[00;37m"
    # sleep 2
    sudo rm -rfv $path/*
    echo -e "\n\033[01;32mremove Shellcare folder...\033[00;37m\n"
    sleep 2
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"


    echo -e "\n\033[01;32munistalling neofetch...\033[00;37m\n"
    sudo apt purge --automove neofetch -y
    echo ""
    echo -e "\n\033[01;37m\033[01;32mremoved\033[00;37m\033m"
    echo ""
    echo -e "\n\033[01;32munistalling deborphan...\033[00;37m\n"
    sudo apt purge --automove deborphan -y
    echo -e "\n\033[01;37m\033[01;32mremoved\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling preload...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove preload -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling prelink...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove prelink -y
       echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove trash-cli -y 
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32munistalling stacer...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove stacer -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling Penguins-eggs...\033[00;37m\n"
   
    sudo apt purge --autoremove eggs=9.4.15 -y
    echo -e "\n\033[01;32minstalling Penguins-eggs calamares...\033[00;37m\n"
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling flatpak...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove flatpak -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    sudo apt update -y && sudo apt upgrade -y
    
    echo "done"
    
    
    
    

fi
