#!/bin/bash
########################################################################################################################
#                                                                                                                      #
# SHELLCARE-22.1.sh                                                                                                                #
# THIS PROGRAM CONTAINS ROUTINE AUTOMATION SCRIPTS FOR:                                                                #
#                                                                                                                      #
# FULL KERNEL UPDATE;                                                                                                  #
# COMPLETE UPDATE OF THE LIST OF REPOSITORIES;                                                                         #
# APPLICATION UPDATE VIA FLATPAK UPDATE                                                                                #
# COMPLETE DEVICE DRIVER UPDATE;                                                                                       #
# GRUB UPDATE AFTER KERNEL UPDATE;                                                                                     #
#                                                                                                                      #
# AUTOMATIC REMOVAL AND CORRECTION OF APT/DPKG PACKAGES;                                                               #
# REMOVAL AND CORRECTION OF TRACES OF UNUSED PACKAGES;                                                                 #
# AUTOMATIC REMOVAL OF ORPHANED PACKAGES THAT ONLY OCCUPY SPACES;                                                      #
#                                                                                                                      #
# CLEANING EXCHANGE;                                                                                                   #
# DISK USAGE SPACE SUMMARY;                                                                                            #
#                                                                                                                      #
# IN ADDITION, WE HAVE INCLUDED SCRIPTS TO REMOVE TRACES OF UNUSED DPKGS AND APTS PACKAGES THAT TAKE UP UNNECESSARY    #
# SPACE AND                                                                                                         #
# ALSO REMOVE THE ACCUMULATED KERNEL.                                                                                  #
#                                                                                                                      #
# AUTHOR : APOLLO ALVES                                                                                                                     #
#                                                                                                                      #
########################################################################################################################
# FOR IT TO WORK EFFECTIVELY, WE RECOMMEND INSTALLING SOME DEPENDENCIES:                                               #
########################################################################################################################
# STACER - SYSTEM OPTIMIZER AND MONITOR      #
# HTTPS://GITHUB.COM/OGUZHANINAN/STACER      #
#                                            #
# TRASH-CLI - REMOVAL RUBBISH BIN FILES      #
# HTTPS://GITHUB.COM/ANDREAFRANCIA/TRASH-CLI #
#                                            #
# ORPHANER - REMOVAL OF ORPHAN PACKAGES      #
# sudo apt install deborphan                 #
#                                            #
##############################################

# Instructions:

# 1 - Download the file;
# 2 - Give him execution privileges (X) as root;
# 3 - Move the file to the /bin directory
# 4 - Run the command in the terminal with sudo

##################################################################################################################
#                                                                                                                #
# ATTENTION!                                                                                                     #
#                                                                                                                #
# AT YOUR OWN RISK, WE ARE NOT RESPONSIBLE FOR ANY SYSTEM FAILURES OR DAMAGES THAT MAY OCCUR WITH YOUR GNU/LINUX #
# DISTRIBUTION.                                                                                                  #
#                                                                                                                #
# THE RESOURCE DEVELOPED IN THIS PROJECT IS COMPLETELY OPEN SOURCE, WE DO NOT TOLERATE IMPROPER DISTRIBUTION OR  #
# FOR PROFIT. MODIFY IT AND DISTRIBUTE IT FOR FREE TO EVERYONE!                                                  #
#                                                                                                                #
# WE ENCOURAGE YOU TO FEEL FREE TO FURTHER IMPROVE OUR CODE. AFTER ALL, THAT'S WHAT THE GNU/LINUX UNIVERSE WAS   #
# BORN FOR!                                                                                                      #
#                                                                                                                #
# # GOOD LUCK! GREETINGS!                                                                                        #
##################################################################################################################
# HIGHLIGHTS COMMANDS                                                                                            #
##################################################################################################################
#                                                                                                                #
# PRINT GOOGLE                                                                                                   #
# echo -e '\033[01;34;47mg\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'           #
#                                                                                                                #
# PRINT FATAL ERROR "RED" - "BLINK"                                                                              #
# echo -e '\033[05;31merro fatal\033[00;37m'                                                                     #
#                                                                                                                #
# PRINT IN "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e '\033[01;37mubuntu \033[04;32mfocal fossa\033[00;37m!!!'                                               #
#
# OK MESSAGE "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
#
# DONE MESSAGE AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e "\n\033[01;37m[\033[00;32m done\033[01;37m ]\033m\n"
#
# BACKGROUND IN TEXT
# echo -e "\033[48;8;01;30;100mChoose an option from the menu\033[0m"
#
# BACKGROUND WHITE IN TEXT WHITE
# echo -e "\033[1;48;05;32;100m   Choose an option from the menu  \033[0m"

