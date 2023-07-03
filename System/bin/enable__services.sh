#!/bin/bash

###################################################
#                                                 #
# Script: Enable Services next of System in boot  #
# Author : Apollo Alves                           #
# Date : 13/01/2023                               #
#                                                 #
###################################################

##########################################################################################################
#                                                                                                        #
#                                                                                                        #
# enable Bluetooth : is a potential security risk. It is part of AccountsService, which allows programs #
# to get and manipulate user account information. I can’t think of a good reason to allow this kind of   #
# behind-my-back operations, so I mask it.                                                               #
#                                                                                                        #
#                                                                                                        #
##########################################################################################################
echo "Enabling enable bluetooth.service"
echo
sudo systemctl enable bluetooth.service
sleep 1 
sudo systemctl status bluetooth.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
#systemctl status bluetooth.service
##########################################################################################################
#                                                                                                        #
# enable accounts-daemon : is a potential security risk. It is part of AccountsService, which allows    #
# programs to get and manipulate user account information. I can’t think of a good reason to allow this  #
# kind of behind-my-back operations, so I enable it.                                                       #
#                                                                                                        #
#                                                                                                        #
#########################################################################################################
echo "Enabling accounts-daemon.service..."
echo
sudo systemctl enable accounts-daemon.service
sleep 1 
sudo systemctl status accounts-daemon.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
#systemctl status accounts-daemon.service
##########################################################################################################
#                                                                                                         #
# enable avahi-daemon.service : is supposed to provide zero-configuration network discovery, and make it #
# super-easy to find printers and other hosts on your network. I always enable it and don’t miss it.     #
#                                                                                                         #
#                                                                                                         #
###########################################################################################################

echo "Enabling enable avahi-daemon.service..."
echo
sudo systemctl enable avahi-daemon.service
sleep 1
sudo systemctl status avahi-daemon.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh

#systemctl status avahi-daemon.service
############################################################################################
#                                                                                          #
# enable brltty.service : provides Braille device support, for example, Braille displays. #
#                                                                                          #
#                                                                                          #
############################################################################################

echo "Enabling brltty.service..."
echo
sudo systemctl enable brltty.service
sleep 1
sudo systemctl status brltty.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
#systemctl status brltty.service
###################################################################################################################
#                                                                                                                 #
# enable debug-shell.service : opens a giant security hole and should never be enabled except when you are using #
# it. This provides a password-less root shell to help with debugging systemd problems.                           #
#                                                                                                                 #
#                                                                                                                 #
###################################################################################################################
echo "Enabling debug-shell.service..."
echo
sudo systemctl enable debug-shell.service
sleep 1
sudo systemctl status debug-shell.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
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
echo "Enabling ModemManager.service..."
echo
sudo systemctl enable ModemManager.service
sudo systemctl status ModemManager.service
sleep 1 
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
#systemctl status ModemManager.service
####################################################################################################################
#                                                                                                                  #
# pppd-dns.service is a relic of the dim past. If you use dial-up Internet, keep it. Otherwise, you don’t need it. #
#                                                                                                                  #
#                                                                                                                  #
####################################################################################################################

# echo "Enabling pppd-dns.service..."
# sudo systemctl enable pppd-dns.service
# sudo systemctl status pppd-dns.service
# sleep 1
# echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
# line.sh

#######################################################################################################
#                                                                                                     #
# whoopsie.service is the Ubuntu error reporting service. It collects crash reports and sends them to #
# https://daisy.ubuntu.com.                                                                           #
#                                                                                                     #
# You may safely enable it, or you can remove it permanently by unYou can review previous boots with #
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
echo -e "Enabling warsaw service..."        
echo
sudo systemctl enable warsaw.service            
sleep 1 
sudo systemctl status warsaw.service            
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
###############################################

#mySQL Service
echo -e "Enabling mysql service..."
echo
sudo systemctl enable mysql.service
sleep 1
sudo systemctl status mysql.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh
###############################################

#################################
#                               #
# # Network Dispatcher Services #
#                               #
#                               #
#################################

echo -e "Enabling network-dispatcher services..."
echo
sudo systemctl enable networkd-dispatcher.service systemd-networkd.service
sleep 1
sudo systemctl status networkd-dispatcher.service systemd-networkd.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh

#################################
#                               #
# # cups.service                #
#                               #
#################################

echo -e "Enabling cups.service..."
echo
sudo systemctl enable cups.service
sleep 1
sudo systemctl status systemctl enable cups.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh

#################################
#                               #
# #  apport.service             #
#                               #
#################################


echo -e "Enabling cups.service..."
echo
sudo systemctl enable apport.service
sleep 1
sudo systemctl status systemctl apport.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh



#################################
#                               #
# #  apport.service             #
#                               #
#################################


echo -e "Enabling enable openvpn.service..."
echo
sudo systemctl enable openvpn.service
sleep 1
sudo systemctl status systemctl openvpn.service
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh

#################################
#                               #
#   virtual box services        #
#                               #
#################################

echo -e "Enabling cups.service..."
echo
sudo systemctl enable vboxautostart-service.service
sudo systemctl enable vboxballoonctrl-service.service 
sudo systemctl enable vboxdrv.service  
sudo systemctl enable vboxweb-service.service  
sleep 1
sudo systemctl status vboxautostart-service.service
echo 
sudo systemctl status vboxballoonctrl-service.service 
echo 
sudo systemctl status vboxdrv.service  
echo 
sudo systemctl status vboxweb-service.service  
echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
line.sh

#TeamViwer Service
# echo -e "Enabling teamviewer services..."
# echo
# sudo systemctl status teamviewerd.service
# sleep 1
# sudo systemctl enable teamviewerd.service
# echo -e "\n\033[01;37m[\033[00;32m inative\033[00;37m ]\033m\n"
# line.sh

#########################################################################################################
#                                                                                                       #
# journalctl -b : Systemd has some commands to help debug boot issues. This command replays all of your #
# boot messages:                                                                                        #
#                                                                                                       #
#                                                                                                       #
#########################################################################################################
#journalctl -b