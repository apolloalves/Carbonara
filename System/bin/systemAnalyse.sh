#!/bin/bash

#####################################################################
#                                                                   #
# Script: Script for file System Startup time Analyse.              #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

YES="y"
NO="n"
LINE='/bin/line.sh'
PLOT='/home/apollo/plot/Analyse.svg'

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