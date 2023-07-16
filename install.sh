#!/bin/bash

# Defines the root directory from which find will be run
ROOT_DIR="/"
echo -e "\nwait...\n"

# Use the find command to locate the "gnu-bash" folder
path=$(find "$ROOT_DIR" -type d -name "gnu-bash" 2>/dev/null)

# Checks if the folder was found

if [ -n "$path" ]; then

    sleep 2
    echo "The cloned 'gnu-bash' folder was found in: $path"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l

    echo -e "\nsetting execute permissions on shell files...\n"
    sleep 2
    sudo chmod +x $path/System/bin/*.sh
    echo -e "copying the executables to the /bin folder...\n"
    sleep 2
    sudo rsync -avh $path/System/bin/*.sh /bin/
    echo "done!"

    # arrumar que bra de linmha
    echo "update packages of system..."
    echo "wait..."
    sleep 2
    sudo apt update -y && sudo apt upgrade -y
    sudo dpkg --configure -a
    sudo apt install -f
    echo "done!"
    echo "installing dependencies..."
    sleep 3
    echo
    echo "installing neofetch..."
    sudo apt install neofetch -y
    neofetch
    echo
    echo "done!"

    echo "installing deborphan..."
    sudo apt install deborphan -y
    echo "done!"

    echo "installing preload..."
    sleep 2
    sudo apt install preload
    echo "done!"

    echo "installing prelink..."
    sleep 2
    sudo apt install prelink -y
    sed 's/PRELINKING=unknown/PRELINKING=yes/g' prelink-sed >/dev/null
    sudo prelink -amvR
    echo "done!"

    echo "installing trash-cli..."
    sleep 2
    sudo apt-get install trash-cli
    echo "done!"

    echo "installing stacer..."
    sleep 2
    sudo apt install stacer -y
    echo "done!"

    echo "installing Eggs..."
    curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
    echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list >/dev/null
    sudo apt update -y
    sleep 2
    sudo apt install eggs=9.4.15 -y
    sudo apt-mark hold eggs=9.4.15
    echo "done!"

    echo "installing flatpak..."
    sleep 2
    sudo apt install flatpak -y
    echo "done!"

    echo "inserting history format in .bashrc"
    sed -i "14s/.*/HISTTIMEFORMAT='%Y-%m-%d%T '/" ~/.bashrc
    source ~/.bashrc
    echo done
    echo
    
    echo "installing broot..."
    curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot

    sudo mv broot /usr/local/bin
    sudo chmod +x /usr/local/bin/broot
    source ~/.bashrc
    broot
    source ~/.bashrc
    echo "broot was installed!"
    
    sleep 2
    shellCare-22.0.1.sh

fi
