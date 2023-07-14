#!/bin/bash

#####################################################################
#                                                                   #
# Script: remove__oldsnaps.sh                                       #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

echo -e "\n\033[01;32mRemoving old snaps of system...\033[00;37m\n"
sleep 2 
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"



