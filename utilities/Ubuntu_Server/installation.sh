#!/usr/bin/bash
sudo apt update
sudo apt upgrade -y
sudo timedatectl set-timezone America/Sao_Paulo
sudo locale-gen pt_BR.UTF-8
sudo update-locale LANG=pt_BR.UTF-8
mkdir -p ~/Downloads
mkdir -p ~/scripts
mkdir -p ~/repos
sudo reboot now
