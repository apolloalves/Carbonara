#!/bin/bash

###########################################################################
#                                                                         #
# Script:nautilus.sh - Invoke Nautilus by opening a specific directory.   #
#                                                                         #
# Author: Apollo Alves                                                    #
# Date: 25/06/2023                                                        #
#                                                                         #                              
###########################################################################

############################################################################################################################
#                                                                                                                          #
# Description : This shell script called "nautilus.sh" is used to invoke the Nautilus file manager and open a specific     #
# directory. Here is a summary of what it does:                                                                            #
#                                                                                                                          #
# 1. Using the command "sudo nautilus /mnt/EXT@ST500LM012__CLONRAID/", the script invokes the Nautilus file manager        #
# and opens the directory "/mnt/EXT@ST500LM012__CLONRAID/".                                                                #
#                                                                                                                          #
# 2. Next, the script checks if the Nautilus process is running using the command "pgrep -x "nautilus"". If it is running, #
# it enters a loop.                                                                                                        #
#                                                                                                                          #
# 3. In the loop, the script performs the following actions:                                                               #
# - Redirect empty output to /dev/null to avoid displaying messages.                                                       #
# - Use the command "sudo killall nautilus" to terminate the Nautilus process.                                             #
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

sudo nautilus /mnt/EXT@ST500LM012__CLONRAID/

if pgrep -x "nautilus" > /dev/null
then
until ! pgrep -x "nautilus" > /dev/null
do
      echo -e > /dev/null
      sudo killall nautilus
      echo "fechado"
done
fi