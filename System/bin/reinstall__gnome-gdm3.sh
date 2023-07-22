#!/bin/bash

#####################################################################
#                                                                   #
# Script: checkSpace                                                #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 14/07/2023                                                  #
#                                                                   #
#####################################################################

#####################################################################################################################
#                                                                                                                   #
# Description : This shell script named "checkSpace.sh" performs the following actions:                             #
#                                                                                                                   #
# 1. Displays a message that gdm3 is being reinstalled.                                                             #
# 2. Wait 2 seconds.                                                                                                #
# 3. Use the command "sudo apt install gdm3 -y" to reinstall the gdm3 package. The "-y" parameter is used to        #
# automatically confirm installation questions.                                                                     #
# 4. Displays a message indicating that the reinstallation completed successfully.                                  #
#                                                                                                                   #
# In short, the script reinstalls the gdm3 package using the apt package manager. gdm3 is a display manager used on #
# Linux systems, and this reinstallation can be useful to optimize performance or fix problems related to gdm3 if   #
# necessary.                                                                                                        #
#                                                                                                                   #
#####################################################################################################################
# Check if the user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run as root." 
   exit 1
fi

echo -e "\n\033[01;32mReinstalling gdm3...\033[00;37m\n"
sleep 2
sudo apt install gdm3 -y
echo -e "\033[01;37m[\033[00;32m all done!\033[01;37m ]\033m\n"