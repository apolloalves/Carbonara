#!/bin/bash
#********************************************************************************************************************
#Highlights commands
#********************************************************************************************************************
#Print google
#echo -e '\033[01;34;47mG\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'
#********************************************************************************************************************
#Print Fatal Error "RED" - "Blink"
#echo -e '\033[05;31mERRO FATAL\033[00;37m'
#********************************************************************************************************************
#Print in "white bold Ubuntu" and "Green Underscore" "Focal Fossa"
#echo -e '\033[01;37mUbuntu \033[04;32mFocal Fossa\033[00;37m!!!'
#********************************************************************************************************************

#HOSTNAMECTL
echo -e "\033[01;32mMACHINE REPORT\033[00:37m"
hostnamectl
#lsb_release -cs
echo -e '************************************************************************************************************'

echo -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo -e '************************************************************************************************************'

#OK
#********************************************************************************************************************
#echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#echo -e '\033[01;32mCLEARING TRACES OF PACKAGES...\033[00;33m'
#********************************************************************************************************************

	sudo apt update -y 
	sudo apt full-upgrade -y
	sudo apt dist-upgrade -y
	sudo apt update --fix-missing
	sudo apt --fix-broken install
	sudo apt install -f
      sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d') -y
	sudo apt --purge autoremove -y
	sudo apt autoremove -y
	sudo apt autoclean -y
	sudo apt clean -y 
	sudo apt remove $(deborphan)

#OK
#********************************************************************************************************************
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
echo -e "\033[01;32mCLEANNING SYSTEM...\033[00;37m"

	sudo rm -rf /var/lib/apt/lists/lock
	sudo rm /var/lib/apt/lists/* -vf
	sudo rm -f /var/lib/dpkg/lock
	sudo rm -rf ~/.cache/thumbnails/*
	sudo rm -f ~/.cache/thumbnails/normal/*
	sudo rm -f /var/cache/apt/archives/lock
	sudo rm -rf ~/.cache/tracker/ 
	echo -e "\033[01;37m\nRemoving Rubbish Bin files...\033[01;33m"
	sleep 2
	sudo trash-empty --all -f
	echo -e "\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n"
	echo 'Removing open recents files...'
	sleep 1
	sudo rm -rf /home/apollo__nicolly/.local/share/recently-used.xbel
	sudo rm -Rf /var/log/*
	echo -e "\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n"

#********************************************************************************************************************
#OK
#********************************************************************************************************************
echo -e "\033[01;32mCLEANING UP CACHE ENTRIES...\033[01;37m"

	sudo sync; echo 1 > /proc/sys/vm/drop_caches
	sudo sync; echo 2 > /proc/sys/vm/drop_caches
	sudo sync; echo 3 > /proc/sys/vm/drop_caches

echo -e "\033[01;32mFIXINIG DPKGS BROKENS\033[01;37m!\n"
echo '**************************************************************************************************************'

	sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
	sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
	sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)
	sudo dpkg --configure -a

#********************************************************************************************************************
#OK
#********************************************************************************************************************

echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
echo -n 'Want to check for orphaned packages? (y/n)'
read -r orphaner

if test "y" = "$orphaner"
      then 
      echo -e "\n\033[01;32mOPENNING DEBORPHAN...\033[01;37m"
      sudo orphaner

elif test 'n'
      then 
      echo 'skipping ...'
      sleep 1
fi

echo -e "\n\033[01;32mOPTIMIZING WITH PRELINK...\033[00;37m"
sudo prelink -amR
sudo /etc/cron.daily/prelink


echo -e "\n\033[01;32mUPDATING FLATPAK MODULES...\033[00;37m"
	flatpak update -y

#OK
echo -e "\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n"
echo -e "\033[01;05;31mATTENTION GRUB IS BEING UPDATED!! DO NOT INTERRUPT THE PROCESS!!\033[00;37m"

	sudo update-grub

echo -e "\n\033[01;05;32mUPDADE GRUB OK!!\033[00;37m"
echo '************************************************************************************************************'
echo -e "\033[01;32mSTATE RAID0 PARTITIONS\033[00;37m"
echo '************************************************************************************************************'
	
	df -h /dev/md0p* && lsblk | grep md0p3

echo '************************************************************************************************************'

echo -e "\n\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
echo '************************************************************************************************************'
	
	sudo swapoff -a && swapon -a && free -h

#*********************************************************************************************************************'
#OK
#**********************************************************************************************************************
#echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#********************************************************************************************************************
#STACER/TIMESHIFT CONDITIONAL
#********************************************************************************************************************
echo -n 'Do you want to open stacer? (y/n)'
 read -r stacer_question


 if test "y" = "$stacer_question"

    then

      echo "stacer is running..."
      sleep 1
      stacer &        

      until ! pgrep -x "stacer" > /dev/null
      do
            echo -e '\cAguardando o encerramento do stacer pelo usuário...'
            sleep 1
      done


echo -n 'Can I create a new snapshot containing the current state of the system? (y/n)'
read -r timeshift_question
        

if test "y" = "$timeshift_question"

      then

            echo "initializing timeshift..."
            sleep 2
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.2.sh ]' --tags D
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo -e "\033[01;31mCreating snapshot...\033[00;37m"
            neofetch 
                              
      elif test "n" = "$timeshift_question"
                  
            then 
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            neofetch
      
      elif
            test "y" || "n" != "$stacer_question" 
            then
            echo "invalid arguments!"   
      
      fi

fi


if test "n" = "$stacer_question" 

      then 

            echo "initializing timeshift..."
            sleep 2
            sudo timeshift --create --verbose --comments 'shell : [ fix__packages-5.2.sh ]' --tags D
            echo -e "\033[01;31mCreating snapshot...\033[00;37m"
            echo -e "\n\033[00;37m[\033[00;32m done!\033[00;37m ]\033m\n"
            echo "Generating the list of snapshots..."
            sleep 2
            sudo timeshift --delete
            neofetch

            elif test "y" || "n" != "$stacer_question" || test "y" || "n" != "$timeshift_question"
            then
            echo "Invalid arguments!"   

fi