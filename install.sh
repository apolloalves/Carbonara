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

   sleep 2 
   shellCare-22.0.1.sh
    
else
    echo "por favor acesso o dir correto que clonou para executar o instal.sh"
fi
