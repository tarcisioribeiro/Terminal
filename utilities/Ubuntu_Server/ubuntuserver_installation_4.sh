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
title_red "Instalação - Parte 4"

git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mv ~/.config/nvim ~/.config/nvim_old
cp -r ~/repos/Terminal/customization/nvim ~/.config
cp ~/repos/Terminal/customization/bash/ubuntu_server_bashrc ~
mv ~/ubuntu_server_bashrc ~/.bashrc
cp ~/repos/Terminal/customization/bash/ubuntu_server_bash_aliases ~
mv ~/ubuntu_server_bash_aliases ~/.bash_aliases

echo ""
title_blue "Shells personalizados."

echo ""
read -p "Pressione ENTER para confirmar e sair."
