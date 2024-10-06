#!/bin/bash
#########################################################################
#                                                                       #
# Script: menu.sh - Item Menu                                           #           
# Author: Apollo Alves                                                  #
# Date: 16/12/2023                                                      #
#                                                                       #
#########################################################################

##########################################################################################################
#                                                                                                        #
# Description: This bash script provides a menu with various system-related options for easy management. #
# Each option corresponds to a specific task, such as updating system packages, optimizing performance,  #
# checking system boot time, disabling native services, and more.                                        #
#                                                                                                        #
##########################################################################################################

options=(

    #1
    "Optimize system performance"
    #2
    "Swap State"
    #3
    "Check system boot time"
    #4
    "Boot messages wizard ( journalctl -b )"
    #5
    "List of disabled services"
    #6
    "Check space disks"
    #7
    "Egss Wizard"
    #8
    "Open CLONRAID backups"
    #9
    "Report Machine"
    #10
    "Fix pipewire"
    #11
    "Reboot System"
    #1
    "QUIT"

)
