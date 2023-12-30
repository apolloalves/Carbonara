#!/bin/bash
# Defines the root directory from which find will be run

ROOT_DIR="/"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "LinuxBashCare" folder
path=$(find "$ROOT_DIR" -type d -name "LinuxBashCare" 2>/dev/null)

####################################################################################
# Checks if the folder/files was found and remove
####################################################################################

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'LinuxBashCare' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    sudo rm -rfv $path
    echo -e "\n\033[01;32mRemoving files from LinuxBashCare...\033[00;37m\n"
    sleep 2
    find '/bin/' -name "*__*.sh" -exec sudo rm -rfv {} \; | wc -l
    find '/bin/' -name "LinuxBashCare-*.sh" -exec sudo rm -rfv {} \; | wc -l
    sudo rm -rfv $HOME/LinuxBashCare && sudo rm -rfv $HOME/plot
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"
        
####################################################################################
# uninstall neofetch
####################################################################################

    echo -e "\n\033[01;32munistalling neofetch...\033[00;37m\n"
    sudo apt purge -y  neofetch --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  
        
####################################################################################
# uninstall deborphan
####################################################################################

    echo -e "\n\033[01;32munistalling deborphan...\033[00;37m\n"
    sudo apt purge -y deborphan --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

####################################################################################
# uninstall preload
####################################################################################

    echo -e "\n\033[01;32munistalling preload...\033[00;37m\n"
    sleep 2
    sudo apt purge -y preload --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n" 

####################################################################################
# uninstall prelink
####################################################################################

    echo -e "\n\033[01;32munistalling prelink...\033[00;37m\n"
    sleep 2
    sudo apt purge -y prelink --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

####################################################################################
# uninstall trash-cli
####################################################################################

    echo -e "\n\033[01;32munistalling trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt purge -y trash-cli --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"  

####################################################################################
# uninstall stacer
####################################################################################

    echo -e "\n\033[01;32munistalling stacer...\033[00;37m\n"
    sleep 2
    sudo apt purge -y stacer --autoremove
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n" 

####################################################################################
# uninstall Penguins-egg
####################################################################################

    echo -e "\n\033[01;32muninstalling Penguins-eggs...\033[00;37m\n"
    sudo rm -rfv /etc/apt/trusted.gpg.d/penguins-eggs.gpg
    sudo rm -rfv /etc/apt/sources.list.d/penguins-eggs.list
    sudo apt purge eggs=* 
    echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"

####################################################################################
# uninstall flatpack
####################################################################################

    echo -e "\n\033[01;32muninstalling flatpak...\033[00;37m\n"
    sleep 2
    sudo apt purge --autoremove flatpak -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

####################################################################################
# feedback remove LinuxBashCare
####################################################################################

    echo 'LinuxBashCare has been successfully removed!'
    sleep 2 
    echo -e "\n\033[01;32mCleaning files system...\033[00;37m\n"
    sudo apt autoclean -y
    sudo apt -s clean
    sudo apt clean -y
    sudo apt clean all
    sudo apt purge --autoremove
    sudo apt autoremove -y 
    echo 'updated system packages...'
    sleep 2 
    sudo apt update -y && sudo apt upgrade -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

fi
