#!/bin/bash
source ~/.bashrc
. ~/.bashrc

#############################################
#                                           #
# Script: shellCare-22.0.1,sh               #
# Author : Apollo Alves                     #
# Date : 14/07/2023                         #
#############################################

##################################################################################################################
#                                                                                                                #
# Description : This script is an interactive menu that allows the user to select an option and execute          #
# different commands based on the choice made. Here is a summary of what it does:                                #
#                                                                                                                #
# 1. Define some variables like LINE, MENU and REMOVEPACK.                                                       #
# 2. Displays an informative header with information about the ShellCare System.                                 #
# 3. Display system information using the "neofetch" command.                                                    #
# 4. Displays menu options numbered 1 through 20.                                                                #
# 5. Prompts the user to choose an option by typing the corresponding number.                                    #
# 6. Based on the chosen option, the script executes different commands corresponding to each case:              #
#                                                                                                                #
# - Each option has an associated number and a corresponding action defined in a "case" block.                   #
# - Commands can include running other shell scripts, opening applications, or performing specific actions.      #
#                                                                                                                #
# 7. After executing the action corresponding to the selected option, the script returns to the main menu to     #  
# allow the user to choose another option or exit the program.                                                   #
#                                                                                                                #
# In short, this shell script is an interactive menu that provides various options and executes different        #
# commands based on the user's choice. It offers features such as updating system packages, cleaning files,      #
# optimizing performance, handling external disks, among other features related to system administration and     # 
# configuration.                                                                                                 #
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
# GOOD LUCK! GREETINGS!                                                                                          #  
##################################################################################################################
# HIGHLIGHTS COMMANDS                                                                                            #
##################################################################################################################
# PRINT GOOGLE =)                                                                                                #
# echo -e '\033[01;34;47mg\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'           #
#                                                                                                                #
# PRINT FATAL ERROR "RED" - "BLINK"                                                                              #
# echo -e '\033[05;31merro fatal\033[00;37m'                                                                     #
#                                                                                                                #
# PRINT IN "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                              #
# echo -e '\033[01;37mubuntu \033[04;32mfocal fossa\033[00;37m!!!'                                               #
#                                                                                                                #  
# OK MESSAGE "WHITE BOLD UBUNTU" AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                            #
# echo -e "\n\033[01;37m[\033[00;32m \033[01mOK\033[00;32m\033[01;37m ]\033[00m\n"                               #                      
#                                                                                                                #
# DONE MESSAGE AND "GREEN UNDERSCORE" "FOCAL FOSSA"                                                              #
#                                                                                                                #
# echo -e "\n\033[01;37m[\033[00;32m \033[01mdone\033[00;32m\033[01;37m ]\033[00m\n"                             #
# echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"                                                      #                                                         
#                                                                                                                #
# BACKGROUND IN TEXT                                                                                             #
# echo -e "\033[48;8;01;30;100mChoose an option from the menu\033[0m"                                            #
#                                                                                                                #
# WAIT                                                                                                           #
# echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"                                                    #                                                           
#                                                     #                                                          #
# BACKGROUND WHITE IN TEXT WHITE                                                                                 #
# echo -e "\033[1;48;05;32;100m   Choose an option from the menu  \033[0m"                                       #
#                                                                                                                #
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
select__menu.sh
######################################################################################################################################################################################
$LINE

read -p "Chosen option : " option_choice
$LINE

MENU='shellCare-22.0.1.sh'
valid_option=true

if [ "$option_choice" != "q" ]; then

    if [ "$valid_option" = true ]; then
        echo -e "\033[01;05;37mThe option: $option_choice is running...\033[00;37m"
       
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
          systemctl list-unit-files --type=service | grep disable > services && cat -n services
          # echo -e "\n\033[01;37m\033[01;32mdone!\033[00;37m\033m\n"                    
          echo ""
          $LINE
          sleep 10
          ;;

        23)
          
          reboot__system.sh
          ;;

        q)
            valid_option=true
            echo
            sleep 1
            echo "Exiting the program..."
            echo "Bye!"
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

