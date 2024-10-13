#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: rsync_gen.sh                                              #
# Author: Apollo Alves                                              #
# Date: 11/10/2023                                                  #
#                                                                   #
#####################################################################

####################################################################################################################
#                                                                                                                  #
# Description:                                                                                                     #
# This script exec rsync backups folders / and /home 	   							   #
# the operation was successful.                                                                                    #
#                                                                                                                  #
####################################################################################################################
clear
echo -e "\n EXECUTANDO BACKUP DA FOLDER / ...\n"
sleep 1
rsync -avh --delete --exclude={"/proc/*","/sys/*","/dev/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*"} / /mnt/MDSATA/ROOT_BACKUP/ >> /var/log/root_backup.log
echo -e "\n backup folder root completed...\n"
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
sleep 3
clear
echo -e "\n iniciando o backup folder /home...\n"
rsync -avh --delete --exclude={".local/share/Trash/*","apollo/.local/share/Trash/*","eggs/*","node_modules/*"} /home/ /mnt/MDSATA/HOME_BACKUP/ >> /var/log/home_backup.log
echo -e "\n backup folder home completed...\n"
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
clear
echo "Opening files logs "
echo
sleep 2
sudo kgx --tab -e "cat /var/log/home_backup.log"

echo
echo
cat /var/log/root_backup.log
sudo kgx --tab -e "cat /var/log/root_backup.log"

clear
echo "Operation completed"
sleep 2
carbonara