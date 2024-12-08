#!/usr/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.bashrc

brew install eza glow tldr fd git-delta
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
cp repos/Terminal/customization/bash/.bashrc ~
cp repos/Terminal/customization/bash/.bash_aliases ~

source ~/.bashrc
