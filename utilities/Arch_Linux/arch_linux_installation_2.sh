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

brew install eza glow tldr fd git-delta
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
sudo rm -r ~/.config/nvim_old
cd ~
cp ~/repos/Arch_Linux/wallpapers/*.png ~/Pictures/
cp ~/repos/Arch_Linux/scripts/*.sh ~/scripts/
cd ~/Downloads/
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
mv gtk-master Dracula
mv Dracula ~/.themes
rm master.zip
cd ~/Downloads
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh -n dracula
cd ..
sudo rm -r Tela-icon-theme
wget https://github.com/dracula/zsh-syntax-highlighting/archive/master.zip
unzip master.zip
cp zsh-syntax-highlighting-master/zsh-syntax-highlighting.sh ~/scripts/
rm master.zip
sudo rm -r zsh-syntax-highlighting-master
cd ~/Downloads
mkdir -p  $HOME/.local/share/gedit/styles/
wget https://raw.githubusercontent.com/dracula/gedit/master/dracula-46.xml -O dracula.xml
mv dracula.xml $HOME/.local/share/gedit/styles/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "dracula-dark"
gsettings set org.gnome.desktop.interface font-name "JetBrainsMono NFM"
cd ~

rmdir "Documentos"
rmdir "Imagens"
rmdir "Músicas"
rmdir "Público"
rmdir "Modelos"
rmdir "Vídeos"

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

# cp ~/repos/Arch_Linux/gpu/nvidia-force-full-composition.sh scripts
# mkdir -p ~/.config/autostart && cp ~/repos/Arch_Linux/gpu/nvidia-force-full-composition.desktop ~/.config/autostart

flatpak install flathub io.github.shiftey.Desktop
yay -S cava
