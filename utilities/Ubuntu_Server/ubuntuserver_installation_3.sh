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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/repos/Terminal/customization/bash/.bashrc ~
cp ~/repos/Terminal/customization/bash/.bash_aliases ~

blue "\nSaia do zsh pelo comando exit e carregue o bash.\n"

sleep 5
