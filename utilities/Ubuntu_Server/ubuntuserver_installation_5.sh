#!/usr/bin/bash
title_red() {
    echo -e "\033[31m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_green() {
    echo -e "\033[32m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

title_blue() {
    echo -e "\033[34m$(toilet --font pagga --filter border --width 200 "$1")\033[0m"
}

echo ""
title_red "Instalação - Parte 5"

echo ""
title_blue "Instalando pacotes através do brew..."

brew install eza glow tldr fd git-delta
nvm install 20.17.0

echo ""
title_green "Instalação Finalizada."

echo ""
read -p "Pressione ENTER para confirmar e sair."
