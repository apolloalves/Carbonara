#!/bin/bash
source ~/.bashrc
. ~/.bashrc

#############################################
#                                           #
# Script: LinuxBashCare-10.11.23.sh         #
# Author : Apollo Alves                     #
# Date : 03/11/2023                         #
#############################################

################################################################################################################################
#                                                                                                                              #
# This code constitutes an interactive menu for a shell care and maintenance system, with a series of options available        #
# to users. The menu displays several numbered options, each corresponding to a specific task.                                 #
#                                                                                                                              #
# 1. The "Update all system packages" option updates all system packages.                                                      #
# 2. The option "Scan the system for traces of unused packages" scans the system for traces of unused packages.                #
# 3. The "Run both" option performs both the update and check for unused package tasks.                                        #
# 4. The option "Optimize system performance - (root user required)" optimizes system performance, requiring root permissions. #
# 5. The "Open STACER manager" option opens the STACER manager.                                                                #
# 6. The "Swap State" option handles the swap state.                                                                           #
# 7. The "Check system boot time" option checks the system boot time.                                                          #
# 8. The option "Boot messages wizard ( journalctl -b )" displays boot messages through journalctl.                            #
# 9. The option "Disable native services - ( root user required )" disables native services, requiring root permissions.       #
# 10. The "List of disabled services" option lists the disabled services.                                                      #
# 11. The "Mount External Disks" option handles mounting external disks.                                                       #
# 12. The "Check space disks" option checks disk space.                                                                        #
# 13. The "Eggs Wizard" option performs an egg-related function (possibly an internal reference or system-specific code).      #
# 14. The "Open CLONRAID backups" option opens CLONRAID backups.                                                               #
# 15. The "Manage packages with aptitude" option manages packages with aptitude.                                               #
# 16. The "Manage packages and drivers" option handles package and driver management.                                          #
# 17. The "Reinstall GNOME gdm3" option reinstalls GNOME gdm3.                                                                 #
# 18. The "mysql wizard" option performs functions related to MySQL.                                                           #
# 19. The option "Check if a new version of Ubuntu is available" checks if a new version of Ubuntu is available.               #
# 20. The "Reboot System" option restarts the system.                                                                          #
# 21. The "QUIT" option ends the program.                                                                                      #
#                                                                                                                              #
# Additionally, the code includes formatting functions to print text with background colors, as well as the function to        #
# clear the screen. The script also displays system information using the "neofetch" command and handles the logic to          #
# allow the user to select menu options. Each selected option runs a specific script related to the chosen task.               #
#                                                                                                                              #
#                                                                                                                              #
################################################################################################################################

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

options=(

    #1
    "Update all system packages"
    #2
    "Scan the system for traces of unused packages   "
    #3
    "Run both   "
    #4
    "Optimize system performance - ( root user required )   "
    #5
    "Open STACER manager    "
    #6
    "Swap State "
    #7
    "Check system boot time "
    #8
    "Boot messages wizard ( journalctl -b )  "
    #9
    "Disable services natives - ( root user required )    "
    #10
    "List of disabled services   "
    #11
    "Mount External Disks   "
    #12
    "Check space disks  "
    #13
    "Egss Wizard"
    #14
    "Open CLONRAID backups  "
    #15
    "Manage packages with aptitude  "
    #16
    "Manage packages and drivers    "
    #17
    "Reinstall GNOME gdm3   "
    #18
    "mysql wizard  "
    #19
    "Check if a new version of Ubuntu is available  "
    #20
    "Start Virtualbox services  "
    #21
    "Reboot System  "
    #22
    "QUIT   "

)
scripts=(
    "update__pack.sh"
    "remove__traces.sh"
    "update__system.sh; remove__system.sh"
    "optimize__performance.sh"
    "stacer__tools.sh"
    "swap__state.sh"
    "system__analyse.sh"
    "show__journalctl.sh"
    "disable__services.sh"
    "disabled__ListServices.sh"
    "ext__disk-2.1.sh"
    "check__space.sh"
    "eggs__wizard.sh"
    "clonraid__backups.sh"
    "apititude__manager.sh"
    "software-properties-gtk --open-tab=4"
    "reinstall__gnome-gdm3.sh"
    "mysql__fix-1.0.sh"
    "do-release-upgrade"
    "virtualbox_services.sh"
    "reboot__system.sh"
)
selected=0
# Função para imprimir texto com cor de fundo

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
    echo -e "\033[1;97;100m          LinuxBashCare           \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  10.11.23        \033[0m"
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
    "[")                      # Detecta sequência de seta (usada pelas teclas de seta)
        read -rsn2 -t 0.1 key # Lê o restante da sequência
        case "$key" in
        "A") # Seta para cima
            selected=$(((selected - 1 + ${#options[@]}) % ${#options[@]}))
            ;;
        "B") # Seta para baixo
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
for s in "${script_array[@]}"; do
    script_name=$(echo "$s" | xargs)  # Remover espaços extras
    if [ -f "${script_name}" ]; then
        bash "${script_name}"
    else
        echo -e "\nScript '${script_name}' not found!\n"
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
