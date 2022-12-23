#!/bin/bash

 VALIDATE=$(test "y" || "n" != "$pack")
 
 echo -n 'Do you want remove unwanted packs of system ( y/n ) ? or press any key to exit '
 read -r pack



 if test "y" = "$pack"

      then

      #REMOVE PACKAGES UNWANTED
      echo -e '************************************************************************************************************'
      echo -e "\033[01;05;31mREMOVING UNWANTED PACKAGES AND PURGE LEFTOVER CONFIGURATION...\033[00;37m"
      sleep 2
      echo -e '************************************************************************************************************'

      # remove unwanted packages and purge leftover configuration
            purge-unwanted() {
            apt autoremove --purge -y \
            snapd lxd-agent-loader ufw command-not-found \
            apport alsa-ucm-conf alsa-topology-conf byobu \
            cloud-init cloud-guest-utils cloud-initramfs-copymods cloud-initramfs-dyn-netconf \
            landscape-common motd-news-config pollinate popularity-contest ubuntu-advantage-tools \
            open-iscsi multipath-tools accountsservice cryptsetup-initramfs open-vm-tools;
            rm -rvf \
            /root/snap \
            /etc/pollinate \
            /etc/cloud \
            /var/lib/cloud \
            /var/lib/command-not-found;
      }

      purge-unwanted

elif test "n" = "$pack"
   
      then

      #OK
      echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"

	echo -e "\033[01;37m\nRemoving Rubbish Bin files...\033[01;33m"
        sleep 1 
        sudo rm -rfv .local/share/Trash/*
        sudo rm -rfv /home/*/.local/share/Trash/*/**
        sudo rm -rfv /root/.local/share/Trash/*/**
      
      #OK
      echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
	
	echo 'Removing open recents files...'
	sleep 1
	sudo rm -rf /home/apollo__nicolly/.local/share/recently-used.xbel
	
      #OK
      echo -e '\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n'	


elif
       echo "${VALIDATE}"
        then
        echo -e "Operation canceled by the user\n"   
fi


