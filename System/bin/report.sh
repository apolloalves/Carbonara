#!/bin/bash
# Check if the user is root
if (( EUID != 0 )); then
    echo "This script needs to be run as root."
    echo "Please execute this with sudo."
    exit 1
fi
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

LINE_SCRIPT='line_script.sh'
HOSTNAME=$(hostname)
KERNEL=$(uname -r)
OSNAME=$(uname)
DISTRONAME=$(cat /etc/os-release | head -n1 | cut -c 13-)
CODENAME=$(cat /etc/os-release | grep VERSION= | cut -c22- | cut -c-17)
PROCESSADOR=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
NUCLEOS=$(cat /proc/cpuinfo | grep "model name" | wc -l)
MEMTOTAL=$(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 )
PARTITIONS=$(df -h / && echo "" && df -h /mnt/EXTST500LM012__CLONRAID && echo "" && df -h /mnt/VENTOY)
DATE=$(date | cut -c-25)
LASTBOOT=$(systemd-analyze)
VIDEO=$(lspci | grep -i vga | cut -c 36-)
WHO=$(who)

MOTHERBOARD=$(dmidecode -t baseboard | grep "Manufacturer") 
MODEL=$(dmidecode -t baseboard | grep "Product Name")


clear
$LINE_SCRIPT


echo -e "Machine Report"
$LINE_SCRIPT
echo -e "\nMachine Name: $HOSTNAME"
echo -e "Distro Name: $DISTRONAME"  
echo -e "OS Name: $OSNAME"
echo -e "Codename : $CODENAME" 
echo -e "Version Kernel: $KERNEL"
echo -n "Active Machine Since: " && uptime -s
echo -n "User: " && whoami
echo
$LINE_SCRIPT
echo -e "\nHardwares: \n"
echo $MOTHERBOARD
echo $MODEL
echo -e "Processador: $PROCESSADOR"  
echo "Núcleos: $NUCLEOS" 
echo -e "Total Memory: $MEMTOTAL"
echo "Video: $VIDEO"
echo
$LINE_SCRIPT

echo -e "\nPartitions: \n"
echo -e "$PARTITIONS\n" 
$LINE_SCRIPT
echo -e "\nLast boot : $LASTBOOT\n"
echo
echo -e "Report Date: $DATE"
$LINE_SCRIPT
echo
