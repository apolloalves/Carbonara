#!/bin/bash
# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root." 
    exit 1
fi

#####################################################################
#                                                                   #
# Script: Script : .  #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 02/07/2023                                                  #
#                                                                   #
#####################################################################

########################################################################################################################
#                                                                                                                      #
# This shell script called "ext_disk-1.0.sh" is used to mount and unmount external disks. Here is a summary of what    #
# it does:                                                                                                             #
#                                                                                                                      #
# 1. Asks the user if he wants to mount the disk "EXTST500LM012__CLONRAID".                                           #
# - If the user answers "y" (yes), the script mounts the disk using the command                                        #
# "sudo mount /dev/sdc3 /mnt/EXTST500LM012__CLONRAID/" and displays a message indicating that it was successfully     #
# mounted.                                                                                                             #
# - If the user answers "n" (no), the script unmounts the disk using the command                                       #
# "sudo umount /dev/sdc3 /mnt/EXTST500LM012__CLONRAID/ -l" and displays a message indicating that it was successfully #
# unmounted.                                                                                                           #
#                                                                                                                      #
# - If the user provides an answer other than "y" or "n", displays an invalid argument message.                        #
#                                                                                                                      #
# 2. Next, the script asks the user if he wants to mount the "VENTOY" disk (probably a USB flash drive).               #
# - The process is similar to the one described above, with specific mounting and unmounting commands for the "VENTOY" #
# disk.                                                                                                                #
#                                                                                                                      #
# In general, this script allows the user to mount and unmount external disks such as "EXTST500LM012__CLONRAID" and   #
# "VENTOY" based on the answers provided by the user. The "mount" and "umount" commands are used to perform these      #
# operations.                                                                                                          #
#                                                                                                                      #
########################################################################################################################

echo -n "Mount the disk EXTST500LM012__CLONRAID ? (y/n) "
read -r EXTST500LM012__CLONRAID

if test "y" = "$EXTST500LM012__CLONRAID"

    then 
    sudo mount -o ro,noatime /dev/sdc3 /mnt/EXTST500LM012__CLONRAID/ > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__CLONRAID"
    
    then
        
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__CLONRAID"
    then
    echo 'invalid arguments!'

fi

#################################################################################################################
# VENTOY                                                                                                        #
#################################################################################################################

echo -n "Mount the disk VENTOY ? (y/n) "
read -r EXTST500LM012__VENTOY

if test "y" = "$EXTST500LM012__VENTOY"

    then 
    sudo mount -o ro,noatime /dev/sdc1 /mnt/VENTOY > /dev/null 2>&1
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__VENTOY"
    
    then
    sudo umount /dev/sdc1 /mnt/VENTOY -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__VENTOY"
    then
    echo 'invalid arguments!'

fi