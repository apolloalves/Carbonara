#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
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
# 1. Set the FILEPATH and MDSATA variables for the source and destination ISO file paths, respectively.            #
# 2. Check the device and mount the specified mount point in $MDSATA.                                              #
# 3. Get the current date and store it in the  variable.                                                          #
# 4. Check for .iso files in the /home/eggs directory.                                                                 #
# 5. If .iso files are found, display the list of files, rename the first file to "ARCHLINUX_current_date.iso,"#
#    and move it to $MDSATA.                                                                                       #
# 6. If no .iso files are found, display a message indicating that no files were found and open a new terminal to run  #
#    the command " eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename=_current_date."                     #
#                                                                                                                      #
# In summary, this script checks for .iso files in the /home/eggs directory. If found, it renames the first file and   #
# moves it to a specified destination. If no .iso files are found, it executes another specific command. It is         #
# important to note that the script contains commands requiring superuser () privileges.                           #
#                                                                                                                      #
########################################################################################################################

FILEPATH="/home/eggs"
MDSATA="/mnt/MDSATA/ArchlinuxEggs"
LINE_SCRIPT='/bin/line_script.sh'

# Check and mount devices
echo -e "\nChecking devices..."
sleep 2

if ! mountpoint -q $MDSATA; then
    mount /dev/sdc1 $MDSATA || {
        echo "Failed to mount $MDSATA"
        exit 1
    }
fi

if ! mountpoint -q $MDSATA; then
    mount /dev/sdc3 $MDSATA || {
        echo "Failed to mount $MDSATA"
        exit 1
    }
fi

DATE=$(date +"%Y-%m-%d")

while true; do

    length=$(find /home/eggs -maxdepth 1 -name "*.iso" | wc -l)

    if [ "$length" -gt 0 ]; then

        echo ".iso file(s) found in: "
        echo
        find /home/eggs -maxdepth 1 -name "*.iso" -exec echo "- {}" \;

        echo -e "\nwait...\n"
        echo -e "\n\033[01;05;37mRenamed your iso file to : 'ARCHLINUX_$DATE.iso'!\033[00;37m\n"
        echo -e "Moving file to $MDSATA ...\n"
        mv -v /home/eggs/*.iso /home/eggs/ARCHLINUX_$DATE.iso
        sleep 1
        time mv -v $FILEPATH/*.iso $MDSATA
        echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

        echo -e "\ncreating a backup for : '$MDSATA'"
        watch df -h $MDSATA
        rsync -avh --progress $MDSATA/ARCHLINUX_$DATE.iso $MDSATA

        echo -e "\n\033[01;05;37mupload the file : 'ARCHLINUX_$DATE.iso' to Google Drive now!!\033[00;37m\n"
        $LINE_SCRIPT
        break

    else
        echo -e "\nNo .iso file found in $FILEPATH. Generating new .iso file...\n"
        eggs produce --clone --prefix=ARCHLINUX --basename=_$DATE
        break
    fi
done
