#!/bin/bash

# Defines the root directory from which find will be run
ROOT_DIR="/"
echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"

# Use the find command to locate the "ShellCare" folder
path=$(find "$ROOT_DIR" -type d -name "ShellCare" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo -e "\n\033[01;32mThe cloned 'ShellCare' folder was found in: $path\033[00;37m\n"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    echo -e "\n\033[01;32msetting execute permissions on shell files...\033[00;37m"
    sleep 2
    sudo chmod +x $path/System/bin/*.sh
    echo -e "\n\033[01;32mcopying the executables to the /bin folder...\033[00;37m\n"
    sleep 2
    sudo rsync -avh --progress $path/System/bin/*.sh /bin/
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    # arrumar que bra de linmha
    echo -e "\n\033[01;32mupdate packages of system...\033[00;37m\n"
    echo -e "\n\033[01;37m\033[01mwait...\033[00;37m\033[00m\n"
    sleep 2
    sudo apt update -y && sudo apt upgrade -y
    sudo dpkg --configure -a
    sudo apt install -f
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    echo -e "\n\033[01;32minstalling dependencies...\033[00;37m\n"
    sleep 3
    echo -e "\n\033[01;32mCreating folder plot in: $HOME...\033[00;37m\n"
    mkdir $HOME/plot
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling neofetch...\033[00;37m\n"
    sudo apt install neofetch -y
    echo ""
    neofetch
    echo ""
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    
    echo -e "\n\033[01;32minstalling deborphan...\033[00;37m\n"
    
    sudo apt install deborphan -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling preload...\033[00;37m\n"
    sleep 2
    sudo apt install preload
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling prelink...\033[00;37m\n"
    sleep 2
    sudo apt install prelink -y
    sudo sed -i '6s/PRELINKING=.*/PRELINKING=yes/' /etc/default/prelink >/dev/null
    sudo chmod 666 /etc/prelink.conf
    sudo prelink -amvR
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling trash-cli...\033[00;37m\n"
    sleep 2
    sudo apt-get install trash-cli
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling stacer...\033[00;37m\n"
    sleep 2
    sudo apt install stacer -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling Penguins-eggs...\033[00;37m\n"
    curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
    echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list >/dev/null
    sudo apt update -y
    sleep 2
    sudo apt install eggs=9.4.15 -y
    sudo apt-mark hold eggs=9.4.15
    sleep 2
    echo -e "\n\033[01;32minstalling Penguins-eggs calamares...\033[00;37m\n"
    sudo eggs calamares --install
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minstalling flatpak...\033[00;37m\n"
    sleep 2
    sudo apt install flatpak -y
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"

    echo -e "\n\033[01;32minserting history format in ~/.bashrc\033[00;37m\n"
    sed -i "14s/.*/HISTTIMEFORMAT='%Y-%m-%d%T '/" ~/.bashrc
    source ~/.bashrc
    echo -e "\n\033[01;37m\033[01;32mdone\033[00;37m\033m"
    echo
    broot_install.sh  
    sleep 3
    shellCare-23.0.4.sh

fi
