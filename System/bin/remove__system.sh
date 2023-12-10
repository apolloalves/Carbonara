#!/bin/bash

#####################################################################
#                                                                   #
# Script: REMOVETRACES.sh                                             #
# Author: Apollo Alves                                              #
# Date: 14/07/2023                                                  #
#                                                                   #
#####################################################################

########################################################################################################################
#                                                                                                                      #
# This shell script called "REMOVETRACES.sh" presents a menu for cleaning up packages from the system. Here is a summary #
# of what it does:                                                                                                     #
#                                                                                                                      #
# 1. Define some variables, like MENU and REMOVETRACES, which are the names of other shell scripts.                      #
#                                                                                                                      #
# 2. Asks the user if he wants to clean up system packages.                                                            #
# - The user can answer "y" (yes) or "n" (no).                                                                         #
#                                                                                                                      #
# 3. If the user answers "y", the script executes the "$REMOVETRACES" script, which is responsible for cleaning up the   #
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


MENU='LinuxBashCare-10.12.23.sh'
REMOVETRACES='remove__traces.sh'

YES="y"
NO="n"

    echo
    echo -n 'Do you want to clean system packages (y/n) ? '
    read -r removetraces

if [ "$removetraces" = "$YES" ]; then 
        
    $REMOVETRACES
    
fi
if [ "$removetraces" = "$NO" ]; then 

    echo "skipped!"
    $MENU

    elif [ "$removetraces" != "$YES" ] && [ "$removetraces" != "$NO" ]; then

    echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
    sleep 2

    $MENU

fi