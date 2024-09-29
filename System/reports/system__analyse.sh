#!/bin/bash
# Check if the user is root
if ((EUID != 0)); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#####################################################################
#                                                                   #
# Script: system__analyse.sh                                        #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

########################################################################
#                                                                      #
# System Analyse Script                                                #
# This script is designed to be run with root privileges and performs  #
# system analysis using systemd-analyze. It provides options to plot   #
# the results, generate log files, and open relevant files and         #
# directories. It checks for the existence of folders and files,       #
# creates them if necessary, and opens the relevant Nautilus instance. #
#                                                                      #
########################################################################

YES="y"
NO="n"
LINE_SCRIPT='/bin/line_script.sh'
PLOTDIR="$HOME/plot"
PLOT="$PLOTDIR/plot.png"
LOG="$PLOTDIR/system-analyze-$(date '+%Y-%m-%d').log"

DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
        echo
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}

echo
systemd-analyze
echo

printf 'Do you want to plot the result of system-analyze (y/n) ? '
read -r SYSTEM_ANALYSE

if [ "$YES" = "$SYSTEM_ANALYSE" ]; then
    echo -e "\nWait...\n"
    sleep 1

    if [ -d "$PLOTDIR" ]; then
        echo "$PLOTDIR" was generated!

        echo -e "\nGenerating file plot..."
        systemd-analyze plot >"$PLOT"
        echo -e "Plot created in: $PLOT"
        eog $PLOT >/dev/null 2>&1
        print_status

        echo -e "\n$DATE" >>"$LOG" && systemd-analyze >>"$LOG" && echo -e "\n"
        echo "File: $LOG was updated in $DATE!"
        gedit $LOG >/dev/null 2>&1
        print_status
        echo -e "\nopening nautilus to analyze the generated files...\n"

        # Check if Nautilus processes are running
        if pgrep -x "nautilus" >/dev/null; then

            echo "Terminating Nautilus processes..."
            pkill -f "nautilus" >/dev/null 2>&1

            # Wait until Nautilus processes are completely closed
            while pgrep -x "nautilus" >/dev/null; do
                echo -n "."
                sleep 1
            done
        fi

        # Open Nautilus in the specified directory
        nautilus $PLOTDIR &
        print_status
        echo
    else

        echo "Creating folder plot in: $HOME"
        mkdir "$PLOTDIR" >/dev/null 2>&1
        echo The folder: "$PLOTDIR was created!"
        print_status

        sleep 1

        echo -e "\nGenerating file plot..."
        echo -e "\nOpening the $PLOT file..."
        systemd-analyze plot >"$PLOT"
        print_status
        sleep 1

        echo -e "\nGenerating log file..."
        echo -e "\n$DATE" >>"$LOG" && systemd-analyze >>"$LOG" && echo -e "\n"
        echo "Log file created in: $LOG"
        print_status
        sleep 1

        echo -e "\nOpening the $PLOT file..."
        eog "$PLOT" >/dev/null 2>&1
        sleep 1
        print_status

        echo -e "\nOpening $LOG"
        sleep 1
        gedit $LOG >/dev/null 2>&1
        print_status

        echo -e "Opening Nautilus $PLOTDIR"

        # Check if Nautilus processes are running
        if pgrep -x "nautilus" >/dev/null; then

            echo "Terminating Nautilus processes..."
            pkill -f "nautilus" >/dev/null 2>&1

            # Wait until Nautilus processes are completely closed
            while pgrep -x "nautilus" >/dev/null; do
                echo -n "."
                sleep 1
            done
        fi

        # Open Nautilus in the specified directory
        nautilus $PLOTDIR &

        sleep 1
        print_status
    fi

elif [ "$NO" = "$SYSTEM_ANALYSE" ]; then
    print_status
else
    echo -e "Invalid input! Please enter 'y' or 'n'.\n"
fi

if ! command -v "$LINE_SCRIPT" >/dev/null; then
    echo -e "Command not found: $LINE_SCRIPT\n"
fi