######################################################################################################################################################################################

LINE='line.sh'
echo
echo -e "\033[1;32;02;40;100m         ShellCare System          \033[0m\033[\033[1;40;02;32;107m          Apollo Alves        \033[1;32;02;40;100m     version  22.0.1     \033[0m"
######################################################################################################################################################################################

echo
neofetch
$LINE
echo -e "\033[1;40;02;32;107m   Choose an option from the menu   \033[0m"
$LINE
echo
######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - Update all system packages\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Remove traces of unused packages from the system\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Run both\033m"
echo -e "\033[01;32m[\033[01;37m 04\033[01;32m ]\033[00;37m - Optimize system performance - required sudo\033m"
echo -e "\033[01;32m[\033[01;37m 05\033[01;32m ]\033[00;37m - Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Disable services natives\033m"
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Verify Startup time System \033m"
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Create Penguin's Eggs \033m"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files - broot \033m"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Start volume balancing \033m"
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Open CLONRAID backups\033m"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Open STACER \033m"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - Check space disks\033m"
echo -e "\033[01;32m[\033[01;37m 15\033[01;32m ]\033[00;37m - Start mysql assistent\033m"
echo -e "\033[01;32m[\033[01;37m 16\033[01;32m ]\033[00;37m - Disable mysql"
echo -e "\033[01;32m[\033[01;37m 17\033[01;32m ]\033[00;37m - Reinstall GNOME gdm3 \033m"
echo -e "\033[01;32m[\033[01;37m 18\033[01;32m ]\033[00;37m - Mount Externl Disks"
echo -e "\033[01;32m[\033[01;37m 19\033[01;32m ]\033[00;37m - Check if a new version of Ubuntu is available \033m"
echo -e "\033[01;32m[\033[01;37m 20\033[01;32m ]\033[00;37m - Reboot System \033m"

######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m q\033[01;32m ]\033[00;37m  - QUIT\033m\n"
$LINE

read -p "Chosen option : " option_choice
$LINE

MENU='shellCare-22.0.1.sh'
valid_option=true

if [ "$option_choice" != "q" ]; then

    if [ "$valid_option" = true ]; then
        echo -e "\033[01;05;37mThe option: $option_choice will be executed:\033[00;37m\n"
        # echo -e "\033[01;06;37mThe option: $option_choice will be executed:\033[00;37m"

        case "$option_choice" in

          1)
              update.sh
              ;;
          2)
              remove.sh
              stacer.sh
              ;;
          3)
              updateSystem.sh
              ;;
          4)
              gnome-terminal --tab -- bash -c "sudo performance.sh /; exec bash"
              ;;
          5)
              swapState.sh
              ;;
          6)
              disable__services.sh
              ;;
          7)
              systemAnalyse.sh
              ;;
          8)
              eggsCreate.sh
              ;;
          9)
              echo -e "\nOpening broot...\n"
              sudo broot -s -p -d --sort-by-date '/mnt/VENTOY/'
              sleep 1
              ;;

          10)
            #   btrfs_balance.sh
            echo "This is disabled!"
              ;;
          11)
              clonraidBackups.sh
              ;;
          12)
              stacer.sh
              ;;
          13)
              gnome-terminal --tab -- bash -c "showJournalctl.sh /; exec bash"
              ;;
          14)
              checkSpace
              ;;
          15)
              mysql__fix-1.0.sh
              ;;
          16)
              mysqlDisableService.sh
              ;;
          17)
              reinstallGnomeGdm3
              ;;
          18)
              ext__disk-1.0.sh
              ;;
          19)
              sudo do-release-upgrade
              ;;
          20)
              sudo init 6
              ;;
          q)
                valid_option=true
                echo
                echo "Exiting the program..."
                echo "Bye!"
                sleep 2
                clear
                ;;
          *)
                echo -e "\nops!\n"
                echo -e "\033[01;05;37m'$option_choice' command not found!\033[00m\n"
                echo -e "Invalid input! Please enter 'y' or 'n'.\n"
                ;;
        esac
        $MENU
    else
        echo -e "\nops!\n"
        echo -e "\033[01;05;37m'$option_choice' command not found!\033[00m\n"
        echo -e "Invalid input! Please enter 'y' or 'n'.\n"
    fi
else
    echo
    echo "Exiting the program..."
    echo "Bye!"
    sleep 2
    clear
fi

