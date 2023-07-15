#!/bin/bash

#####################################################################
#                                                                   #
# Script: removepack.sh                                             #
# Author: Apollo Alves                                              #
# Date: 14/07/2023                                                  #
#                                                                   #
#####################################################################

########################################################################################################################
#                                                                                                                      #
# This shell script called "removepack.sh" presents a menu for cleaning up packages from the system. Here is a summary #
# of what it does:                                                                                                     #
#                                                                                                                      #
# 1. Define some variables, like MENU and REMOVEPACK, which are the names of other shell scripts.                      #
#                                                                                                                      #
# 2. Asks the user if he wants to clean up system packages.                                                            #
# - The user can answer "y" (yes) or "n" (no).                                                                         #
#                                                                                                                      #
# 3. If the user answers "y", the script executes the "$REMOVEPACK" script, which is responsible for cleaning up the   #
# system packages.                                                                                                     #
#                                                                                                                      #
# 4. If the user answers "n", the script displays the message "skipped!" and runs the "$MENU" script, which is         #
# probably a main menu or next step.                                                                                   #
#                                                                                                                      #
# 5. If the user provides an answer other than "y" or "n", the script displays an invalid input message and returns    #
# to the "$MENU" menu.                                                                                                 #
#                                                                                                                      #
# In short, this script presents a menu for cleaning up system packages and runs the cleanup script only if the        #
# user chooses to do so. Otherwise, it skips cleaning and proceeds to the next step in the menu.                       #
#                                                                                                                      #
########################################################################################################################


MENU='shellCare-22.0.1.sh'
REMOVEPACK='remove.sh'

YES="y"
NO="n"

    echo
    echo -n 'Do you want to clean system packages (y/n) ? '
    read -r removepack

if [ "$removepack" = "$YES" ]; then 
        
    $REMOVEPACK
    
fi
if [ "$removepack" = "$NO" ]; then 

    echo "skipped!"
    $MENU

    elif [ "$removepack" != "$YES" ] && [ "$removepack" != "$NO" ]; then

    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2

    $MENU

fi