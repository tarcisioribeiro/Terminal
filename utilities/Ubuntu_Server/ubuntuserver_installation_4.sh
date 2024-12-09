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
mkdir scripts && cd scripts
git clone https://github.com/dracula/zsh-syntax-highlighting.git
cp zsh-syntax-highlighting/zsh-syntax-highlighting.sh .
sudo rm -r zsh-syntax-highlighting

brew install eza glow tldr fd git-delta
nvm install 20.17.0
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
cp ~/repos/Terminal/customization/bash/.bashrc ~
cp ~/repos/Terminal/customization/bash/.bash_aliases ~

blue "\nAgora, faça os testes.\n"

sleep 5
