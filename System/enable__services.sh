#!/bin/bash
# MongoDB Service

# echo -e "\nChecking services..."
# sleep 2
# echo -e "ativando mongod service..."
# sudo systemctl enable mongod.services 
# sleep 1
# sudo systemctl status mongod.service
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#********************************************************************************************************************

# mySQL Service
# echo -e "ativando mysql service..."
# sudo systemctl enable mysql.services
# sleep 1
# sudo systemctl status mysql.service
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************************************************************************************************************

# TeamViwer Service
# echo -e "ativando teamviewer services..."
# sudo systemctl enable teamviewerd.service
# sleep 1
# sudo systemctl status teamviewerd.service
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************************************************************************************************************

# Warsaw Service
echo -e "ativando warsaw service..."
sudo systemctl enable warsaw.service
sleep 1
sudo systemctl status warsaw.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************* ***********************************************************************************************

# Virtualbox Services
echo -e "ativando virtualbox services..."
sleep 1
sudo systemctl disable vboxautostart-service.service
sudo systemctl disable vboxballoonctrl-service.service
sudo systemctl disable vboxdrv.service 
sudo systemctl disable vboxweb-service.service 
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

# Network Dispatcher Services
# echo -e "ativando network-dispatcher services..."
# sleep 1
# sudo systemctl mask networkd-dispatcher.service systemd-networkd.service
# echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#********************************************************************************************************************

# sudo systemctl enable snapd.service
# sudo systemctl mask avahi-daemon.service ModemManager.service thermald.service pppd-dns.service

















