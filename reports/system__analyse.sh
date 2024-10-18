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
MENU='/bin/carbonara.sh'
PLOTDIR="$HOME/plot"
PLOT="$PLOTDIR/plot.png"
LOG="$PLOTDIR/system-analyze-$(date '+%Y-%m-%d').log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m OK \033[01;37m]\033[00m\n"
    else
        printf "\n\033[01;37m[\033[00;31m FAILED \033[01;37m]\033[00m\n"
    fi
}

# Check for systemd-analyze
if ! command -v systemd-analyze >/dev/null 2>&1; then
    echo "systemd-analyze is not installed. Please install it first."
    exit 1
fi

echo
systemd-analyze
echo

# Ask for plotting the system analysis
printf 'Do you want to plot the result of system-analyze (y/n)? '
read -r SYSTEM_ANALYSE

if [ "$SYSTEM_ANALYSE" = "$YES" ]; then
    echo -e "\nWait...\n"
    sleep 1

    if [ ! -d "$PLOTDIR" ]; then
        echo "Creating folder: $PLOTDIR"
        mkdir -p "$PLOTDIR" >/dev/null 2>&1
        print_status
    fi

    # Generate systemd-analyze plot
    echo -e "\nGenerating plot..."
    systemd-analyze plot >"$PLOT"
    print_status

    echo -e "Plot saved in: $PLOT"
    eog "$PLOT" >/dev/null 2>&1 &

    # Generate systemd-analyze log
    echo -e "\nGenerating log file..."
    echo "$DATE" >>"$LOG"
    systemd-analyze >>"$LOG"
    print_status

    echo -e "Log saved in: $LOG"
    gedit "$LOG" >/dev/null 2>&1 &

    # Restart Nautilus if running and open directory
    if pgrep -x "nautilus" >/dev/null; then
        echo "Restarting Nautilus..."
        pkill nautilus
        sleep 1
    fi

    echo -e "Opening Nautilus in: $PLOTDIR"
    nautilus "$PLOTDIR" >/dev/null 2>&1 &
    print_status

elif [ "$SYSTEM_ANALYSE" = "$NO" ]; then
    echo "System analysis plot skipped."
    $MENU
else
    echo -e "Invalid input! Please enter 'y' or 'n'.\n"
fi

# Check if LINE_SCRIPT exists
if ! command -v "$LINE_SCRIPT" >/dev/null 2>&1; then
    echo -e "Command not found: $LINE_SCRIPT\n"
fi
