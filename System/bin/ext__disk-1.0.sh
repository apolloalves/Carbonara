#!/bin/bash

#####################################################################
#                                                                   #
# Script: Script : ext__disk-1.0.sh for file mount external disks.  #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 02/07/2023                                                  #
#                                                                   #
#####################################################################

##################################################################################################################
#                                                                                                                #
# This bash script is used to mount or unmount two hard drives:                                                  #
# "EXT@ST500LM012__STORAGE" and "EXT@ST500LM012__CLONRAID".                                                      #
# Let's analyze what each part of the code does: The script starts by                                            #
# displaying a message for the user to choose whether to mount or unmount                                        #
# the disk "EXT@ST500LM012__STORAGE":                                                                            #
#                                                                                                                #
# The script starts by displaying a message for the user to choose if                                            #
# you want to assemble or disassemble the disk "ext@st500lm012__storage":                                        #
#                                                                                                                #
# echo -n "Montar o disco EXT@ST500LM012__STORAGE ? (y/n) "                                                      #
# read -r EXTST500LM012__STORAGE                                                                                 #
#                                                                                                                #
# The user response is stored in the Extst500LM012__storage variable.                                            #
#                                                                                                                #
# 1. Then the script checks the response provided by the user to decide what to do:                              #
# bash                                                                                                           #
#                                                                                                                #
# if test "y" = "$EXTST500LM012__STORAGE"                                                                        #
#                                                                                                                #
# If the answer is "y", the script executes the following command to set up the disc "/dev/sdc4"                 #
# in the "/mnt/ext@st500lm012__storage/": ":                                                                     #
#                                                                                                                #
# sudo mount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/                                                             #
#                                                                                                                #
# In addition, it displays a message indicating that the operation has been successfully completed.              #
#                                                                                                                #
# If the answer is not "y" in the previous step, the script checks if it is "n" to dismantle the disc:           #
#                                                                                                                #
# elif test "n" = "$EXTST500LM012__STORAGE"                                                                      #
#                                                                                                                #
# In this case, the script executes the following command to disassemble the directory disk                      #
# "/mnt/ext@st500lm012__storage/":                                                                               #
#                                                                                                                #
# sudo umount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/ -l                                                         #
#                                                                                                                #
# It also displays a message indicating that the operation has been successfully completed.                      #
#                                                                                                                #
# 2 - If the answer is neither "y" nor "n" in the previous steps, the message "Inralid Arguments!" Is displayed. #
# This same structure is repeated for the disc "ext@st500lm012__clonraid" in the second part of the script.      #
#                                                                                                                #
# In short, the script allows the user to assemble or dismantle rigid discs "ext@st500lm012__storage" and        #
# "ext@st500lm012__clonraid" based on their "y" or "n" answers.                                                  #
#                                                                                                                #
##################################################################################################################
# EXT@ST500LM012_S                                                                                               #
 #################################################################################################################

echo -n "Montar o disco EXT@ST500LM012__STORAGE ? (y/n) "
read -r EXTST500LM012__STORAGE

if test "y" = "$EXTST500LM012__STORAGE"

    then 
    sudo mount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__STORAGE"
    
    then
    sudo umount /dev/sdc4 /mnt/EXT@ST500LM012__STORAGE/ -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__STORAGE"
    then
    echo 'invalid arguments!'

fi

#################################################################################################################
# EXT@ST500LM012_R                                                                                              #
#################################################################################################################

echo -n "Montar o disco EXT@ST500LM012__CLONRAID ? (y/n) "
read -r EXTST500LM012__CLONRAID

if test "y" = "$EXTST500LM012__CLONRAID"

    then 
    sudo mount /dev/sdc3 /mnt/EXT@ST500LM012__CLONRAID/
    echo -e '\n\033[00;37m[\033[00;32m OK!\033[00;37m ]\033m\n'

elif test "n" = "$EXTST500LM012__CLONRAID"
    
    then
    sudo umount /dev/sdc3 /mnt/EXT@ST500LM012__CLONRAID/ -l
    echo -e '\n\033[00;37m[\033[00;32m OFF!\033[00;37m ]\033m\n'

elif test "y" || "n" != "$EXTST500LM012__CLONRAID"
    then
    echo 'invalid arguments!'

fi