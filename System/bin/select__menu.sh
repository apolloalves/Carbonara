#!/bin/bash

#####################################################################
#                                                                   #
# Script: select__menu.sh                                           #
# Author: Apollo Alves                                              #
# Date: 19/07/2023                                                  #
#                                                                   #
#####################################################################

##########################################################################################################################
#                                                                                                                        #
# This is a bash script that displays a menu with several numbered options to perform different actions or commands      #
# on the system. The menu presents each option with an identification number, a brief description of the corresponding   #
# action and, in some cases, additional information about the need for root permissions (administrator user) to          #
# perform the action.                                                                                                    #
#                                                                                                                        #
# The menu options are as follows:                                                                                       #
#                                                                                                                        #
# 1. Update all system packages.                                                                                         #
# 2. Remove traces of unused packages from the system.                                                                   #
# 3. Perform both options 1 and 2.                                                                                       #
# 4. Optimize system performance - (requires root user).                                                                 #
# 5. Remove unwanted packages from system - (requires root user).                                                        #
# 6. Disable native services.                                                                                            #
# 7. Remove unused PPA (Personal Package Archive) from system - (requires root user).                                    #
# 8. Check system boot time.                                                                                             #
# 9. Show information about Swap status.                                                                                 #
# 10. Open the "brroot" file manager for the "Penguin's Eggs" files.                                                     #
# 11. Check disk space.                                                                                                  #
# 12. Open the STACER application (probably a system monitoring and optimization tool).                                  #
# 13. Mount external disks.                                                                                              #
# 14. Create "Penguin's Eggs" (probably a custom directory or file).                                                     #
# 15. Play all system startup messages "journalctl -b".                                                                  #
# 16. Open CLONRAID backups.                                                                                             #
# 17. Reinstall GNOME gdm3 (GNOME login manager).                                                                        #
# 18. Start a wizard for MySQL.                                                                                          #
# 19. Check if there is a new version of Ubuntu available.                                                               #
# 20. Manage packages with aptitude.                                                                                     #
# 21. Manage packages and drivers.                                                                                       #
# 22. Reboot the system.                                                                                                 #
# q. Exit the script.                                                                                                    #
#                                                                                                                        #
# The script provides the user with a simple interface for performing various tasks on the operating system, and each    #
# option will likely run a specific command or series of commands to perform the chosen action. To know what each option #
# does in detail, it would be necessary to analyze the complete code of the script and its implementations.              #
#                                                                                                                        #
##########################################################################################################################

echo -e "\033[01;32m[\033[01;37m 01\033[01;32m ]\033[00;37m - Update all system packages\033m"
echo -e "\033[01;32m[\033[01;37m 02\033[01;32m ]\033[00;37m - Remove traces of unused packages from the system\033m"
echo -e "\033[01;32m[\033[01;37m 03\033[01;32m ]\033[00;37m - Run both\033m"
echo -e "\033[01;32m[\033[01;37m 04\033[01;32m ]\033[00;37m - Optimize system performance - ( root user required )\033m"
echo -e "\033[01;32m[\033[01;37m 05\033[01;32m ]\033[00;37m - Remove unwanted packages of system - ( root user required )\033m"
echo -e "\033[01;32m[\033[01;37m 06\033[01;32m ]\033[00;37m - Disable services natives\033m"
echo -e "\033[01;32m[\033[01;37m 07\033[01;32m ]\033[00;37m - Remove unused PPA on system - ( root user required )\033m"
echo -e "\033[01;32m[\033[01;37m 08\033[01;32m ]\033[00;37m - Verify Startup time System \033m"
echo -e "\033[01;32m[\033[01;37m 09\033[01;32m ]\033[00;37m - Swap State\033m"
echo -e "\033[01;32m[\033[01;37m 10\033[01;32m ]\033[00;37m - Open my Penguin's Eggs Files - broot file manager\033m"
echo -e "\033[01;32m[\033[01;37m 11\033[01;32m ]\033[00;37m - Check space disks\033m"
echo -e "\033[01;32m[\033[01;37m 12\033[01;32m ]\033[00;37m - Open STACER \033m"
echo -e "\033[01;32m[\033[01;37m 13\033[01;32m ]\033[00;37m - Mount External Disks"
echo -e "\033[01;32m[\033[01;37m 14\033[01;32m ]\033[00;37m - Create Penguin's Eggs \033m"
echo -e "\033[01;32m[\033[01;37m 15\033[01;32m ]\033[00;37m - Replays all of your boot messages 'journalctl -b'"
echo -e "\033[01;32m[\033[01;37m 16\033[01;32m ]\033[00;37m - Open CLONRAID backups\033m"
echo -e "\033[01;32m[\033[01;37m 17\033[01;32m ]\033[00;37m - Reinstall GNOME gdm3 \033m"
echo -e "\033[01;32m[\033[01;37m 18\033[01;32m ]\033[00;37m - Start mysql assistent\033m"
echo -e "\033[01;32m[\033[01;37m 19\033[01;32m ]\033[00;37m - Check if a new version of Ubuntu is available \033m"
echo -e "\033[01;32m[\033[01;37m 20\033[01;32m ]\033[00;37m - Manage packages with aptitude \033m"
echo -e "\033[01;32m[\033[01;37m 21\033[01;32m ]\033[00;37m - Manage packages and drivers  \033m"
echo -e "\033[01;32m[\033[01;37m 22\033[01;32m ]\033[00;37m - Show disable services list \033m"
echo -e "\033[01;32m[\033[01;37m 23\033[01;32m ]\033[00;37m - Reboot System \033m"
echo -e "\033[01;32m[\033[01;37m q\033[01;32m ]\033[00;37m  - QUIT\033m\n"
