sudo apt update
sudo apt upgrade -y
sudo apt install nala

sleep 1

sudo nala install build-essential git neofetch curl tilix tmux wget mysql-server net-tools btop flatpak python3-venv python3-tk python3-pip python3.10-full python3.10-dev dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl timeshift bat gdebi ruby-full nodejs npm fzf gnome-tweaks gnome-shell-extension-manager

sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'orrARDrdr27!';"

sudo nala install zsh -y
chsh -s /usr/bin/zsh
zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 3
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 3
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 3

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

cd ~
mkdir -p ~/repos
mkdir -p ~/.icons
mkdir -p ~/.themes
cd ~/repos
sleep 3
git clone https://github.com/tarcisioribeiro/ExpenseLit.git
sleep 3
git clone https://github.com/tarcisioribeiro/Password_Manager.git
sleep 3

cd ~
cp repos/Terminal/customization/zsh/.zshrc ~
sleep 1
cp repos/Terminal/customization/zsh/.zsh_aliases ~
sleep 1
cp repos/Terminal/customization/bash/.bashrc ~
sleep 1
cp repos/Terminal/customization/bash/.bash_aliases ~
sleep 1
cp repos/Terminal/customization/git/.gitconfig ~
sleep 1
cp repos/Terminal/customization/tmux/.tmux.conf ~
sleep 1
mkdir -p ~/.config/autostart
sleep 1
cp repos/Terminal/customization/starship/starship.toml ~/.config

mkdir -p ~/scripts
cp /mnt/sda1/scripts/zsh-syntax-highlighting.sh ~/scripts

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

cd ~
cd .config && mkdir autostart

cd ~/scripts
touch nvidia-force-full-composition.sh
echo '#!/bin/bash' >> nvidia-force-full-composition.sh
echo "nvidia-settings --assign CurrentMetaMode="$(nvidia-settings -q CurrentMetaMode -t|tr '\n' ' '|sed -e 's/.*:: \(.*\)/\1\n/g' -e 's/}/, ForceCompositionPipeline = On, ForceFullCompositionPipeline=On}/g')" > /dev/null" >> nvidia-force-full-composition.sh
sudo chmod +x nvidia-force-full-composition.sh

cd ~/.config/autostart
touch nvidia-force-full-composition.desktop
echo '[Desktop Entry]' >> nvidia-force-full-composition.desktop
echo 'Type=Application' >> nvidia-force-full-composition.desktop
echo 'Name=nvidia-force-full-compositon' >> nvidia-force-full-composition.desktop
echo 'Exec=/home/tarcisio/scripts/nvidia-force-full-composition.sh' >> nvidia-force-full-composition.desktop
sudo chmod +x nvidia-force-full-composition.desktop

cd ~/.config && mkdir tilix && cd tilix && mkdir schemes
wget  -qO $HOME"/.config/tilix/schemes/dracula.json" https://git.io/v7QaT

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sleep 3
sudo nala remove libmagickcore-6.q16-6 imagemagick-6.q16 imagemagick-6-common imagemagick idle-python3.10
sleep 1curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sleep 1

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.zshrc

brew install eza glow tldr fd git-delta
sleep 3
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
sleep 1
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sleep 1
curl -sS https://starship.rs/install.sh | sh
sleep 1
mv ~/.config/nvim ~/.config/nvim_old
sleep 1
cp -r ~/repos/Terminal/customization/nvim ~/.config