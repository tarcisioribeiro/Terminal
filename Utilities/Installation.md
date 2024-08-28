# Instalação do Ubuntu 22.04

## Atualizando repositórios

* Execute os comandos abaixo para atualizar os repositórios e programas:

        sudo apt update
        sudo apt upgrade -y
        sudo apt install nala

## Instalando pacotes essenciais

* Instale os pacotes essenciais:

        sudo nala install build-essential git neofetch curl tilix neovim wget mysql-server net-tools btop flatpak gnome-software-plugin-flatpak p7zip-full p7zip-rar gnome-tweaks gnome-shell-extension-manager python3-venv python3-pip python3.10-full python3.10-dev dkms perl gcc make default-libmysqlclient-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev llvm xz-utils tk-dev libffi-dev liblzma-dev python3-openssl ubuntu-restricted-extras timeshift bat gnome-sushi gdebi libreoffice thunderbird ruby-full nodejs npm fzf

## Atualizando o NodeJS

* Execute os comandos abaixo para atualizar o **NodeJS** e **NPM**:

        sudo npm install npm@latest -g
        sudo npm install -g typescript

## Configurando o servidor MySQL

* Execute os dois comandos abaixo para habilitar o acesso ao **MySQL** como root:

        sudo mysql
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'orrARDrdr27!';

## Instalando e tornando o ZSH padrão

* Execute os comandos abaixo para instalar e tornar o **ZSH** padrão:

        sudo nala install zsh -y
        chsh -s /usr/bin/zsh
        zsh

## Instalando o Oh My ZSH

* Execute os comandos abaixo para instalar o **Oh My ZSH**:

        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## Instalando o Oh My Posh

* Execute os comandos abaixo para instalar o **Oh My Posh**:

        sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
        sudo chmod +x /usr/local/bin/oh-my-posh
        mkdir ~/.poshthemes
        wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
        unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
        chmod u+rw ~/.poshthemes/*.omp.*
        rm ~/.poshthemes/themes.zip

## Configurando o git

* Comandos para configurar o **git**:

        git config --global user.name "tarcisioribeiro" && git config --global user.email "tarcisio.ribeiro.1840@hotmail.com"

## Criando diretórios e clonando repositórios

* Execute os comandos abaixo para configurar os diretórios e baixar os repositórios:

        cd ~ && mkdir repos .icons .themes && cd repos
        git clone https://github.com/tarcisioribeiro/Terminal.git
        git clone https://github.com/tarcisioribeiro/Finances_Controller.git

## Instalando o logo-ls

* Comandos para instalar o **logo-ls**:

        cd ~
        cp repos/Terminal/Customization/Bash/tj-linux.omp.json /home/tarcisio/.poshthemes
        cp repos/Terminal/Customization/Bash/logo-ls_Linux_x86_64.tar.gz ~/Downloads
        cd ~/Downloads
        tar -zxf logo-ls_Linux_x86_64.tar.gz
        cd ~/Downloads/logo-ls_Linux_x86_64
        sudo cp logo-ls /usr/local/bin

## Configurando o ZSH

* Editando o arquivo de inicialização:

        cd ~
        nano .zshrc

* Comente a linha **ZSH_THEME**;

* Adicione o restante ao arquivo **.zshrc**:

        plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

        if [ -f ~/.zsh_aliases ]; then
            . ~/.zsh_aliases
        fi

        eval "$(oh-my-posh init zsh --config ~/.poshthemes/dracula.omp.json)"

## Criando os aliases


* Comandos para criar os **aliases**:

        touch .zsh_aliases
        echo "alias ls='logo-ls'" >> .zsh_aliases
        echo "alias py='python3'" >> .zsh_aliases
        echo "alias cls='clear'" >> .zsh_aliases
        echo "alias ipconfig='ifconfig'" >> .zsh_aliases
        echo "alias mysql='mysql -uroot -porrARDrdr27!'" >> .zsh_aliases
        echo "alias mysqldump='mysqldump -uroot -porrARDrdr27!'" >> .zsh_aliases
        echo "alias bat='batcat --theme="Dracula"'" >> .zsh_aliases
        echo "alias vim='nvim'" >> .zsh_aliases
        echo "alias ssh_smartphone='ssh u0_a4@192.168.2.101 -p 8022'" >> .zsh_aliases
        echo "alias eza='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'" >> .zsh_aliases
        echo "alias tree='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --tree'" >> .zsh_aliases


## Configurando monitores

* Criando pastas:

        cd ~
        mkdir scripts
        cd .config && mkdir autostart
        cd ~/scripts

* Criando o executável:

        touch nvidia-force-full-composition.sh
        echo '#!/bin/bash' >> nvidia-force-full-composition.sh
        echo "nvidia-settings --assign CurrentMetaMode="$(nvidia-settings -q CurrentMetaMode -t|tr '\n' ' '|sed -e 's/.*:: \(.*\)/\1\n/g' -e 's/}/, ForceCompositionPipeline = On, ForceFullCompositionPipeline=On}/g')" > /dev/null" >> nvidia-force-full-composition.sh
        sudo chmod +x nvidia-force-full-composition.sh

* Criando o atalho:

        cd ~/.config/autostart
        touch nvidia-force-full-composition.desktop
        echo '[Desktop Entry]' >> nvidia-force-full-composition.desktop
        echo 'Type=Application' >> nvidia-force-full-composition.desktop
        echo 'Name=nvidia-force-full-compositon' >> nvidia-force-full-composition.desktop
        echo 'Exec=/home/tarcisio/scripts/nvidia-force-full-composition.sh' >> nvidia-force-full-composition.desktop
        sudo chmod +x nvidia-force-full-composition.desktop

## Configurando o terminal Tilix

* Comandos para baixar o tema 'Dracula' para o **Tilix**:

        cd ~/.config && mkdir tilix && cd tilix && mkdir schemes
        wget  -qO $HOME"/.config/tilix/schemes/dracula.json" https://git.io/v7QaT

## Configurando o Flatpak

* Instalando programas via **Flatpak**:

        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        sudo reboot now
        flatpak install flathub org.videolan.VLC
        flatpak install flathub com.obsproject.Studio
        flatpak install flathub io.github.shiftey.Desktop

## Removendo pacotes indesejados

* Remova os seguintes pacotes:

        sudo nala remove libmagickcore-6.q16-6 imagemagick-6.q16 imagemagick-6-common imagemagick idle-python3.10

## Instalando o neovim

* Comandos para baixar o **Neovim**:

        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux64.tar.gz

* Adicionar ao .zshrc:

        export PATH="$PATH:/opt/nvim-linux64/bin"

## Atualizando o NodeJS

* Comandos para atualizar o **NodeJS**:

        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
        source ~/.zshrc
        nvm install 20.17.0

## Instalando o Homebrew

* Comando para baixar o **Brew**:    
    
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

* Adicione ao **.zshrc**:

        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        echo 'export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"' >> ~/.zshrc

## Instalando TPM

* Instalando o TPM:

        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

* Configurando o tmux:

        nvim .tmux.conf

* Adicione o seguinte conteúdo ao arquivo:

        set -g @plugin 'tmux-plugins/tpm'
        set -g @plugin 'tmux-plugins/tmux-sensible'
        run '~/.tmux/plugins/tpm/tpm'

## Instalando pacotes do Glow

* Instale os pacotes **Brew**:

        brew install eza glow
