#!/usr/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

clear

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

clear

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.bashrc

brew install eza glow tldr fd git-delta
sleep 5
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
clear
sleep 1
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sleep 1
curl -sS https://starship.rs/install.sh | sh
sleep 1
mv ~/.config/nvim ~/.config/nvim_old
sleep 1
cp -r ~/repos/Terminal/customization/nvim ~/.config

cp repos/Terminal/customization/bash/.bashrc ~
sleep 1
cp repos/Terminal/customization/bash/.bash_aliases ~
sleep 1

source ~/.bashrc