#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
########################################################################################################################
#                                                                                                                      #
# Script: eggs__check.sh                                                                                               #
# Created: 16/12/2023                                                                                                   #
# Author: Apollo Alves                                                                                                 #
#                                                                                                                      #
########################################################################################################################                                                                                                                      #
# Description: This shell script, named "eggsCreate.sh," performs the following tasks:                                 #
########################################################################################################################                                                                                                                      #
#                                                                                                                      #
# 1. Set the FILEPATH and TARGETPATH variables for the source and destination ISO file paths, respectively.            #
# 2. Check the device and mount the specified mount point in $TARGETPATH.                                              #
# 3. Get the current date and store it in the $DATE variable.                                                          #
# 4. Check for .iso files in the /home/eggs directory.                                                                 #
# 5. If .iso files are found, display the list of files, rename the first file to "Ubuntu-22.0.4-LTS_current_date.iso,"#
#    and move it to $TARGETPATH.                                                                                       #
# 6. If no .iso files are found, display a message indicating that no files were found and open a new terminal to run  #
#    the command " eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename=_current_date."                     #
#                                                                                                                      #
# In summary, this script checks for .iso files in the /home/eggs directory. If found, it renames the first file and   #
# moves it to a specified destination. If no .iso files are found, it executes another specific command. It is         #
# important to note that the script contains commands requiring superuser () privileges.                           #
#                                                                                                                      #
########################################################################################################################


FILEPATH="/home/eggs/*.iso"
TARGETPATH="/mnt/VENTOY"
CLONRAID="/mnt/EXTST500LM012__CLONRAID/UBUNTU_EGGS/"
LINE_SCRIPT='line_script.sh'

echo -e "\nChecking devices..."
sleep 2
mount /dev/sdc1 $TARGETPATH
mount /dev/sdc3 /mnt/EXTST500LM012__CLONRAID/

DATE=$(date +"%Y-%m-%d")
arquivo="/home/eggs/*.iso"

while true; do

     length=$(find /home/eggs -maxdepth 1 -name "*.iso" | wc -l)

     if [ "$length" -gt 0 ]; then

          echo ".iso file(s) found in: "
          echo
          find /home/eggs -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

          echo -e "\nwait...\n"
          echo -e "Moving file to $TARGETPATH ...\n"
          mv -v /home/eggs/*.iso /home/eggs/Ubuntu-22.0.4-LTS_$DATE.iso

          echo -e "\n\033[01;05;37mRenamed your iso file to : 'Ubuntu-22.0.4-LTS_$DATE.iso'!\033[00;37m\n"
          echo -e "\npreparing to move...\n"
          sleep 1
          time mv -v /home/eggs/*.iso /mnt/VENTOY
          echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

          echo "creating a backup for : '$CLONRAID'"
          rsync -avh --progress $TARGETPATH/Ubuntu-22.0.4-LTS_$DATE.iso $CLONRAID
          gnome-terminal --tab -- bash -c "watch df -h /mnt/EXTST500LM012__CLONRAID/"

          echo "Opening Google Drive..."
          brave-browser --profile-directory=Default --app-id=aghbiahbpaijignceidepookljebhfak
          echo -e "\n\033[01;05;37mupload the file : 'Ubuntu-22.0.4-LTS_$DATE.iso' to Google Drive now!!\033[00;37m\n"
          $LINE_SCRIPT
          break

     else
          echo -e "\nWait...\n"
          sleep 2
          echo -e "No .iso file found in /home/eggs/"
          break
     fi
done
