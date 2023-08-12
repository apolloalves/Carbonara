#!/bin/bash

#####################################################################
#                                                                   #
# Script: checkSpace.sh                                             #
# Author: Apollo Alves                                              #
# Date: 14/07/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
#                                                                                                                   #
# Description: This shell script called "checkSpace.sh" performs some disk space checks. Here is a summary of what  # 
# it does:                                                                                                          #
# 1. Displays a space check message.                                                                                #
# 2. Wait 1 second.                                                                                                 #
# 3. Run the commands "df -h /", "df -h /home" and "df -h /mnt/EXT@ST500LM012__CLONRAID" to display disk space      #
# information in the root, /home and /mnt/EXT@ directories ST500LM012__CLONRAID, respectively.                      #
# 4. Displays a message indicating that the verification completed successfully.                                    #
#                                                                                                                   #
# Basically, this script prints information about available disk space in the mentioned directories. It can be used #
# to monitor disk space and verify that enough space is available.                                                  #
#                                                                                                                   #
#####################################################################################################################

LINE='line.sh'
echo -e "\nChecking spaces...\n"                                      
sleep 2
df -h / && echo "" && df -h /home && echo "" && df -h /mnt/EXT@ST500LM012__CLONRAID
echo ""
$LINE
sleep 10
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
