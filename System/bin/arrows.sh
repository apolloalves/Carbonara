#!/bin/bash

options=("Update all system packages"
    "Remove traces of unused packages from the system"
    "Run both"
    "Optimize system performance - ( root user required )"
    "Remove unwanted packages of system - ( root user required )"
    "Disable services natives"
    "Remove unused PPA on system - ( root user required )"
    "Verify Startup time System"
    "Swap State"
    "Open my Penguin's Eggs Files - broot file manager"
    "Check space disks"
    "Open STACER"
    "Mount External Disks"
    "Create Penguin's Eggs"
    "Replays all of your boot messages 'journalctl -b'"
    "Open CLONRAID backups"
    "Reinstall GNOME gdm3"
    "Start mysql assistent"
    "Check if a new version of Ubuntu is available"
    "Manage packages with aptitude"
    "Manage packages and drivers"
    "Show disable services list"
    "Reboot System"
    "QUIT")
selected=0

# Função para imprimir texto com cor de fundo
print_with_bg_color() {
    local text="$1"
    local color_code="$2"
    echo -e "\033[48;5;${color_code}m${text}\033[m"
}

NEOFETCH='neofetch'
neofetch_output=$($NEOFETCH)

clear_screen() {
    printf "\033c"
}

while true; do
    clear_screen

    ######################################################################################################################################################################################
    LINE='line.sh'
    echo
    echo -e "\033[1;32;02;40;100m         ShellCare System          \033[0m\033[\033[1;40;02;32;107m          Apollo Alves        \033[1;32;02;40;100m     version  22.0.1     \033[0m"
    ######################################################################################################################################################################################
    echo
    echo -e "$neofetch_output"
    $LINE
    echo -e "\033[1;40;02;32;107m   Select an option from the menu   \033[0m"
    $LINE

    for i in "${!options[@]}"; do
        option_number=$((i + 1))
        if [ $i -eq $selected ]; then
            print_with_bg_color "> [$option_number] ${options[$i]}" 4
        else
            echo "  [$option_number] ${options[$i]}"

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
            echo "Saindo do programa..."
            sleep 1
            break
        else
            clear_screen
            echo "Option selected: ${options[$selected]}"
            sleep 1

            option_choice=$((selected + 1)) # Convert to option number
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
            q)
                echo
                sleep 1
                echo "Exiting the program..."
                echo "Bye!"
                clear_screen
                exit 0
                ;;
            *)
                echo -e "\nInvalid input!\n"
                ;;
            esac

            read -rsn1 -p "Press any key to continue..."
        fi
        ;;
    *)
        echo -e "\nInvalid input!\n"
        ;;

    esac
done
$LINE
