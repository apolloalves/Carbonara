#!/bin/bash

#############################################################
# ARQUIVO RESPONSAVEL PELA REMOÇÃO DOS ARQUIVOS CONTIDOS NA #
# RUBBISH BIN                                               #
#                                                           #
# AUTHOR : APOLLO ALVES                                     #
# DATE : 09/01/2022                                         #
#                                                           #
#                                                           #
#############################################################

sudo rm -rfv  /home/apollo__nicolly/.local/share/recently-used.xbel
#Trash-cli - is no longer supported
#sudo trash-empty --all -f

sudo rm -rf ~/.local/share/Trash/*i


nautilus --quit

echo -e "\n\033[01;37m[\033[00;32m OK\033[00;37m ]\033m\n"



