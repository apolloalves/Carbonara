#!/bin/bash

#####################################################################
#                                                                   #
# Script: Script for file balancing for BTRFS partitions.           #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 03/06/2023                                                  #
#                                                                   #
#####################################################################

#########################################################################################################################
# Descriptiom : This Bash script is used to balance BTRFS partitions. It features an interactive menu that allows       #
# the user to select                                                                                                    #
# the partitions they want to balance.                                                                                  #
#                                                                                                                       #
# Here is a step-by-step explanation of what the code does:                                                             #
#                                                                                                                       #
# Defines some variables, including a variable that stores the name of the menu.                                        #
# Prompts the user to respond if they want to balance the root ("/") volume.                                            #
# If the user enters "y" for the root volume, the script opens a GNOME terminal with the command "sudo btrfs balance    #
# start /", which starts balancing the root volume.                                                                     #
# If the user enters "n" for the root volume, the script will ask if they want to balance the "/home" volume.           #
# If the user types "y" for the "/home" volume, the script opens a GNOME terminal with the command "sudo btrfs balance  #
# start /home", which starts balancing the "/home" volume.                                                              #
# If the user enters "n" for the "/home" volume, the script will ask if they want to balance the                        #
# "/EXT@ST500LM012__CLONRAID/" volume.                                                                                  #
# If the user types "y" for the volume "/EXT@ST500LM012__CLONRAID/", the script opens a GNOME terminal with the         #
# command "sudo btrfs balance start /mnt/EXT@ST500LM012__CLONRAID/", which starts balancing the volume                  #
# "/ EXT@ST500LM012__CLONRAID/".                                                                                        #
# If the user enters "n" for the volume "/EXT@ST500LM012__CLONRAID/", the script will display a confirmation            #
# message and return to the main menu.                                                                                  #
# If the user enters an invalid command, the script will display an error message and return to the main menu.          #
# The script uses the "gnome-terminal" command to open GNOME terminals and start balancing the selected partitions.It's #
# important to note that this script was likely designed to run in a specific environment, as it references specific    #
# partitions and specific commands.                                                                                     #
# MENU='LinuxBashCare-2.0.1.sh'                                                                                             #
#                                                                                                                       #
#########################################################################################################################

YES="y"
NO="n"

echo
echo -n 'Do you want to balance the volume "/" (y/n)? '
read -r ROOTVOLUME

if [ "$YES" = "$ROOTVOLUME" ]; then

    echo -e "\033[01;32m Opening tab of btrfs balance root volume...\033[00;37m"
    sleep 1
    gnome-terminal --tab -- bash -c "time sudo btrfs balance start /; exec bash"
    echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

elif [ "$NO" = "$ROOTVOLUME" ]; then
    echo -n 'Do you want to balance the volume "/home" (y/n)? '
    read -r HOMEVOLUME

    if [ "$YES" = "$HOMEVOLUME" ]; then
        echo 'teste'
        gnome-terminal --tab -- bash -c "time sudo btrfs balance start /home; exec bash"
        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

    elif [ "$NO" = "$HOMEVOLUME" ]; then
        echo -n 'Do you want to balance the volume "/EXT@ST500LM012__CLONRAID/" (y/n)? '
        read -r CLONRAID

        if [ "$YES" = "$CLONRAID" ]; then

            gnome-terminal --tab -- bash -c "time sudo btrfs balance start /mnt/EXT@ST500LM012__CLONRAID/; exec bash"
            echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

        elif [ "$NO" = "$CLONRAID" ]; then
            echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
            $MENU

        fi
    fi
fi

if
    echo "${VALIDATE}"
then

    echo -e "command not found!\n"
    $MENU

fi
