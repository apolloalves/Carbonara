#!/bin/bash

#####################################################################
#                                                                   #
# Script: unwanted__pack.sh                                         #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

######################################################################
#                                                                    #
# Unwanted Package Removal Script                                    #
# This script is designed to be run with root privileges and removes #
# unwanted packages from the system, as well as purges leftover      #
# configurations. It prompts the user for confirmation and executes  #
# the removal process if the user agrees. If the user declines or    #
# provides invalid input, it redirects to the specified menu script. #
#                                                                    #
######################################################################

# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
      echo "This script needs to be run as root."
      echo "Please execute this with "
      exit 1
fi

MENU="LinuxBashCare-10.11.23.sh"

YES="y"
NO="n"

echo
echo -n 'Do you want remove unwanted packs of system ( y/n ) ? '
read -r removeunwanted

if [ "$removeunwanted" = "$YES" ]; then

      #REMOVE PACKAGES UNWANTED
      echo
      echo -e '************************************************************************************************************'
      echo -e "\033[01;05;31mREMOVING UNWANTED PACKAGES AND PURGE LEFTOVER CONFIGURATION...\033[00;37m"
      sleep 2
      echo -e '************************************************************************************************************'

      # remove unwanted packages and purge leftover configuration
      purge-unwanted() {
            apt autoremove --purge -y \
                  snapd lxd-agent-loader ufw command-not-found \
                  apport alsa-ucm-conf alsa-topology-conf byobu \
                  cloud-init cloud-guest-utils cloud-initramfs-copymods cloud-initramfs-dyn-netconf \
                  landscape-common motd-news-config pollinate popularity-contest ubuntu-advantage-tools \
                  open-iscsi multipath-tools accountsservice cryptsetup-initramfs open-vm-tools
            rm -rvf \
                  /root/snap \
                  /etc/pollinate \
                  /etc/cloud \
                  /var/lib/cloud \
                  /var/lib/command-not-found
      }

      purge-unwanted
      echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

fi

if [ "$removeunwanted" = "$NO" ]; then

      $MENU

elif [ "$removeunwanted" != "$YES" ] && [ "$removeunwanted" != "$NO" ]; then

      echo -e "\nInvalid input! Please enter 'y' or 'n'.\n"
      sleep 2
      $MENU

fi
