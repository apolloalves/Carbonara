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

    sudo rm -rfv $path
    echo -e "\n\033[01;32mremove Shellcare folders...\033[00;37m\n"
    sleep 2
    find '/bin/' -name "*__*.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "shellCare-*.sh" -exec sudo rm -rfv {} \; | wc -l
    sudo rm -rfv $HOME/ShellCare && cd ~

    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling neofetch...\033[00;37m\n"
    sudo apt purge neofetch -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling deborphan...\033[00;37m\n"
    sudo apt purge deborphan -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling preload...\033[00;37m\n"
    sleep 2
    sudo apt purge preload -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling prelink...\033[00;37m\n"
    sleep 2
    sudo apt purge prelink -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt purge trash-cli -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32munistalling stacer...\033[00;37m\n"
    sleep 2
    sudo apt purge stacer -y
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

    echo -e "\n\033[01;32minstalling Penguins-eggs...\033[00;37m\n"
    sudo rm -rfv /etc/apt/trusted.gpg.d/penguins-eggs.gpg
    sudo rm -rfv /etc/apt/sources.list.d/penguins-eggs.list
    sudo apt purge -y eggs=*
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  
    
    echo -e "\n\033[01;32minstalling flatpak...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove flatpak -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"


    echo 'ShellCare foi removido com sucesso!'
    sleep 2 
    echo 'atualizado seus pacotes...'
    sudo apt update -y && sudo apt upgrade -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    sleep 2
    echo "done"

fi
