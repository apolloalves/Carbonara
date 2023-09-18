#! /bin/bash
#####################################################################
#                                                                   #
# Script: showbroot__eggs.sh                                      #
# 
# Author: Apollo Alves                                              #
# Date: 18/19/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
#                                                                                                                   #
# This script is responsible for opening the backup directory located at: /mnt/VENTOY which contains the list of     #
# Penguin's Eggs Files .isos files using broot as a file manager.                                                    #
#                                                                                                                   #
#####################################################################################################################

TARGETPATH="/mnt/VENTOY"

echo "Checking device..."
sleep 2
sudo mount /dev/sdc1 $TARGETPATH
echo -e "\nOpening broot...\n"
gnome-terminal --tab -- bash -c "sudo broot -s -p -d --sort-by-date '/mnt/VENTOY/' ; exec bash"
sleep 1 TARGETPATH="/mnt/VENTOY"
echo "Checking device..."
sleep 2
sudo mount /dev/sdc1 $TARGETPATH
echo -e "\nOpening broot...\n"
gnome-terminal --tab -- bash -c "sudo broot -s -p -d --sort-by-date '/mnt/VENTOY/' ; exec bash"
sleep 1
