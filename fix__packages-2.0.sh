#!/bin/bash
#Highlights commands
#print google
#echo -e '\033[01;34;47mG\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'
#
#print Fatal Error "RED" - "Blink"
#echo -e '\033[05;31mERRO FATAL\033[00;37m'
#print in "white bold Ubuntu" and "Green Underscore" "Focal Fossa"
#echo -e '\033[01;37mUbuntu \033[04;32mFocal Fossa\033[00;37m!!!'
#********************************************************************************************************************

echo -e '\033[01;32mMACHINE REPORT\033[00:37m'
hostnamectl
#lsb_release -cs
echo -e '********************************************************************************************************************'
echo -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo -e '********************************************************************************************************************'

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#echo -e '\033[01;32mCLEARING TRACES OF PACKAGES...\033[00;33m'

sudo apt clean
sudo apt --purge autoremove -y
sudo apt --fix-broken install
sudo apt update --fix-missing
sudo apt full-upgrade -y
sudo apt install -f
sudo apt remove $(deborphan)

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;32mCLEANNING SYSTEM...\033[00;37m"

rm -rf /var/lib/apt/lists/lock
rm /var/lib/apt/lists/* -vf
rm -f /var/lib/dpkg/lock
rm -rf ~/.cache/thumbnails/*
rm -f ~/.cache/thumbnails/normal/*
rm -f /var/cache/apt/archives/lock
rm -rf ~/.cache/tracker/
#OK
echo -e '\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;32mCLEANING UP CACHE ENTRIES...\033[01;37m"

sudo sync; echo 1 > /proc/sys/vm/drop_caches
sudo sync; echo 2 > /proc/sys/vm/drop_caches
sudo sync; echo 3 > /proc/sys/vm/drop_caches


echo -e "\033[01;32mFIXINIG DPKGS BROKENS\033[01;37m!\n"
echo '********************************************************************************************************************'

sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)
sudo dpkg --configure -a

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e '\033[01;32mOPENNING DEBORPHAN...\033[01;37m'
sudo orphaner

echo -e '\033[01;32mOPTIMIZING WITH PRELINK...\033[00;37m'
sudo prelink -amR
sudo /etc/cron.daily/prelink

echo -e '\033[01;32mUPDATING FLATPAK MODULES...\033[00;37m'
flatpak update -y

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;05;31mATTENTION GRUB IS BEING UPDATED!! DO NOT INTERRUPT THE PROCESS!!\033[00;37m"

sudo update-grub
echo -e "\033[01;05;32mUPDADE GRUB OK!!\033[00;37m"
echo '********************************************************************************************************************'
echo -e "\033[01;32mSTATE RAID0 PARTITIONS\033[00;37m"
echo '********************************************************************************************************************'
df -h /dev/md0p* && lsblk | grep md0p3
echo '********************************************************************************************************************'

echo -e "\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
echo '********************************************************************************************************************'
sudo swapoff -a && swapon -a && free -h

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

echo -e "\033[01;05;31mTIMESHIFT IS CREATE SNAPSHOT!!\033[00;37m"
sudo timeshift --create --verbose --comments "SNAPSHOT CREATED BY BASH *fix__packages-2.0.sh*" --tags D

#echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
sudo timeshift --delete
#echo -e "\033[01;37mDONE\033[01;37m"

#echo -e '\033[05;01;32mALL PROCESSS TERMINATED SUCCESSULL!!\033[00;37m'
#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
#!/bin/bash
#Highlights commands
#print google
#echo -e '\033[01;34;47mG\033[01;31mo\033[01;33mo\033[01;34mg\033[01;32ml \033[01;31me\033[00;37;40m'
#
#print Fatal Error "RED" - "Blink"
#echo -e '\033[05;31mERRO FATAL\033[00;37m'
#print in "white bold Ubuntu" and "Green Underscore" "Focal Fossa"
#echo -e '\033[01;37mUbuntu \033[04;32mFocal Fossa\033[00;37m!!!'
#********************************************************************************************************************

echo -e '\033[01;32mMACHINE REPORT\033[00:37m'
hostnamectl
#lsb_release -cs
echo -e '********************************************************************************************************************'
echo -e "\033[01;32mKERNELS LIST!\033[01;37m"
sudo dpkg --list 'linux-image*'
echo -e '********************************************************************************************************************'

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#echo -e '\033[01;32mCLEARING TRACES OF PACKAGES...\033[00;33m'

sudo apt clean
sudo apt --purge autoremove -y
sudo apt --fix-broken install
sudo apt update --fix-missing
sudo apt full-upgrade -y
sudo apt install -f
sudo apt remove $(deborphan)

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;32mCLEANNING SYSTEM...\033[00;37m"

rm -rf /var/lib/apt/lists/lock
rm /var/lib/apt/lists/* -vf
rm -f /var/lib/dpkg/lock
rm -rf ~/.cache/thumbnails/*
rm -f ~/.cache/thumbnails/normal/*
rm -f /var/cache/apt/archives/lock
rm -rf ~/.cache/tracker/
#OK
echo -e '\n\033[01;37m[\033[01;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;32mCLEANING UP CACHE ENTRIES...\033[01;37m"

sudo sync; echo 1 > /proc/sys/vm/drop_caches
sudo sync; echo 2 > /proc/sys/vm/drop_caches
sudo sync; echo 3 > /proc/sys/vm/drop_caches


echo -e "\033[01;32mFIXINIG DPKGS BROKENS\033[01;37m!\n"
echo '********************************************************************************************************************'

sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs --no-run-if-empty sudo dpkg --purge
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2)
sudo dpkg --configure -a

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e '\033[01;32mOPENNING DEBORPHAN...\033[01;37m'
sudo orphaner

echo -e '\033[01;32mOPTIMIZING WITH PRELINK...\033[00;37m'
sudo prelink -amR
sudo /etc/cron.daily/prelink

echo -e '\033[01;32mUPDATING FLATPAK MODULES...\033[00;37m'
flatpak update -y

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
echo -e "\033[01;05;31mATTENTION GRUB IS BEING UPDATED!! DO NOT INTERRUPT THE PROCESS!!\033[00;37m"

sudo update-grub
echo -e "\033[01;05;32mUPDADE GRUB OK!!\033[00;37m"
echo '********************************************************************************************************************'
echo -e "\033[01;32mSTATE RAID0 PARTITIONS\033[00;37m"
echo '********************************************************************************************************************'
df -h /dev/md0p* && lsblk | grep md0p3
echo '********************************************************************************************************************'

echo -e "\033[01;32mCLEANING SWAP MEMORY!\033[00;37m"
echo '********************************************************************************************************************'
sudo swapoff -a && swapon -a && free -h

#OK
echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

echo -e "\033[01;05;31mTIMESHIFT IS CREATE SNAPSHOT!!\033[00;37m"
#sudo timeshift --create --verbose --comments "SNAPSHOT CREATED BY BASH *fix__packages-2.0.sh*" --tags D

echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'

#echo -e '\n\033[01;37m[\033[00;32m OK\033[01;37m ]\033m\n'
#sudo timeshift --delete

echo -e '\033[05;01;32mALL PROCESSS TERMINATED SUCCESSULL!!\033[00;37m'
