#!/bin/bash

#####################################################################
#                                                                   #
# Script: Script for file System Startup time Analyse.              #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

################################################################################################################################
# This is a bash script that performs system startup time analysis and plotting using the `systemd-analyze` command. I'll      #
# explain what each part does:                                                                                                 #
#                                                                                                                              #
# 1. The script begins with the definition of some variables, such as `YES` and `NO`, which will be used for user interaction, #
# and the variables `LINE` and `PLOT`,                                                                                         #
# which store the paths for the script " line.sh" and the plot file "Analyse.svg", respectively.                               #
#                                                                                                                              #
# 2. A wait message is displayed.                                                                                              #
#                                                                                                                              #
# 3. The `systemd-analyze` command is executed to obtain information about the system boot time. The script then calls the     #
# "line.sh" script to display a line in the output.                                                                            #
#                                                                                                                              #
# 4. User input is required to decide whether to plot the system analysis result.                                              #
#                                                                                                                              #
# 5. If the user's response is "y" (yes), the script continues with the following steps:                                       # 
#                                                                                                                              #
# - A waiting message is displayed.                                                                                            #
# - The message "Generating plot..." is displayed.                                                                             #
# - The `systemd-analyze plot` command is executed and redirects the output to the file defined in `$PLOT`.                    #
# - The message "File created in: $PLOT" is displayed.                                                                         #
# - The message "Opening the file..." is displayed.                                                                            #
# - The `eog` command is used to open the plot file with the Eye of GNOME image viewer.                                        #
# - The success message is displayed.                                                                                          #
#                                                                                                                              #
# 6. If the user answers "n" (no), the success message is displayed.                                                           #
#                                                                                                                              #
# 7. If the user's response is neither "y" nor "n", the message "Invalid input! Please enter 'y' or 'n'."                      #
# (Invalid input! Please enter 'y' or 'n'.)                                                                                    #
#                                                                                                                              #
# 8. Next, it is checked if the command `$LINE` exists. If the command is not found, the message "Command not found:           #
# $LINE" is displayed.                                                                                                         #
#                                                                                                                              #
# Note: This script assumes the existence of the `systemd-analyze` and `eog` commands. Make sure you have these                #
# commands installed on your system before running the script.                                                                 #
#                                                                                                                              #
#                                                                                                                              #
################################################################################################################################

YES="y"
NO="n"
LINE='/bin/line.sh'
PLOT='/home/apollo/plot/Analyse.svg'
LOG='/home/apollo/plot/systemd-analize.txt'

echo -e "\nWait...\n"
sleep 2
systemd-analyze
"$LINE"

echo -n 'Do you want to plot result of system-analyze (y/n)? '
read -r SystemAnalyse_question

if [ "$YES" = "$SystemAnalyse_question" ]; then
    echo -e "\nWait...\n"
    sleep 1
    echo "Generating plot..."
    sleep 2
    systemd-analyze plot >"$PLOT"
    echo "Generating file log..."
    systemd-analyze >> $LOG
    echo -e "\nFile created in: $LOG"

    sleep 2

    echo -e "\nFile created in: $PLOT"
    echo -e "\nOpening the file..."
    sleep 2
    eog "$PLOT"
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
    
elif [ "$NO" = "$SystemAnalyse_question" ]; then
    echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
else
    echo -e "Invalid input! Please enter 'y' or 'n'.\n"
fi

if ! command -v "$LINE" >/dev/null; then
    echo -e "Command not found: $LINE\n"
fi