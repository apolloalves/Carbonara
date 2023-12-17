#!/bin/bash
#####################################################################
#                                                                   #
# Script: report.sh                                                 #
# Author: Apollo Alves                                              #
# Date: 16/12/2023                                                  #
#                                                                   #
#####################################################################

########################################################################
#                                                                      #
# System Report Script                                                 #
# This script generates a comprehensive machine report with various    #
# system information. It includes details like machine name, OS name,  #
# kernel version, hardware information, memory details, partition      #
# information, last boot time, and more. Requires no user interaction. #
#                                                                      #
########################################################################

LINE='line.sh'
HOSTNAME=$(hostname)
KERNEL=$(uname -r)
OSNAME=$(uname)
DISTRONAME=$(cat /etc/os-release | head -n1 | cut -c 13-)
CODENAME=$(cat /etc/os-release | grep VERSION= | cut -c22- | cut -c-17)
PROCESSADOR=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
NUCLEOS=$(cat /proc/cpuinfo | grep "model name" | wc -l)
MEMTOTAL=$(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 )
PARTITIONS=$(df -h /dev/md127p1)
DATE=$(date | cut -c-25)
LASTBOOT=$(systemd-analyze)
WHO=$(who)
clear
$LINE


echo -e "Machine Report"
$LINE
echo -e "Machine Name: $HOSTNAME"
echo -e "Distro Name: $DISTRONAME\n"  
echo -e "OS Name: $OSNAME"
echo -e "Codename : $CODENAME" 
echo -e "Version Kernel: $KERNEL"
echo -n "Active Machine Since: " && uptime -s
echo -n "User: " && whoami
echo
$LINE
echo -e "\nHardwares: \n"
echo -e "Processador: $PROCESSADOR"  
echo "Núcleos: $NUCLEOS" 
echo -e "Total Memory: $MEMTOTAL"
$LINE
echo -e "\nPartitions : $PARTITIONS\n" 
echo -e "Last boot : $LASTBOOT\n"
echo -e "Report Date: $DATE"
echo 