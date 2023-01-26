#!/bin/bash

#############################################
#                                           #
# Script: Remove Services of System in boot #
# Author : Apollo Alves                     #
# Date : 13/01/2023                         #
#                                           #
#                                           #
#############################################

##########################################################################################################
#                                                                                                        #
#                                                                                                        #
# Disable Bluetooth : is a potential security risk. It is part of AccountsService, which allows programs #
# to get and manipulate user account information. I can’t think of a good reason to allow this kind of   #
# behind-my-back operations, so I mask it.                                                               #
#                                                                                                        #
#                                                                                                        #
##########################################################################################################
echo "Disabling disable bluetooth.service"
sudo systemctl disable bluetooth.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status bluetooth.service
##########################################################################################################
#                                                                                                        #
# Disable accounts-daemon : is a potential security risk. It is part of AccountsService, which allows    #
# programs to get and manipulate user account information. I can’t think of a good reason to allow this  #
# kind of behind-my-back operations, so I disable it.                                                       #
#                                                                                                        #
#                                                                                                        #
#########################################################################################################
echo "Disabling accounts-daemon.service..."
sudo systemctl disable accounts-daemon.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status accounts-daemon.service
##########################################################################################################
#                                                                                                         #
# Disable avahi-daemon.service : is supposed to provide zero-configuration network discovery, and make it #
# super-easy to find printers and other hosts on your network. I always disable it and don’t miss it.     #
#                                                                                                         #
#                                                                                                         #
###########################################################################################################
echo "Disabling disable avahi-daemon.service..."
sudo systemctl disable avahi-daemon.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status avahi-daemon.service
############################################################################################
#                                                                                          #
# Disable brltty.service : provides Braille device support, for example, Braille displays. #
#                                                                                          #
#                                                                                          #
############################################################################################
echo "Disabling brltty.service..."
sudo systemctl disable brltty.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status brltty.service
###################################################################################################################
#                                                                                                                 #
# Disable debug-shell.service : opens a giant security hole and should never be enabled except when you are using #
# it. This provides a password-less root shell to help with debugging systemd problems.                           #
#                                                                                                                 #
#                                                                                                                 #
###################################################################################################################
echo "Disabling debug-shell.service..."
sudo systemctl disable debug-shell.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
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
sudo systemctl disable ModemManager.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status ModemManager.service
####################################################################################################################
#                                                                                                                  #
# pppd-dns.service is a relic of the dim past. If you use dial-up Internet, keep it. Otherwise, you don’t need it. #
#                                                                                                                  #
#                                                                                                                  #
####################################################################################################################
echo "Disabling pppd-dns.service..."
sudo systemctl disable pppd-dns.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#systemctl status pppd-dns.service
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
#                                             #
# Warsaw Service : Remove service ITAU Bank # #
#                                             #
#                                             #
###############################################
echo -e "Disbling warsaw service..."        
sudo systemctl disable warsaw.service            
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
###############################################



#mySQL Service
echo -e "Disabling mysql service..."
sudo systemctl disable mysql.service
sleep 1
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

TeamViwer Service
echo -e "ativando teamviewer services..."
sudo systemctl disable teamviewerd.service
sleep 1
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#################################
#                               #
# # Network Dispatcher Services #
#                               #
#                               #
#################################

echo -e "Disable network-dispatcher services..."
sleep 1
sudo systemctl disable networkd-dispatcher.service systemd-networkd.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#########################################################################################################
#                                                                                                       #
# journalctl -b : Systemd has some commands to help debug boot issues. This command replays all of your #
# boot messages:                                                                                        #
#                                                                                                       #
#                                                                                                       #
#########################################################################################################
journalctl -b