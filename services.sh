#!/bin/bash
# MongoDB Service

echo -e "\nChecking services..."
sleep 2
echo -e "Desativando mongod service..."
sudo systemctl disable mongod.services 
sleep 1
sudo systemctl status mongod.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#********************************************************************************************************************

# mySQL Service
echo -e "Desativando mysql service..."
sudo systemctl disable mysql.services
sleep 1
sudo systemctl status mysql.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************************************************************************************************************

# TeamViwer Service
echo -e "Desativando teamviewer services..."
sudo systemctl disable teamviewerd.service
sleep 1
# sudo systemctl status teamviewerd.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************************************************************************************************************

# Warsaw Service
echo -e "Desativando warsaw service..."
sudo systemctl disable warsaw.service
sleep 1
sudo systemctl status warsaw.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

#********************* ***********************************************************************************************

# Virtualbox Services
echo -e "Desativando virtualbox services..."
sleep 1
sudo systemctl disable vboxautostart-service.service
sudo systemctl disable vboxballoonctrl-service.service
sudo systemctl disable vboxdrv.service 
sudo systemctl disable vboxweb-service.service 
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"

# Network Dispatcher Services
echo -e "Desativando network-dispatcher services..."
sleep 1
sudo systemctl mask networkd-dispatcher.service systemd-networkd.service
echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"
#********************************************************************************************************************




















