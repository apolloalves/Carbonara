#!/bin/bash

#####################################################################
#                                                                   #
# Script: rubbish__bin.sh                                           #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

#######################################################################
#                                                                     #
# Rubbish Bin Script                                                  #
# This script is designed to be run with root privileges and removes  #
# rubbish bin files and clears recently-used.xbel in the home         #
# directory. It utilizes commands to remove specific files related to #
# the rubbish bin and close any active Nautilus instances.            #
#                                                                     #
#######################################################################

sudo rm -rfv  /home/*/.local/share/recently-used.xbel
#Trash-cli - is no longer supported
#sudo trash-empty --all -f

sudo rm -rf ~/.local/share/Trash/*i


nautilus --quit

echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"



