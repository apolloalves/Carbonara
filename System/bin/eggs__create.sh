#!/bin/bash

########################################################################################################################
#                                                                                                                      #
# Script : eggsCreate.sh                                                                                               #
# Create : 14/04/2023                                                                                                  #
# Author : Apollo Alves                                                                                                #
#                                                                                                                      #
# Description : This is a shell script called "eggsCreate.sh". Here is an overview of what the script does:            #
#                                                                                                                      #
# 1. Set the FILEPATH and TARGETPATH variables to the source and destination ISO file paths, respectively.             #
# 2. Checks the device and mounts the mount point specified in $TARGETPATH.                                            #
# 3. Gets the current date and stores it in the $DATE variable.                                                        #
# 4. Checks for .iso files in the /home/eggs directory.                                                                #
# 5. If there are .iso files, displays the files found, renames the first file to "Ubuntu-22.0.4-LTS_current_data.iso" #
# and                                                                                                                  #
# moves it to $TARGETPATH.                                                                                             #
# 6. If there are no .iso files, displays a message that no files were found and opens a new terminal to run a command #
# called "sudo eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename= _current date".                            #
#                                                                                                                      #
# In short, this script checks for .iso files in the /home/eggs directory. If so, it renames the first file found and  #
# moves it to a specified destination. If there are no .iso files, execute another specific command. It is important   #
# to mention that the script contains some commands that require superuser (sudo) privileges.                          #
#                                                                                                                      #
########################################################################################################################

FILEPATH="/home/eggs/*.iso"
TARGETPATH="/mnt/VENTOY"
CLONRAID="/mnt/EXT@ST500LM012__CLONRAID/UBUNTU_EGGS/"
LINE='line.sh'

echo -e "\nChecking devices..."
sleep 2
sudo mount /dev/sdc1 $TARGETPATH
sudo mount /dev/sdc3 /mnt/EXT@ST500LM012__CLONRAID/

     DATE=$(date +"%Y-%m-%d")
     arquivo="/home/eggs/*.iso"

     while true; do

          length=$(find /home/eggs -maxdepth 1 -name "*.iso" | wc -l)

          if [ "$length" -gt 0 ]; then

               echo ".iso file(s) found in: "
               echo 
               find /home/eggs -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

               sudo mv -v /home/eggs/*.iso /home/eggs/Ubuntu-22.0.4-LTS_$DATE.iso
               echo -e "\n\033[01;05;37mRenamed your iso file to : 'Ubuntu-22.0.4-LTS_$DATE.iso'!\033[00;37m\n"
               echo -e "\npreparing to move...\n"
               sleep 1
               echo -e "Moving file to $TARGETPATH ...\n"
               sudo time mv -v /home/eggs/*.iso /mnt/VENTOY
               echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
               echo "creating a backup for : '$CLONRAID'"
               echo -e "\nwait...\n"

               sudo rsync -avh --progress $TARGETPATH/Ubuntu-22.0.4-LTS_$DATE.iso $CLONRAID
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
