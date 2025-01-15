#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install toilet

title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

sudo apt update
sudo apt upgrade -y

echo ""
title_red "Instalação - Parte 1"

sleep 5

echo ""
title_blue "Instalando o gerenciador de pacotes Nala..."

sudo apt install nala build-essential -y

sleep 5

echo ""
title_blue "Instalando dependências necessárias..."

sudo nala install build-essential unzip git neofetch curl wget net-tools btop python3-venv python3-pip python3.10-full python3.10-dev dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl bat ruby-full nodejs npm fzf -y

sleep 5

sudo timedatectl set-timezone America/Sao_Paulo
mkdir -p ~/Downloads
mkdir -p ~/scripts
mkdir -p ~/repos

echo ""
title_blue "Alterando o shell padrão bash para o zsh."
echo ""
title_blue "Certifique-se de digitar corretamente a senha."

sleep 5

read -p "Pressione ENTER para confirmar e prosseguir."

sudo nala install zsh -y
chsh -s /usr/bin/zsh

echo ""
read -p "Pressione ENTER para confirmar e sair."
