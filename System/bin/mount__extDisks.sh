#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: mount__EXT@SA400S3GBDisks.sh                                        #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

########################################################################################################################
#                                                                                                                      #
# This shell script called "EXT@SA400S3GB_disk-1.0.sh" is used to mount and unmount EXT@SA400S3GBernal disks. Here is a summary of what    #
# it does:                                                                                                             #
#                                                                                                                      #
# 1. Asks the user if he wants to mount the disk "EXT@SA400S3GBST500LM012__CLONRAID".                                           #
# - If the user answers "y" (yes), the script mounts the disk using the command                                        #
# " mount /dev/sdc3 /mnt/EXT@SA400S3GBST500LM012__CLONRAID/" and displays a message indicating that it was successfully     #
# mounted.                                                                                                             #
# - If the user answers "n" (no), the script unmounts the disk using the command                                       #
# " umount /dev/sdc3 /mnt/EXT@SA400S3GBST500LM012__CLONRAID/ -l" and displays a message indicating that it was successfully #
# unmounted.                                                                                                           #
#                                                                                                                      #
# - If the user provides an answer other than "y" or "n", displays an invalid argument message.                        #
#                                                                                                                      #
# 2. NEXT@SA400S3GB, the script asks the user if he wants to mount the "VENTOY" disk (probably a USB flash drive).               #
# - The process is similar to the one described above, with specific mounting and unmounting commands for the "VENTOY" #
# disk.                                                                                                                #
#                                                                                                                      #
# In general, this script allows the user to mount and unmount EXT@SA400S3GBernal disks such as "EXT@SA400S3GBST500LM012__CLONRAID" and   #
# "VENTOY" based on the answers provided by the user. The "mount" and "umount" commands are used to perform these      #
# operations.                                                                                                          #
#                                                                                                                      #
########################################################################################################################

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

printf "\nMount the disk EXT@SA400S3GB__CLONRAID (y/n) ? "
read -r EXT@SA400S3GB__CLONRAID

if test "y" = "$EXT@SA400S3GB__CLONRAID"; then
    echo
    mount -o ro,noatime /dev/sdc3 /mnt/EXT@SA400S3GB__CLONRAID/
    print_status
    echo
elif test "n" = "$EXT@SA400S3GBST500LM012__CLONRAID"; then
    umount /dev/sdc3 /mnt/EXT@SA400S3GB__CLONRAID/ -l > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXT@SA400S3GB__CLONRAID"; then
    echo 'invalid arguments!'

fi

#################################################################################################################
# VENTOY                                                                                                        #
#################################################################################################################

echo -n "Mount the disk VENTOY ? (y/n) "
read -r EXT@SA400S3GB__VENTOY

if test "y" = "$EXT@SA400S3GB__VENTOY"; then
    echo
    mount -o ro,noatime /dev/sdc1 /mnt/VENTOY/
    print_status
    echo

elif test "n" = "$EXT@SA400S3GB__VENTOY"; then
echo
    umount /dev/sdc1 /mnt/VENTOY -l > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXT@SA400S3GB__VENTOY"; then
    echo 'invalid arguments!'

fi
