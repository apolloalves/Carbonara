#!/bin/bash
source ~/.bashrc
. ~/.bashrc
clear

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
# SUDO APT INSTALL DEBORPHAN                 #
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
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#
# DONE MESSAGE AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e "\n\033[01;37m[\033[00;32m done\033[00;37m ]\033m\n"
#
# BACKGROUND IN TEXT
# echo -e "\033[48;8;01;30;100mChoose an option from the menu\033[0m"
#
# BACKGROUND WHITE IN TEXT WHITE
# echo -e "\033[1;48;05;32;100m   Choose an option from the menu  \033[0m"

######################################################################################################################################################################################
MENU='shellCare-22.0.1.sh'
NEOFETCH='neofetch --ascii_colors 8 7 --colors 7'
neofetch_output=$($NEOFETCH)
######################################################################################################################################################################################
LINE='line.sh'
echo -e "\033[1;97;100m        ShellCare System          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  23.04.1        \033[0m"
######################################################################################################################################################################################
echo
echo -e "$neofetch_output"
$LINE
echo -e "\033[01;97m Select an option from the menu: \033[0m"
$LINE
echo
######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - Update all system packages\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Remove traces of unused packages from the system\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Run both\033m"
echo -e "\033[01;32m[\033[01;37m 04\033[01;32m ]\033[00;37m - Optimize system performance - ( root user required )  "
echo -e "\033[01;32m[\033[01;37m 05\033[01;32m ]\033[00;37m - Remove unwanted packages of system - ( root user required )    "
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Disable services natives   "
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Remove unused PPA on system - ( root user required )   "
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Verify Startup time System"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Swap State"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files - broot file manager  "
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Check space disks"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Open STACER"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Mount External Disks"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - Create Penguin's Eggs  "
echo -e "\033[01;32m[\033[01;37m 15\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'  "
echo -e "\033[01;32m[\033[01;37m 16\033[01;32m ]\033[00;37m - Open CLONRAID backups"
echo -e "\033[01;32m[\033[01;37m 17\033[01;32m ]\033[00;37m - Reinstall GNOME gdm3   "
echo -e "\033[01;32m[\033[01;37m 18\033[01;32m ]\033[00;37m - Start mysql assistent  "
echo -e "\033[01;32m[\033[01;37m 19\033[01;32m ]\033[00;37m - Check if a new version of Ubuntu is available  "
echo -e "\033[01;32m[\033[01;37m 20\033[01;32m ]\033[00;37m - Manage packages with aptitude"
echo -e "\033[01;32m[\033[01;37m 21\033[01;32m ]\033[00;37m - Manage packages and drivers"
echo -e "\033[01;32m[\033[01;37m 22\033[01;32m ]\033[00;37m - Show disable services list"
echo -e "\033[01;32m[\033[01;37m 23\033[01;32m ]\033[00;37m - Reboot System"

######################################################################################################################################################################################

echo -e "\033[01;32m[\033[01;37m E\033[01;32m ]\033[00;37m  - EXIT\033m"
echo
$LINE
read -p "Input option : " option_choice
$LINE


valid_option=true

if [ "$option_choice" != "e" ] && [ "$option_choice" != "E" ]; then

    if [ "$valid_option" = true ]; then
        echo -e "\033[05;31mThe option: $option_choice will be executed:\033[00;37m\n"

        case "$option_choice" in
        1)
            update__pack.sh
            ;;
        2)
            remove__traces.sh
            ;;
        3)
            update__system.sh
            remove__system.sh
            ;;
        4)
            gnome-terminal --tab -- bash -c "sudo su -c '/bin/optimize__performance.sh /'; exec bash"
            #   new window
            #   gnome-terminal -- bash -c "sudo su -c '/bin/performance.sh /'; exec bash"
            ;;
        5)
            sudo su -c "bash /bin/unwanted__pack.sh"
            ;;
        6)
            disable__services.sh
            ;;

        7)
            sudo su -c "bash /bin/remove__unused_ppa.sh"
            ;;

        8)
            system__analyse.sh
            ;;

        9)
            swap__state.sh
            ;;
        10)
            TARGETPATH="/mnt/VENTOY"
            echo "Checking device..."
            sleep 2
            sudo mount /dev/sdc1 $TARGETPATH
            echo -e "\nOpening broot...\n"
            gnome-terminal --tab -- bash -c "sudo broot -s -p -d --sort-by-date '/mnt/VENTOY/' ; exec bash"
            sleep 1
            ;;

        11)
            check__space.sh
            ;;
        12)
            stacer__tools.sh
            ;;
        13)
            ext__disk-2.1.sh
            ;;

        14)
            eggs__create.sh
            ;;

        15)
            sudo show__journalctl.sh
            ;;

        16)
            clonraid__backups.sh
            ;;
        17)
            reinstall__gnome-gdm3.sh
            ;;

        18)
            mysql__fix-1.0.sh
            ;;

        19)
            sudo do-release-upgrade
            ;;

        20)
            echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
            echo "verificando a existencia do aptitude..."
            sudo apt install aptitude -y
            echo "instalação concluida"
            echo -e "\nabrindo aptitude..."
            sleep 2
            sudo aptitude
            echo "done"
            ;;
        21)
            software-properties-gtk --open-tab=4
            echo -e "\n\033[01;37m\033[01;32mdone!\033[00;37m\033m\n"
            ;;

        22)
            echo -e "\nGerando lista..\n"
            sleep 2

            # systemctl list-unit-files --type=service | grep disable
            systemctl list-unit-files --type=service | grep disable >services && cat -n services
            # echo -e "\n\033[01;37m\033[01;32mdone!\033[00;37m\033m\n"
            echo ""
            $LINE
            sleep 10
            ;;

        23)

            reboot__system.sh
            ;;
        
        *)
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
