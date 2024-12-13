#!/usr/bin/bash
red() {
    echo -e "\033[31m$1\033[0m"
}
green() {
    echo -e "\033[32m$1\033[0m"
}

blue() {
    echo -e "\033[34m$1\033[0m"
}

sudo apt update
sudo apt upgrade -y

sleep 1

blue "\nInstalando o gerenciador de pacotes Nala...\n"

sudo apt install nala build-essential -y

sleep 1

blue "\nInstalando dependências necessárias...\n"

sudo nala install build-essential unzip git neofetch curl wget net-tools btop python3-venv python3-pip python3.10-full python3.10-dev dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl bat ruby-full nodejs npm fzf -y

sleep 1

sudo timedatectl set-timezone America/Sao_Paulo
mkdir -p ~/Downloads
mkdir -p ~/scripts
mkdir -p ~/repos

blue "\nAlterando o shell padrão bash para o zsh."
blue "Certifique-se de digitar corretamente a senha."

sleep 3

sudo nala install zsh -y
chsh -s /usr/bin/zsh
