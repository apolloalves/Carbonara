#!/bin/bash

# Define o diretório raiz a partir do qual o find será executado
ROOT_DIR="/"

# Utiliza o comando find para localizar a pasta "gnu-bash"
path=$(find "$ROOT_DIR" -type d -name "gnu-bash" 2>/dev/null)

# Verifica se a pasta foi encontrada

if [ -n "$path" ]; then
    echo "A pasta 'gnu-bash' foi encontrada em: $path"
   
   ls -lsht $path/System/bin/*.sh 
   find $path/System/bin/ -ls | wc -l
   sudo chmod +x $path/System/bin/*.sh
   sudo rsync -avh $path/System/bin/*.sh /bin/
#    /bin/teste/shellCare-22.0.1.sh
   echo feito
   shellCare-22.0.1.sh

   #    sudo rsync -avh $caminho_pasta/System/bin/*.sh /bin/teste/
    
else
    echo "A pasta 'gnu-bash' não foi encontrada."
    echo "por favor acesso o dir correto que clonou para executar o instal.sh"
fi
