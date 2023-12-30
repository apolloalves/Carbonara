#!/bin/bash
# Source and initialize bashrc
source ~/.bashrc
. ~/.bashrc

# Check if the user is root
if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root."
    echo "Please execute this with "
    exit 1
fi

############################################################################
#                                                                          #
# Script: removepack.sh For updates packages of system and                 #
# optimizer performance.                                                   #
#                                                                          #
# Author: Apollo Alves                                                     #
# Date: 16/12/2023                                                         #
#                                                                          #
############################################################################

#############################################################################
#                                                                           #
# Remove Package and Optimize Performance Script                            #
# This script is designed to update system packages and optimize            #
# system performance. It removes cache and log files, cleans the            #
# system, removes orphaned libraries, clears the rubbish bin, and           #
# removes old snaps. It checks for root privileges before executing.        #
# Requires root privileges to run.                                          #
#                                                                           #
#############################################################################


# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemoving cache and logs files system...\033[00;37m\n" #
#############################################################################

sleep 2
rm -rfv /var/lib/apt/lists/lock
rm -rfv /var/lib/dpkg/lock-frontend
rm -rfv /var/lib/apt/lists/*
rm -rfv /var/lib/dpkg/lock
rm -rfv ~/.cache/thumbnails/*
rm -rfv ~/.cache/thumbnails/normal/*
rm -rf ~/.cache/icon*
rm -rfv /var/cache/apt/archives/lock
rm -rfv ~/.cache/tracker/
rm -Rfv /var/log/*

# OK MESSAGE
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m'

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mCleaning files system...\033[00;37m\n" #              #
#############################################################################

sudo apt autoclean -y
sudo apt -s clean
sudo apt clean -y
sudo apt clean all
sudo apt purge --autoremove
sudo apt autoremove -y

# OK MESSAGE
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m'

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemove orphaned libraries...\033[00;37m\n"            #
#############################################################################

apt remove "$(deborphan)"
deborphan --guess-data | xargs apt-get -y remove --purge
deborphan | xargs apt-get -y remove --purge

dpkg --configure -a
apt --fix-broken install
sleep 1

# OK MESSAGE
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m'

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemoving Rubbish Bin files...\033[00;37m\n"           #
#############################################################################

rm -rfv .local/share/Trash/*
rm -rfv /home/*/.local/share/Trash/*/**
rm -rfv /root/.local/share/Trash/*/**
rm -rfv ~/.local/share/Trash/*i
rm -rfv /home/*/.local/share/recently-used.xbel
sudo journalctl --vacuum-size=50M
history -c && history -w

# OK MESSAGE
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

# GREEN MESSAGE
#############################################################################
echo -e "\n\033[01;32mRemoving old snaps of system...\033[00;37m\n"         #
#############################################################################

sleep 2
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

# BLINK SUCCESSFULLY MESSAGE
echo -e "\n\033[01;05;37mTraces of unused packages have been successfully removed!!\033[00;37m\n"