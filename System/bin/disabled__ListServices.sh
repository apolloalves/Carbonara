 #!/bin/bash
source ~/.bashrc
. ~/.bashrc

#############################################
#                                           #
# Script: disabled__ListServices.sh         #
# Author : Apollo Alves                     #
# Date : 15/14/2023                         #
#############################################
 # Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root." 
    exit 1
fi


LINE='line.sh'
PLOT="$HOME/plot/Disable-ServicesList.log"

 echo -e "\nGenerating list..\n"
                
                echo "File Path: " $PLOT
                $LINE
                echo
                sleep 1
                # systemctl list-unit-files --type=service | grep disable
                systemctl list-unit-files --type=service | grep disable >$PLOT && cat -n $PLOT
                echo
                $LINE
                echo
                