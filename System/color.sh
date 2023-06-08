#!/bin/bash

palavra="SHELL"
cor_fundo="\e[41m"  # Cor de fundo vermelho
cor_texto="\e[1;33m"  # Cor do texto amarelo (negrito)
reset="\e[0m"      # Reseta as configurações de cor

printf "%s%s%s%s\n" "$cor_fundo" "$cor_texto" "$palavra" "$reset"
