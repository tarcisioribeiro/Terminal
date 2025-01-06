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

green "\nComeçando a instalação do driver de vídeo...\n"

sleep 3

yay -S nvidia-550xx-dkms nvidia-550xx-utils lib32-nvidia-550xx-utils
yay -S nvidia-settings

blue "\nAltere a linha do grub GRUB_CMDLINE_LINUX_DEFAULT para GRUB_CMDLINE_LINUX_DEFAULT=quiet splash nvidia-drm.modeset=1.\n"

sleep 10

sudo nano /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkinitcpio -P

blue "\nAltere MODULES=() para MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm).\n"
blue "\nAltere a linha HOOKS() removendo a palavra kms.\n"

sleep 10

sudo mkinitcpio -P

cd ~

wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook

green "\nAltere a linha Target=nvidia para Target=nvidia-550xx-dkms.\n"

sleep 10

nano nvidia.hook

sudo mkdir -p /etc/pacman.d/hooks/ && sudo mv ./nvidia.hook /etc/pacman.d/hooks/

git clone https://github.com/wildtruc/nvidia-prime-select.git
cd nvidia-prime-select
sudo make install

sudo nvidia-prime-select nvidia
