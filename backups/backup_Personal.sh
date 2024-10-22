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
# This script executes rsync backups for folders / and /home, and logs the results.                                #
#                                                                                                                  #
####################################################################################################################

MENU='/bin/carbonara.sh'
clear

# Exibe mensagem em amarelo negrito
echo -e "\n\033[1;33mEXECUTING BACKUP OF ROOT FOLDER\033[0m"

(
    # Loop de progresso
    while true; do
        for i in {0..100}; do
            # Imprime a porcentagem
            echo -ne "\rProgress: $i% ["
            # Imprime a barra de progresso
            for ((j=0; j<i/2; j++)); do
                echo -n "="
            done
            for ((j=i/2; j<50; j++)); do
                echo -n " "
            done
            echo -n "]"
            sleep 0.1
        done
        break
    done
) &

# Guarda o PID do processo de loop
LOOP_PID=$!
# Executa o backup da raiz
rsync -avh --delete --progress --exclude={"/proc/*","/sys/*","/dev/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/*"} / /mnt/MDSATA/ROOT_BACKUP/ >> /var/log/root_backup.log

# Quando o backup terminar, o laço é finalizado
kill $LOOP_PID

# Exibe mensagem de conclusão
echo
echo -e "\n\033[1;32mBackup folder root completed...\033[0m\n"

# Inicia o backup da pasta /home
echo -e "\n\033[1;33mStarting backup of /home folder...\033[0m\n"

(
    # Loop de progresso
    while true; do
        for i in {0..100}; do
            # Imprime a porcentagem
            echo -ne "\rProgress: $i% ["
            # Imprime a barra de progresso
            for ((j=0; j<i/2; j++)); do
                echo -n "="
            done
            for ((j=i/2; j<50; j++)); do
                echo -n " "
            done
            echo -n "]"
            sleep 0.1
        done
        break
    done
) &

# Guarda o PID do processo de loop
LOOP_PID=$!

# Executa o backup da pasta /home
rsync -avh --delete --progress --exclude={".local/share/Trash/*","apollo/.local/share/Trash/*","eggs/","node_modules/","package.json","package-lock.json","lost+found"} /home/ /mnt/MDSATA/HOME_BACKUP/ >> /var/log/home_backup.log

# Quando o backup terminar, o laço é finalizado
kill $LOOP_PID

# Exibe mensagem de conclusão
echo
echo -e "\n\033[1;32mBackup folder home completed...\033[0m\n"

clear

# Abre os logs em terminais separados
echo -e "\nOpening logs...\n"
sleep 2
sudo kgx --tab -e "cat /var/log/home_backup.log" >/dev/null 2>&1
sudo kgx --tab -e "cat /var/log/root_backup.log" >/dev/null 2>&1

clear
echo
echo -e "\033[1;32;5mBackup Completed Successfully!\033[0m"
echo "Returning to the menu.."
sleep 5

$MENU
