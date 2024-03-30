#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi

#####################################################################
#                                                                   #
# Script: eggs_create.sh                                            #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#####################################################################

FILEPATH="/home/eggs"
TARGETPATH="/mnt/VENTOY"
CLONRAID="/mnt/EXT@SA400S3GB__CLONRAID/UBUNTU_EGGS/"
LINE_SCRIPT='line_script.sh'

# Check and mount devices
echo -e "\nChecking devices..."
sleep 2

if ! mountpoint -q $TARGETPATH; then
    mount /dev/sdc1 $TARGETPATH || { echo "Failed to mount $TARGETPATH"; exit 1; }
fi

if ! mountpoint -q $CLONRAID; then
    mount /dev/sdc3 $CLONRAID || { echo "Failed to mount $CLONRAID"; exit 1; }
fi

DATE=$(date +"%Y-%m-%d")
ISO_FILES=$(\ $FILEPATH -maxdepth 1 -name "*.iso")

if [[ $(echo $ISO_FILES | wc -w) -gt 0 ]]; then
    FIRST_ISO=$(echo $ISO_FILES | cut -d' ' -f1)
    RENAMED_ISO="$FILEPATH/Ubuntu-22.04-LTS_$DATE.iso"
    
    echo ".iso file(s) found in $FILEPATH: "
    echo $ISO_FILES | tr ' ' '\n' | nl
    
    # Rename and move the first .iso found
    echo -e "\nRenaming and moving the first .iso file to $TARGETPATH ..."
    mv "$FIRST_ISO" "$RENAMED_ISO"
    mv "$RENAMED_ISO" "$TARGETPATH"
    
    echo -e "File moved and renamed to $TARGETPATH/Ubuntu-22.04-LTS_$DATE.iso"
    
    # Backup the moved file
    echo "Creating a backup for: '$CLONRAID'"
    rsync -avh --progress "$TARGETPATH/Ubuntu-22.04-LTS_$DATE.iso" "$CLONRAID"
    
    # Optional: Open Google Drive in browser
    # Replace 'brave-browser' with your browser if different
    brave-browser "https://drive.google.com" &
else
    echo "No .iso file found in $FILEPATH. Generating new .iso file..."
    gnome-terminal -- bash -c "eggs produce --clone --prefix=Ubuntu-22.04.2-LTS --basename=_$DATE"
fi

# Execute additional script if needed
if [[ -f $LINE_SCRIPT ]]; then
    ./$LINE_SCRIPT
else
    echo "Script $LINE_SCRIPT not found."
fi
