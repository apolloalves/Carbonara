#!/bin/bash

#####################################################################
#                                                                   #
# Script: checkSpace                                                #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 25/06/2023                                                  #
#                                                                   #
#####################################################################

echo -e "Disabling mysql service..."
sudo systemctl disable mysql.service
sleep 1
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"