#!/usr/bin/bash
brew install eza glow tldr fd git-delta

sleep 5

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

gsettings set org.gnome.desktop.interface font-name "Roboto Regular"
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"       
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
gsettings set org.gnome.desktop.interface icon-theme "dracula-dark"

sudo pacman -S python-pip

rmdir Documentos Imagens Vídeos Músicas Público Modelos

flatpak install flathub io.github.shiftey.Desktop
flatpak install flathub org.gimp.GIMP
