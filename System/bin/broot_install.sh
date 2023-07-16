#!/bin/bash

#####################################################################
#                                                                   #
# Script: removepack.sh For updates packages of system and   #
# optimizer performance.                                            #
#                                                                   #
# Author: Apollo Alves                                              #
# Date: 02/07/2023                                                  #
#                                                                   #
#####################################################################

curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot

sudo mv broot /usr/local/bin
sudo chmod +x /usr/local/bin/broot
source ~/.bashrc

broot
source ~/.bashrc
echo "broot was installed!"
sleep 10
br --version


