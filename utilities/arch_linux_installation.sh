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
mkdir repos Pictures scripts Downloads Desktop
mkdir -p ~/.icons
mkdir -p ~/.themes
sudo pacman -Syu
sudo pacman -S curl wget neofetch fzf fastfetch neofetch nano neovim vi btop htop ttf-dejavu noto-fonts noto-fonts-emoji ttf-liberation gst-libav gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg gstreamer hyprland kitty xdg-desktop-portal xdg-desktop-portal-hyprland zip unzip p7zip unrar tar gzip wofi nautilus gedit firefox flatpak python3 vlc obs-studio zsh tmux waybar bat nm-connection-editor networkmanager bluez bluez-utils blueman openssh ufw cmatrix qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs ebtables vde2 openbsd-netcat ngrok gnome-tweaks ruby gnome-disk-utility power-profiles-daemon mesa-utils pulseaudio pulseaudio-bluetooth networkmanager virtualbox virtualbox-guest-iso xdg-desktop-portal-wlr nwg-bar, nwg-look ngrok

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
sudo rm -r yay
yay -S google-chrome
yay -S visual-studio-code-bin

# Ativando o modo performance
sudo systemctl enable --now power-profiles-daemon
poweprofilesctl set performance

# Ativando o bluetooth
blue "\nAltere o AutoEnable do Bluetooth.\n"
sleep 3
sudo nano /etc/bluetooth/main.conf
sleep 3
sudo systemctl start bluetooth.service

# Ativando o PulseAudio
sudo systemctl start pulseaudio

# Ativando o Wi-Fi
sudo systemctl enable --now networkmanager
sudo systemctl enable networkmanager  
sudo systemctl start networkmanager

# Instalando o VirtualBox
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
yay -Syy
yay -S virtualbox-ext-oracle
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service

sudo gpasswd -a $USER input

cd ~/repos
git clone https://github.com/tarcisioribeiro/Arch_Linux.git

mdkir -p ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/hypr ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/kitty ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/waybar ~/.config
cp -r ~/repos/Arch_Linux/hyperdots/wofi ~/.config

mkdir -p ~/.config/autostart
cp ~/repos/Arch_Linux/gpu/nvidia-force-full-composition.desktop ~/.config/autostart
cp ~/repos/Arch_Linux/gpu/nvidia-force-full-composition.sh ~/scripts

chsh -s /usr/bin/zsh
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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Oh My Bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# Starship
curl -sS https://starship.rs/install.sh | sh
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

source .bashrc

brew install eza glow tldr fd git-delta
nvm install 20.17.0

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
rm -r ~/.config/nvim_old

sudo cp ~/repos/Arch_Linux/fonts/Roboto-Regular.ttf /usr/share/fonts

cd ~
cp ~/repos/Arch_Linux/wallpapers/*.png ~/Pictures/

cd ~/Downloads/
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
mv gtk-master Dracula
mv Dracula ~/.themes
rm master.zip
cd ~/Downloads
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install -n dracula

gsettings set org.gnome.desktop.interface font-name "Roboto Regular"
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"       
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "dracula-dark"