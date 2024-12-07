sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 1
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 1
clear

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sleep 1
sudo chmod +x /usr/local/bin/oh-my-posh
sleep 1
mkdir ~/.poshthemes
sleep 1
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sleep 1
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
sleep 1
chmod u+rw ~/.poshthemes/*.omp.*
sleep 1
rm ~/.poshthemes/themes.zip
clear

cd ~
mkdir -p ~/repos
mkdir -p ~/.icons
mkdir -p ~/.themes
cd ~/repos
sleep 1
git clone https://github.com/tarcisioribeiro/ExpenseLit.git
sleep 1
git clone https://github.com/tarcisioribeiro/Password_Manager.git
sleep 1
clear

cd ~
cp repos/Terminal/customization/zsh/.zshrc ~
sleep 1
cp repos/Terminal/customization/zsh/.zsh_aliases ~
sleep 1
cp repos/Terminal/customization/git/.gitconfig ~
sleep 1
cp repos/Terminal/customization/tmux/.tmux.conf ~
sleep 1
mkdir -p ~/.config/autostart
sleep 1
cp repos/Terminal/customization/starship/starship.toml ~/.config

cd ~
cp repos/Terminal/customization/zsh/tj-dracula.omp.json /home/tarcisio/.poshthemes
sleep 1
cp repos/Terminal/customization/bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
sleep 1
cd ~/Downloads
sleep 1
tar -zxf logo-ls_Linux_x86_64.tar.gz
sleep 1
cd ~/Downloads/logo-ls_Linux_x86_64
sleep 1
sudo cp logo-ls /usr/local/bin

sleep 5

sudo nala remove libmagickcore-6.q16-6 imagemagick-6.q16 imagemagick-6-common imagemagick idle-python3.10

clear

sleep 5

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sleep 1