#!/bin/bash

#####################################################################
#                                                                   #
# Script: fix__packages-7.0.sh For updates packages of system and   #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

FILEPATH="/home/eggs/*.iso"
TARGETPATH="/mnt/VENTOY"
LINE='line.sh'

echo "Checking device..."
sleep 2
sudo mount /dev/sdc1 $TARGETPATH

     DATE=$(date +"%Y-%m-%d")
     arquivo="/home/eggs/*.iso"

     while true; do

          length=$(find /home/eggs -maxdepth 1 -name "*.iso" | wc -l)

          if [ "$length" -gt 0 ]; then

               echo ".iso file(s) found in: "
               echo 
               find /home/eggs -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

               # echo -e "\nRenomeando o arquivo iso..\n"
               sudo mv -v /home/eggs/*.iso /home/eggs/Ubuntu-22.0.4-LTS_$DATE.iso

               echo Renaming your iso file to : "Ubuntu-22.0.4-LTS_$DATE.iso"
               echo "Preparing to move..."
               sleep 1
               echo -e "Moving file to $TARGETPATH ...\n"
               sudo time mv -v /home/eggs/*.iso /mnt/VENTOY

               echo -e "\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
               $LINE
               break

          else
               echo -e "\nWait...\n"
               sleep 2
               echo -e "No .iso file found in /home/eggs/"
               sleep 2
               echo -e "\nOpening new tab exclusive for Eggs...\n"
               sleep 1
               gnome-terminal --tab -- bash -c "sudo eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename=_$DATE"
               echo -e '\033[01;06;37mThe new tab is open!\033[00;37m'
               break
          fi
     done
