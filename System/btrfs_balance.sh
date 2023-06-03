    #!/bin/bash

    #####################################################################
    #                                                                   #
    # Script: Script for file balancing for BTRFS partitions.           #
    #                                                                   #
    # Author: Apollo Alves                                              #
    # Date: 03/06/2023                                                  #
    #                                                                   #
    #####################################################################


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
    echo -n 'Do you want to balance the volume "/EXT@ST500LM012__STORAGE/" (y/n)? '
    read -r STORAGE

    if [ "$YES" = "$STORAGE" ]; then
    
        gnome-terminal --tab -- bash -c "time sudo btrfs balance start mnt/EXT@ST500LM012__STORAGE/; exec bash"
        echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
    
    elif [ "$NO" = "$STORAGE" ]; then
    
    echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
    shellCare-1.2.sh
    
            fi
        fi
    fi
fi

 echo "${VALIDATE}"
        echo -e "The arguments are invalids!\n"
        shellCare-1.2.sh
