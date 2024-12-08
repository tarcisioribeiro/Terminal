#!/usr/bin/bash

brew install eza glow tldr fd git-delta
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
cp ~/repos/Terminal/customization/bash/.bashrc ~
cp ~/repos/Terminal/customization/bash/.bash_aliases ~
