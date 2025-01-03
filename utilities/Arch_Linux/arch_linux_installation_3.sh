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

blue "\nComeçando a instalação do VirtualBox...\n"

sleep 3

sudo pacman -S virtualbox virtualbox-guest-iso virtualbox-host-dkms linux-lts-headers
sudo dkms autoinstall
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
sudo modprobe vboxnetadp
sudo tee /etc/modules-load.d/virtualbox.conf <<< "vboxdrv"
yay -Syy
yay -S virtualbox-ext-oracle
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service

green "\nInstalação do VirtualBox concluída.\n"

sleep 3

blue "\nGerando chaves SSH...\n"

ssh-keygen