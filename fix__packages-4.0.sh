 #!/bin/bash

#Highlights commands
#print google
#echo -e '\033[01;34;47mG\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'

#print Fatal Error "RED" - "Blink"
#echo -e '\033[05;31mERRO FATAL\033[00;37m'

#print in "white bold Ubuntu" and "Green Underscore" "Focal Fossa"
#echo -e '\033[01;37mUbuntu \033[04;32mFocal Fossa\033[00;37m!!!'
#********************************************************************************************************************

echo  -e "\033[01;32mMACHINE REPORT\033[01;37m"
hostnamectl
#lsb_release -cs
echo "+++-======================================-=====================-============-================================="


echo  -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo "+++-======================================-=====================-============-================================="


echo -e "\033[01;32mCLEANNING CACHES OF PACKAGES...\033[00;37m"
rm -rf /var/lib/apt/lists/lock
rm /var/lib/apt/lists/* -vf
rm -f /var/lib/dpkg/lock
rm -rf ~/.cache/thumbnails/*
rm -f ~/.cache/thumbnails/normal/*
rm -f /var/cache/apt/archives/lock

echo  -e '\033[01;32mCHECKING THE INTEGRITY OF PACKAGES...\033[01;00m'


sudo apt update  -y
apt list --upgradable 
sudo apt --fix-broken install
sudo apt update --fix-missing 
sudo apt autoremove -y
sudo apt-get autoremove --purge

echo -e "\033[01;05;31mREMOVING PACKAGES THAT ARE NO LONGER INCLUDED IN ANY REPOSITORY!!\033[00;37m"
sudo apt purge '~o' -y 
sudo apt autoclean
sudo apt clean


echo -e "\033[01;32mFIXINIG DPKGS BROKENS\033[01;37m!"
echo "+++-==========================================================================================================="
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)

sudo dpkg --configure -a
sudo apt install -f

echo -e "\033[01;32mFULL UPDATE SYSTEM!\033[00;37m"
sudo apt full-upgrade
sudo apt dist-upgrade
echo "done!"

echo -e "\033[01;32mSEARCHING PACKAGES ORPHANERS...\033[00;37m"
sudo prelink -amR
sudo /etc/cron.daily/prelink
echo -e "\033[01;32mopenning Orphaner...\033[01;37m"

sudo apt remove $(deborphan)
sudo orphaner

echo -e "\033[01;05;31mATTENTION GRUB IS BEING UPDATED!! DO NOT INTERRUPT THE PROCESS!!\033[00;37m"
sudo update-grub
echo -e "\033[01;05;32m UPDADE GRUB OK!!\033[00;37m"
echo "+++-==========================================================================================================="


echo -e "\033[01;32mLISTING FILE DEVICES\033[00;37m"
#echo "echo list file system devices"
#df -h

echo -e "\033[01;32mSTATE RAID0 PARTITIONS\033[01;37m"
echo "+++-==========================================================================================================="
df -h | grep /dev/md0p1
df -h | grep /dev/md0p2
echo "+++-==========================================================================================================="


echo -e "\033[01;32mSWAP CACHE STATE!\033[00;37m"
echo "+++-==========================================================================================================="
sudo free -m
echo "+++-==========================================================================================================="

echo -e "\033[01;32mCLEANING UP CACHE ENTRIES...\033[01;37m"
sudo sync; echo 1 > /proc/sys/vm/drop_caches
sudo sync; echo 2 > /proc/sys/vm/drop_caches
sudo sync; echo 3 > /proc/sys/vm/drop_caches
echo -e '\033[01;37mDONE! \033[00;37m'
echo "+++-==========================================================================================================="


echo -e "\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
echo "+++-==========================================================================================================="
swapoff -a && swapon -a
free -h
echo "+++-==========================================================================================================="


echo -e "\033[01;05;31mTIMESHIFT IS CREATE SNAPSHOT!!\033[00;37m"
#timeshift --create --verbose --comments "SNAPSHOT CREATEDy BY fix__packages-2.0.sh" --tags D
#timeshift --list
echo  -e "\033[01;37mDONE\033[01;37m"
echo -e '\033[05;01;32mALL PROCESSS TERMINATED SUCCESSULL!!\033[00;37m'

















