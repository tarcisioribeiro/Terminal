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

cd ~
mkdir Pictures scripts Downloads Desktop
mkdir -p ~/.icons
mkdir -p ~/.themes
sudo pacman -Syu
green "\nAtualizando o sistema..."
sleep 3

sudo pacman -S curl wget iwd neofetch hyprpaper nano neovim vim btop htop ttf-dejavu noto-fonts noto-fonts-emoji ttf-liberation gst-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg gstreamer hyprland kitty xdg-desktop-portal xdg-desktop-portal-hyprland zip unzip p7zip unrar tar gzip wofi dolphin kate firefox flatpak python3 python-pip vlc obs-studio zsh tmux waybar bat nm-connection-editor openssh ufw gnome-tweaks gnome-disk-utility power-profiles-daemon ffmpeg gstreamer cliphist wl-clipboard dunst network-manager-applet polkit-kde-agent man-db grim slurp kvantum kvantum-qt5 qt5ct qt6ct nwg-look nwg-bar arc-gtk-theme hyprlock hypridle glib2 gnome-settings-daemon base-devel polkit gnome gsettings-desktop-schemas nautilus gedit kvantum kvantum-qt5 qt5ct qt6ct nwg-look nwg-bar arc-gtk-theme hyprlock hypridle glib2 gnome-settings-daemon pavucontrol wpa_supplicant ruby shotcut obsidian

sudo pacman -Syu

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ~
sudo rm -r yay
yay -Syu

sudo gpasswd -a $USER input

blue "\nAtivando o wifi...\n"
sleep 3

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

touch 20-static.network
echo '[Match]' >> 20-static.network
echo Name=enp3s0 >> 20-static.network
echo '' >> 20-static.network
echo '[Network]' >> 20-static.network
echo 'Address=192.168.2.200/24' >> 20-static.network
echo 'Gateway=192.168.2.1' >> 20-static.network
echo 'DNS=8.8.8.8 8.8.4.4' >> 20-static.network
sudo mv 20-static.network /etc/systemd/network/

sudo systemctl restart systemd-networkd

# sudo ip addr del 192.168.2.100/24 dev enp3s0

sudo systemctl start iwd
sudo systemctl enable iwd

touch wpa_supplicant.conf

echo 'ctrl_interface=/run/wpa_supplicant' >> wpa_supplicant.conf
echo 'update_config=1' >> wpa_supplicant.conf
echo '' >> wpa_supplicant.conf
echo 'network={' >> wpa_supplicant.conf
echo '    ssid="Tarcisio_5G"' >> wpa_supplicant.conf
echo '    psk="orrARDrdr27!"' >> wpa_supplicant.conf
echo '}' >> wpa_supplicant.conf

sudo mv wpa_supplicant.conf /etc/wpa_supplicant/

cd ~/repos
git clone https://github.com/tarcisioribeiro/Arch_Linux.git

mkdir -p ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/hypr ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/kitty ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/waybar ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/wofi ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/nwg-bar ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/btop ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/cava ~/.config

blue "\nAtivando o bluetooth...\n"
sleep 3

sudo pacman -S bluez bluez-utils blueman
sudo nano /etc/bluetooth/main.conf
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

chsh -s /usr/bin/zsh

sleep 3
green "\nAlterando o shell do sistema...\n"
sleep 3
zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cd ~
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

cd ~
cp repos/Terminal/customization/zsh/tj-dracula.omp.json /home/tarcisio/.poshthemes
cp repos/Terminal/customization/bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
cd ~/Downloads
tar -zxf logo-ls_Linux_x86_64.tar.gz
cd ~/Downloads/logo-ls_Linux_x86_64
sudo cp logo-ls /usr/local/bin

cd ~/Downloads
rm -r logo-ls_Linux_x86_64
rm logo-ls_Linux_x86_64.tar.gz

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# NVM
blue "\nInstalando o NVM...\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
sleep 3

# Brew
blue "\nInstalando o HomeBrew...\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sleep 3

# Oh My Bash
blue "\nInstalando o Oh My Bash...\n"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sleep 3

# Starship
blue "\nInstalando o Starship...\n"
curl -sS https://starship.rs/install.sh | sh
sleep 3

# Tmux Plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/repos/Terminal/customization/git/.gitconfig ~
cp ~/repos/Terminal/customization/tmux/.tmux.conf ~
cp ~/repos/Terminal/customization/starship/starship.toml ~/.config
sudo cp ~/repos/Terminal/customization/bash/Ubuntu_Mono_Nerd_Font_Complete_Mono.ttf /usr/share/fonts
sudo cp ~/repos/Terminal/customization/powershell/JetBrains_Mono_Medium_Nerd_Font_Complete_Mono_Windows_Compatible.ttf /usr/share/fonts

cp ~/repos/Arch_Linux/shell_files/.bashrc ~
cp ~/repos/Arch_Linux/shell_files/.zshrc ~
cp ~/repos/Arch_Linux/shell_files/.bash_aliases ~
cp ~/repos/Arch_Linux/shell_files/.zsh_aliases ~

sudo systemctl enable --now ufw.service
sudo ufw enable

sudo systemctl start sshd
sudo systemctl enable sshd

sudo ufw allow SSH

blue "\nReinicie o PC e execute o segundo instalador.\n"
