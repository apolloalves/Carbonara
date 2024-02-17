#!/bin/bash

#####################################################################
#                                                                   #
# Script: stacer__tools.sh                                          #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

######################################################################################################################
#                                                                                                                    #
# Description : This shell script called "stacer.sh" checks whether the user wants to open Stacer, a graphical       #
# system monitoring and optimization tool. Here is a summary of what it does:                                        #
#                                                                                                                    #
# 1. Set some variables like MENU, YES and NO.                                                                       #
# 2. Asks the user if they want to open Stacer.                                                                      #
# - The user can answer "y" (yes) or "n" (no).                                                                       #
#                                                                                                                    #
# 3. If the user answers "y", the script displays a message that Stacer is running, waits 2 seconds and starts       #
# Stacer using the "stacer &" command.                                                                               #
#                                                                                                                    #
# 4. It then goes into a loop to check if the Stacer process is still running.                                       #
# - While the Stacer process is running, it displays a message stating that it is waiting for the user to            #
# close Stacer and waits for 2 seconds.                                                                              #
#                                                                                                                    #
# 5. After closing Stacer, the script returns to the main menu defined in MENU.                                      #
#                                                                                                                    #
# 6. If the user answers "n", the script returns directly to the main menu defined in MENU.                          #
#                                                                                                                    #
# 7. If the user provides an answer other than "y" or "n", the script displays an invalid input message and returns  #
# to the main menu defined in MENU.                                                                                  #
#                                                                                                                    #
# In short, this script checks if the user wants to open Stacer. If the answer is yes, it starts Stacer and waits    #
# for it to close. It then returns to the main menu. Otherwise, it returns directly to the main menu without opening #
# Stacer.                                                                                                            #
#                                                                                                                    #
######################################################################################################################

MENU="LinuxBashCare-10.12.23.sh"

echo
printf 'Do you want to open stacer (y/n) ? '
read -r stacer_response

if [ "$stacer_response" = "y" ] || [ "$stacer_response" = "Y" ]; then
  printf "\nstacer is running...\n"
  sleep 2
  stacer &> /dev/null 2>&1

  until ! pgrep -x "stacer" > /dev/null 2>&1; do
    sleep 1
  done
  $MENU

elif [ "$stacer_response" = "n" ] || [ "$stacer_response" = "N" ]; then
  $MENU
else
  printf -e "\nInvalid input! Please enter 'y' or 'n'.\n"
  sleep 2
  $MENU
fi
