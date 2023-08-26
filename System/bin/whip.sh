#!/bin/bash

# Verifica se o fzy está instalado e o instala se necessário
if ! command -v fzy &> /dev/null; then
    echo "O fzy não está instalado. Instalando..."
    sudo apt-get update
    sudo apt-get install -y fzy
fi
NEOFETCH='neofetch --ascii_colors 8 7 --colors 7'
neofetch_output=$($NEOFETCH)

 LINE='line.sh'
    ######################################################################################################################################################################################
    echo -e "\033[1;97;100m        ShellCare System          \033[0m\033[1;30;107m         Apollo Alves         \033[1;97;100m        version  23.04.1        \033[0m"
    ######################################################################################################################################################################################
    echo
    echo "$neofetch_output"
# Defina um array associativo para armazenar as mensagens de saída correspondentes a cada opção
declare -A option_outputs
option_outputs=(
    ["Update all system packages"]="Update all system packages"
    ["Remove traces of unused packages from the system"]="Remove traces of unused packages from the system"
    ["Run both"]="Run both"
    ["Optimize system performance - ( root user required )"]="Optimize system performance - ( root user required )"
    ["Remove unwanted packages of system - ( root user required )"]="Remove unwanted packages of system - ( root user required )"
    ["Disable services natives"]="Disable services natives"
    ["Remove unused PPA on system - ( root user required )"]="Remove unused PPA on system - ( root user required )"
    ["Verify Startup time System"]="Verify Startup time System"
    ["Swap State"]="Swap State"
    ["Open my Penguin's Eggs Files - broot file manager"]="Open my Penguin's Eggs Files - broot file manager"
    ["Check space disks"]="Check space disks"
    ["Open STACER"]="Open STACER"
    ["Mount External Disks"]="Mount External Disks"
    ["Create Penguin's Eggs"]="Create Penguin's Eggs"
    ["Replays all of your boot messages 'journalctl -b'"]="Replays all of your boot messages 'journalctl -b'"
    ["Open CLONRAID backups"]="Open CLONRAID backups"
    ["Reinstall GNOME gdm3"]="Reinstall GNOME gdm3"
    ["Start mysql assistent"]="Start mysql assistent"
    ["Check if a new version of Ubuntu is available"]="Check if a new version of Ubuntu is available"
    ["Manage packages with aptitude"]="Manage packages with aptitude"
    ["Manage packages and drivers"]="Manage packages and drivers"
    ["Show disable services list"]="Show disable services list"
    ["Reboot System"]="Reboot System"
    ["QUIT"]="Sair do programa"
)

# Função para executar a ação correspondente à opção selecionada
execute_action() {
    case "$1" in
        "Update all system packages")
            echo "Ação: Atualizar todos os pacotes do sistema"
            # Adicione os comandos relevantes aqui
            ;;
        "Remove traces of unused packages from the system")
            echo "Ação: Remover pacotes não utilizados do sistema"
            # Adicione os comandos relevantes aqui
            ;;
        # ... adicione mais casos conforme necessário ...
        *)
            echo "Ação não implementada para a opção: $1"
            ;;
    esac
}

# Formata o número com dois dígitos
format_number() {
    printf "%02d" "$1"
}

# Usar o fzy para selecionar uma opção do menu
selected_option=$(printf "%s\n" "${!option_outputs[@]}" | fzy)

# Construir e exibir o menu numerado
menu=""
counter=1
for option in "${!option_outputs[@]}"; do
    formatted_number=$(format_number "$counter")
    menu+="[$formatted_number] - $option\n"
    ((counter++))
done

selected_number=$(printf "%s" "$menu" | fzy --preview="echo {} | cut -d' ' -f1")

# Obter a opção selecionada com base no número
selected_option=$(printf "%s" "$menu" | grep "[$selected_number]" | cut -d' ' -f3-)

# Verificar a opção selecionada e executar a ação correspondente
if [[ -n ${option_outputs[$selected_option]} ]]; then
    execute_action "${option_outputs[$selected_option]}"
else
    echo "Opção inválida"
fi