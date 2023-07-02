#!/bin/bash

#####################################################################
#                                                                   #
# Script: For updates packages of system and optimizer performance. #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################


#remove old snaps
echo -e "\nRemoving open recents files...\n"
sleep 2 
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
echo -e "\033[01;05;37mOLD SNAPS HAS BEEN REMOVED!!\033[00;37m\n"



