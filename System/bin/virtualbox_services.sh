#!/bin/bash
#####################################################################
#                                                                   #
# Script: virtualbox_services.sh                                    #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

##########################################################################
#                                                                        #
# # System Analysis Script                                               #
# # This script utilizes systemd-analyze to analyze the system's         #
# # performance. It prompts the user whether they want to generate a     #
# # plot of the analysis results and opens Nautilus to view the plot and #
# # log files. It also checks for the existence of necessary commands    #
# # and creates the required directories. It ends by displaying a line   #
# # from a specified script (line.sh) if available.                      #
#                                                                        #
##########################################################################

source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo"
    exit 1
fi

echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
echo "uploading virtualbox services..."
sleep 2

sudo systemctl start vboxdrv.service
sudo systemctl start vboxballoonctrl-service.service
sudo systemctl start vboxweb-service.service

echo "done"
