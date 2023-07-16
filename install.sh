#!/bin/bash

##################################
# 1 - deborphan install          #
# 2 - prelink install            #
# 3 - .bashrc - history          #
# 4 - trash-cli - install        #
# 5 - eggs - install ver. 9.4.15 #
# 6 - install neofetch           #
#                                #
##################################

# Define o diretório raiz a partir do qual o find será executado
ROOT_DIR="/"

# Utiliza o comando find para localizar a pasta "gnu-bash"
path=$(find "$ROOT_DIR" -type d -name "gnu-bash" 2>/dev/null)

# Verifica se a pasta foi encontrada

if [ -n "$path" ]; then
    echo "wait..."
    sleep 3
    echo "A pasta 'gnu-bash' foi encontrada em: $path"

    ls -lsht $path/System/bin/*.sh
    find $path/System/bin/ -ls | wc -l
    echo "Definindo permissões de execução nos arquivos shell..."
    sleep 2
    sudo chmod +x $path/System/bin/*.sh
    echo "copiando os executáveis para a pasta /bin"
    sleep 2
    sudo rsync -avh $path/System/bin/*.sh /bin/
    echo "done!"
    echo "open..."

    echo "update packages of system..."
    echo "wait..."
    sleep 2
    sudo apt update -y && sudo apt upgrade -y
    sudo dpkg --configure -a 
    sudo apt install -f
    echo "done!"
    echo "installing dependencies..."
    sleep 3 

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
    sed 's/PRELINKING=unknown/PRELINKING=yes/g' prelink-sed > /dev/null
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
    echo "deb [arch=$(dpkg --print-architecture)] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list > /dev/null
    sudo apt update -y 
    sleep 2 
    sudo apt install eggs=9.4.15 -y
    sudo apt-mark hold eggs=9.4.15
    echo "done!"

    echo "installing broot..."
    sleep 2 
    wget https://dystroy.org/broot/download/x86_64-linux/broot
    sudo install broot /usr/local/bin
    broot --install
    br
    echo "done!"

    echo "installing flatpak..."
    sleep 2 
    sudo apt install flatpak -y
    echo "done!"




    echo "inserting history format in .bashrc"
    sed -i "14s/.*/HISTTIMEFORMAT='%Y-%m-%d%T '/" ~/.bashrc
    echo done
    sleep 2
    shellCare-22.0.1.sh

else
    echo "por favor acesso o dir correto que clonou para executar o instal.sh"
fi
