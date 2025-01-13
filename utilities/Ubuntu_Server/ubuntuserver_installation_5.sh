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

title_blue "Instalando pacotes através do brew..."

brew install eza glow tldr fd git-delta

sleep 5

nvm install 20.17.0
