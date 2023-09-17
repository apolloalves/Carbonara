#!/bin/bash

# Definir as opções do menu
options=("Opção 1" "Opção 2" "Opção 3" "Sair")

# Exibir o menu usando o dialog
choice=$(dialog --clear --title "Menu Interativo" --menu "Escolha uma opção:" 12 40 4 "${options[@]}" 2>&1 >/dev/tty)

# Processar a seleção do usuário
case "$choice" in
    0)
        echo "Você selecionou a Opção 1"
        ;;
    1)
        echo "Você selecionou a Opção 2"
        ;;
    2)
        echo "Você selecionou a Opção 3"
        ;;
    3)
        echo "Saindo do menu."
        ;;
    *)
        echo "Opção inválida."
        ;;
esac
