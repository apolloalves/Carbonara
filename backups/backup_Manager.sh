#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
###########################################################################
#                                                                         #
# Script:nautilus.sh - Invoke Nautilus by opening a specific directory.   #
#                                                                         #
# Author: Apollo Alves                                                    #
# Date: 16/12/2023                                                        #
#                                                                         #
###########################################################################

############################################################################################################################
#                                                                                                                          #
# Description : This shell script called "nautilus.sh" is used to invoke the Nautilus file manager and open a specific     #
# directory. Here is a summary of what it does:                                                                            #
#                                                                                                                          #
# 1. Using the command " nautilus /mnt/EXTST500LM012__CLONRAID/", the script invokes the Nautilus file manager        #
# and opens the directory "/mnt/EXTST500LM012__CLONRAID/".                                                                #
#                                                                                                                          #
# 2. Next, the script checks if the Nautilus process is running using the command "pgrep -x "nautilus"". If it is running, #
# it enters a loop.                                                                                                        #
#                                                                                                                          #
# 3. In the loop, the script performs the following actions:                                                               #
# - Redirect empty output to /dev/null to avoid displaying messages.                                                       #
# - Use the command " killall nautilus" to terminate the Nautilus process.                                             #
# - Displays the message "closed".                                                                                         #
#                                                                                                                          #
# 4. The loop continues until the Nautilus process is no longer running.                                                   #
#                                                                                                                          #
# In short, this script invokes Nautilus to open a specific directory and then terminates the Nautilus process if it       #
# is running. This can be useful when you need to open Nautilus in a specific directory and make sure it exits after       #
# being used.                                                                                                              #
#                                                                                                                          #
#                                                                                                                          #
############################################################################################################################

# Directory path
mount /dev/sdd1 /mnt/VENTOY >/dev/null 2>&1
mount /dev/sdd3 /mnt/MDSATA/ >/dev/null 2>&1
echo "All devices are mounted!"

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
echo "Opening Nautilus..."
nautilus /mnt/VENTOY & >/dev/null 2>&1
