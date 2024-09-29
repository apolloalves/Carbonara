#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
#############################################
#                                           #
# Script: disable__services.sh              #
# Author : Apollo Alves                     #
# Date : 16/12/2023                         #
#                                           #
#############################################

######################################################################################################################################################
#                                                                                                                                                    #
# Description:                                                                                                                                       #
# This bash script is designed to disable specific system services at boot. It provides explanations for each service being disabled. After          #
# disabling each service, it checks the status of the service and displays a message indicating whether the service was successfully disabled.       #
# There is a commented-out section, indicating services that are not currently being disabled.                                                       #
#                                                                                                                                                    #
# Note: It is important to review and understand the impact of disabling each service before running this script. Some services may be required for  #
# certain functionalities or applications on the system.                                                                                             #
#                                                                                                                                                    #
######################################################################################################################################################

# Function to print status
print_status() {
    if [ "$?" -eq 0 ]; then
        printf "\n\033[01;37m[\033[00;32m inative\033[01;37m ]\033m\n"
    else
        printf "[ \033[01;31mFAILED\033[01;37m ]\n"
    fi
}


####################################################################################################################################################
echo -e "\nDisabling natives services system..."
##########################################################################################################


##########################################################################################################
#                                                                                                        #
# Disable accounts-daemon : is a potential security risk. It is part of AccountsService, which allows    #
# programs to get and manipulate user account information. I can’t think of a good reason to allow this  #
# kind of behind-my-back operations, so I disable it.                                                    #
#                                                                                                        #
#                                                                                                        #
#########################################################################################################
echo "Disabling accounts-daemon.service..."
echo
systemctl stop accounts-daemon.service
systemctl disable accounts-daemon.service
sleep 1
systemctl status accounts-daemon.service
echo 
print_status
line_script.sh
#systemctl status accounts-daemon.service
##########################################################################################################
#                                                                                                         #
# Disable avahi-daemon.service : is supposed to provide zero-configuration network discovery, and make it #
# super-easy to find printers and other hosts on your network. I always disable it and don’t miss it.     #
#                                                                                                         #
#                                                                                                         #
###########################################################################################################

echo "Disabling disable avahi-daemon.service..."
echo
systemctl disable avahi-daemon.service
sleep 1
systemctl status avahi-daemon.service
echo 
print_status
line_script.sh

#systemctl status avahi-daemon.service
############################################################################################
#                                                                                          #
# Disable brltty.service : provides Braille device support, for example, Braille displays. #
#                                                                                          #
#                                                                                          #
############################################################################################

echo "Disabling brltty.service..."
echo
systemctl disable brltty.service
sleep 1
systemctl status brltty.service
echo 
print_status
line_script.sh
#systemctl status brltty.service
###################################################################################################################
#                                                                                                                 #
# Disable debug-shell.service : opens a giant security hole and should never be enabled except when you are using #
# it. This provides a password-less root shell to help with debugging systemd problems.                           #
#                                                                                                                 #
#                                                                                                                 #
###################################################################################################################
echo "Disabling debug-shell.service..."
echo
systemctl disable debug-shell.service
sleep 1
systemctl status debug-shell.service
echo 
print_status
line_script.sh
#systemctl status debug-shell.service
########################################################################################################################
#                                                                                                                      #
#                                                                                                                      #
# ModemManager.service : is a DBus-activated daemon that controls mobile broadband (2G/3G/4G) interfaces. If you don’t #
# have a mobile broadband interface — built-in, paired with a mobile phone via Bluetooth, or USB dongle — you don’t    #
# need this.                         #                                                                                 #
#                                                                                                                      #
#                                                                                                                      #
########################################################################################################################
echo "Disabling ModemManager.service..."
echo
systemctl disable ModemManager.service
systemctl status ModemManager.service
sleep 1
systemctl status debug-shell.service
echo 
print_status
line_script.sh

####################################################################################################################
# pppd-dns.service is a relic of the dim past. If you use dial-up Internet, keep it. Otherwise, you don’t need it. #
####################################################################################################################

echo "Disabling pppd-dns.service..."
systemctl disable pppd-dns.service
systemctl status pppd-dns.service
sleep 1
echo 
print_status
line_script.sh

#######################################################################################################
#                                                                                                     #
# whoopsie.service is the Ubuntu error reporting service. It collects crash reports and sends them to #
# https://daisy.ubuntu.com.                                                                           #
#                                                                                                     #
# You may safely disable it, or you can remove it permanently by unYou can review previous boots with #
# journalctl -b -1, which displays the previous startup; journalctl -b -2 shows two boots ago, and so #
# on.                                                                                                 #
#                                                                                                     #
#######################################################################################################

###############################################
# Warsaw Service : Remove service ITAU Bank # #
###############################################

echo -e "Disabling warsaw service..."
echo
systemctl stop warsaw.service
systemctl disable warsaw.service
sleep 1
systemctl status warsaw.service
echo 
print_status
line_script.sh


#################################
# Network Dispatcher Services   #
#################################

echo -e "Disabling network-dispatcher services..."
echo
systemctl disable networkd-dispatcher.service systemd-networkd.service
sleep 1
systemctl status networkd-dispatcher.service systemd-networkd.service
echo 
print_status
line_script.sh

#################################
# cups.service                  #
#################################

echo -e "Disabling cups.service..."
echo
systemctl disable cups.service
sleep 1
systemctl status systemctl disable cups.service
echo 
print_status
line_script.sh

#################################
# #  apport.service             #
#################################

echo -e "Disabling cups.service..."
echo
systemctl disable apport.service
sleep 1
systemctl status systemctl apport.service
echo 
print_status
line_script.sh

#################################
#   openvpn.service             #
#################################

echo -e "Disabling disable openvpn.service..."
echo
systemctl stop openvpn.service
systemctl disable openvpn.service
sleep 1
systemctl status systemctl openvpn.service
echo 
print_status
line_script.sh

#################################
#   virtualbox services         #
#################################

echo -e "Disabling cups.service..."
echo
systemctl disable vboxautostart-service.service
systemctl disable vboxballoonctrl-service.service
systemctl disable vboxdrv.service
systemctl disable vboxweb-service.service
sleep 1
systemctl status vboxautostart-service.service
echo
systemctl status vboxballoonctrl-service.service
echo
systemctl status vboxdrv.service
echo
systemctl status vboxweb-service.service
echo 
print_status
line_script.sh

#################################
#   teamviewerd.service         #
#################################


echo -e "Disabling teamviewer services..."
echo
systemctl stop teamviewerd.service
systemctl status teamviewerd.service
sleep 1
systemctl stop teamviewerd.service
systemctl disable teamviewerd.service > /dev/null 2>&1
echo 
print_status
line_script.sh
