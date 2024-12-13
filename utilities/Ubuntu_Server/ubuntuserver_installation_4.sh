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

brew install eza glow tldr fd git-delta
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
cp ~/repos/Terminal/customization/bash/ubuntu_server_bashrc ~
mv ~/ubuntu_server_bashrc ~/.bashrc
cp ~/repos/Terminal/customization/bash/ubuntu_server_bash_aliases ~
mv ~/ubuntu_server_bash_aliases ~/.bash_aliases

blue "\nAgora, faça os testes.\n"

sleep 3
