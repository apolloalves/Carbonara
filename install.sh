#!/bin/bash

# Defines the root directory from which find will be run
ROOT_DIR="/"
echo -e "\nwait...\n"

# Use the find command to locate the "gnu-bash" folder
path=$(find "$ROOT_DIR" -type d -name "gnu-bash" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'gnu-bash' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    echo -e "\n\033[01;32msetting execute permissions on shell files...\033[00;37m\n"
    sleep 2
    sudo chmod +x $path/System/bin/*.sh
    echo -e "\n\033[01;32mcopying the executables to the /bin folder...\033[00;37m\n"
    sleep 2
    sudo rsync -avh $path/System/bin/*.sh /bin/
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    # arrumar que bra de linmha
    echo -e "\n\033[01;32mupdate packages of system...\033[00;37m\n"
    echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
    sleep 2
    sudo apt update -y && sudo apt upgrade -y
    sudo dpkg --configure -a
    sudo apt install -f
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"
    echo -e "\n\033[01;32installing dependencies...\033[00;37m\n"
    sleep 3
    echo -e "\n\033[01;32installing neofetch...\033[00;37m\n"
    
    sudo apt install neofetch -y
    neofetch
    echo
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing deborphan...\033[00;37m\n"
    
    sudo apt install deborphan -y
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing preload...\033[00;37m\n"
    sleep 2
    sudo apt install preload
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing prelink...\033[00;37m\n"
    sleep 2
    sudo apt install prelink -y
    sed 's/PRELINKING=unknown/PRELINKING=yes/g' prelink-sed >/dev/null
    sudo prelink -amvR
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt-get install trash-cli
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing stacer...\033[00;37m\n"
    sleep 2
    sudo apt install stacer -y
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing Eggs...\033[00;37m\n"
    curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
    echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list >/dev/null
    sudo apt update -y
    sleep 2
    sudo apt install eggs=9.4.15 -y
    sudo apt-mark hold eggs=9.4.15
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32installing flatpak...\033[00;37m\n"
    sleep 2
    sudo apt install flatpak -y
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"

    echo -e "\n\033[01;32inserting history format in .bashrc\033[00;37m\n"
    sed -i "14s/.*/HISTTIMEFORMAT='%Y-%m-%d%T '/" ~/.bashrc
    source ~/.bashrc
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"
    echo
    
    echo -e "\n\033[01;32installing broot...\033[00;37m\n"
    curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot

    sudo mv broot /usr/local/bin
    sudo chmod +x /usr/local/bin/broot
    source ~/.bashrc
    echo "broot was installed!"
    echo -e "\n\033[01;37m\033[01;32m done\033[00;37m\033m\n"
    sleep 3
    shellCare-22.0.1.sh

fi
