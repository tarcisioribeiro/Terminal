#!/usr/bin/bash
title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border "$1")\033[0m"
}

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

title_blue "\nSaia do zsh pelo comando exit e carregue o bash.\n"

sleep 5
