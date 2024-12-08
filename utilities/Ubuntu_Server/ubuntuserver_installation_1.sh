#!/usr/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install nala -y

sudo nala install build-essential git neofetch curl wget net-tools btop python3-venv python3-pip python3.10-full python3.10-dev dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl bat ruby-full nodejs npm fzf -y

sudo nala install zsh -y
chsh -s /usr/bin/zsh
