red() {
    echo -e "\033[31m$1\033[0m"
}
green() {
    echo -e "\033[32m$1\033[0m"
}

blue() {
    echo -e "\033[34m$1\033[0m"
}

blue "\nInstalando o OH-My-ZSH..\n"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sleep 3

blue "\nInstalando o Oh My Posh!\n"

sleep 3

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

cd ~
mkdir -p ~/repos
mkdir -p ~/.icons
mkdir -p ~/.themes
cd ~/repos
git clone https://github.com/tarcisioribeiro/ExpenseLit.git
git clone https://github.com/tarcisioribeiro/Password_Manager.git

cp ~/repos/Terminal/customization/zsh/ubuntu_zshrc ~
mv ~/ubuntu_zshrc ~/.zshrc
cp ~/repos/Terminal/customization/zsh/.zsh_aliases ~
cp ~/repos/Terminal/customization/git/.gitconfig ~
cp ~/repos/Terminal/customization/tmux/.tmux.conf ~
mkdir -p ~/.config/autostart
cp ~/repos/Terminal/customization/starship/starship.toml ~/.config

cp ~/repos/Terminal/customization/zsh/tj-dracula.omp.json /home/serveruser/.poshthemes
cp ~/repos/Terminal/customization/bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
cd ~/Downloads
tar -zxf logo-ls_Linux_x86_64.tar.gz
cd ~/Downloads/logo-ls_Linux_x86_64
sudo cp logo-ls /usr/local/bin
cd ~/Downloads
rm logo-ls_Linux_x86_64.tar.gz
sudo rm -r logo-ls_Linux_x86_64/

sudo nala remove libmagickcore-6.q16-6 imagemagick-6.q16 imagemagick-6-common imagemagick idle-python3.10 -y

sleep 3

blue "\nInstalado o Neovim...\n"

sleep 3

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
