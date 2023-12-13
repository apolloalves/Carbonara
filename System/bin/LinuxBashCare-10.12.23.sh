#!/bin/bash

#############################################
#                                           #
# Script: /bin/LinuxBashCare-10.12.23.sh    #
# Author : Apollo Alves                     #
# Date : 10/12/2023                         #
#############################################

##################################################################################################################
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
# Removed from list option
######################################################################################################################################################################################

# "Remove unwanted packages of system - ( root user required )    "
# sudo su -c "bash /bin/unwanted__pack.sh"

# "Remove unused PPA on system - ( root user required )   "
# sudo su -c "bash /bin/remove__unused_ppa.sh"
######################################################################################################################################################################################
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo"
    exit 1
fi

source /bin/menu.sh
source /bin/scripts.sh

selected=0
# Function to print text with background color

print_with_bg_color() {
    local text="$1"
    echo -e "\033[1;30;107m${text}\033[m"
}

NEOFETCH='neofetch --ascii_colors 8 7 --colors 7'
neofetch_output=$($NEOFETCH)

PLOT="$HOME/plot/Disable-ServicesList.log"

clear_screen() {

    printf "\033c"
}

while true; do
    clear_screen

    ######################################################################################################################################################################################
    LINE='line.sh'
    echo
    echo -e "\033[1;97;100m          LinuxBashCare           \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  10.12.23        \033[0m"
    ######################################################################################################################################################################################
    echo
    echo -e "$neofetch_output"
    $LINE
    echo -e "Select an option from the menu: \033[01;97m ${options[$selected]}"

    $LINE
    echo

    for i in "${!options[@]}"; do
        option_number=$((i + 1))
        formatted_number=$(printf "%02d" "$option_number") # Formata o número com dois dígitos
        if [ $i -eq $selected ]; then
            print_with_bg_color "[ $formatted_number ] - ${options[$i]}" 4
        else
            echo -e "\033[01;32m[\033[01;97m $formatted_number\033[01;32m ]\033[00;37m - ${options[$i]}"
        fi
    done

    read -rsn1 key

    case "$key" in
    "[")                      # Detect arrow sequence (used by arrow keys)
        read -rsn2 -t 0.1 key # Lê o restante da sequência
        case "$key" in
        "A") # Up arrow
            selected=$(((selected - 1 + ${#options[@]}) % ${#options[@]}))
            ;;
        "B") # Up down
            selected=$(((selected + 1) % ${#options[@]}))
            ;;
        esac
        ;;
    [1-9])
        if [ "$key" -ge 1 ] && [ "$key" -le ${#options[@]} ]; then
            selected=$((key - 1))
        else
            echo -e "\nInvalid input!\n"
        fi
        ;;
    "")
        if [ $selected -eq $((${#options[@]} - 1)) ]; then
            clear_screen
            echo "Exiting the program..."
            sleep 1
            echo "Bye!"
            exit 0
        else
            clear_screen
            $LINE
            echo -e "Option selected: \033[01;97m ${options[$selected]}"
            $LINE
            sleep 2

  option_choice=$((selected + 1)) # Convert to option number
if [ $option_choice -ge 1 ] && [ $option_choice -le ${#options[@]} ]; then
    script_index=$((option_choice - 1))
    script=${scripts[$script_index]}

    IFS=';' read -ra script_array <<< "$script"

    for sub_script in "${script_array[@]}"; do
        # Remover espaços em branco
        sub_script=$(echo "$sub_script" | tr -d ' ')

        sub_script_path="/bin/${sub_script}"

        if [ -f "$sub_script_path" ]; then
            bash "$sub_script_path"
            exit 1
        else
            echo -e "\nScript '$sub_script_path' not found!\n"
            exit 1  # Sair com código de erro se um script não for encontrado
        fi
    done

else
    echo -e "\nInvalid input!\n"
fi

read -rsn1 -p "Press any key to continue..."

        fi
        ;;
    esac
done
