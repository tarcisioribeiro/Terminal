#!/usr/bin/bash
title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

echo "
title_red "Instalação - Parte 2"

echo ""
title_blue "Instalando o OH-My-Zsh.."

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sleep 5

cd ~
mkdir -p ~/repos
mkdir -p ~/.icons
mkdir -p ~/.themes
cd ~/repos
git clone https://github.com/tarcisioribeiro/ExpenseLit.git
git clone https://github.com/tarcisioribeiro/Password_Manager.git

cp ~/repos/Terminal/customization/zsh/ubuntu_server_zshrc ~
mv ~/ubuntu_server_zshrc ~/.zshrc
cp ~/repos/Terminal/customization/zsh/ubuntu_server_zsh_aliases ~
mv ~/ubuntu_server_zsh_aliases ~/.zsh_aliases
cp ~/repos/Terminal/customization/git/.gitconfig ~
cp ~/repos/Terminal/customization/tmux/.tmux.conf ~
mkdir -p ~/.config/autostart
cp ~/repos/Terminal/customization/starship/starship.toml ~/.config
cd ~/Downloads
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
cp -r zsh-master/dracula.zsh-theme ~/.oh-my-zsh/themes
cp -r zsh-master/lib ~/.oh-my-zsh/themes/
rm -r zsh-master/
rm master.zip
wget https://github.com/dracula/zsh-syntax-highlighting/archive/master.zip
unzip master.zip
cp zsh-syntax-highlighting-master/zsh-syntax-highlighting.sh ~/scripts
rm -r zsh-syntax-highlighting-master/
rm master.zip

cp ~/repos/Terminal/customization/bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
cd ~/Downloads
tar -zxf logo-ls_Linux_x86_64.tar.gz
cd ~/Downloads/logo-ls_Linux_x86_64
sudo cp logo-ls /usr/local/bin
cd ~/Downloads
rm logo-ls_Linux_x86_64.tar.gz
sudo rm -r logo-ls_Linux_x86_64/

sudo nala remove libmagickcore-6.q16-6 imagemagick-6.q16 imagemagick-6-common imagemagick idle-python3.10 -y

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

echo ""
read -p "Pressione ENTER para confirmar e sair."
