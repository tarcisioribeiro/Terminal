# Instalando o Ubuntu no WSL

- Agora, siga executando um a um os comandos abaixo:

    `sudo apt update`

    `sudo apt full-upgrade -y`

    `mkdir repos`

- Instale os pacotes necessários através deste comando:

    `sudo apt install build-essential nautilus gedit gnome-tweaks unzip python3 python3-pip python-is-python3 yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound nodejs npm php screenfetch net-tools font-manager -y`

A partir de agora, iremos instalar o Windows Terminal e configurar o perfil do Ubuntu.

- Realizar o download do Windows Terminal na Microsoft Store;
- Abrir o Windows Terminal, e definir o Ubuntu como padrão.

Partindo para as últimas configurações, abra o Ubuntu e execute os seguintes comandos para adicionar o Oh-My-Posh:

- Estes comandos abaixo devem ser executados um a um:

    `sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh`

    `sudo chmod +x /usr/local/bin/oh-my-posh`

- Crie as pastas e copie os arquivos:

    `mkdir ~/.poshthemes`

    `wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip`

    `unzip ~/.poshthemes/themes.zip -d ~/.poshthemes`

    `chmod u+rw ~/.poshthemes/*.omp.*`

    `rm ~/.poshthemes/themes.zip`

- Configure o git:

    `git config --global user.name ""`

    `git config --global user.email ""`

- Navegue para o diretório de repositórios, e clone o seguinte link, após isso copie o arquivo **tj-linux.omp.json**, que está na pasta Customization:

    `cd ~`

    `cd repos`

    `git clone https://github.com/tarcisioribeiro/WinTerminal_OhMyPosh.git`

    `cd WinTerminal_OhMyPosh`

    `cd Customization`

    `cd Bash`

    `cp tj-linux.omp.json /home/$USER/.poshthemes`

    `cd ~`

- Edite o .bashrc:

    `nano .bashrc`

- Adicione a seguinte linha ao final do arquivo e salve o arquivo:

   `eval "$(oh-my-posh init bash --config ~/.poshthemes/tj-linux.omp.json)"`

- Recarregue o terminal:

    `exec bash`

- Copie o arquivo logo-ls para o diretório bin:

    `cd ~`

    `cd repos`

    `cd WinTerminal_OhMyPosh`

    `cd Customization`

    `cd Bash`

    `cp logo-ls_Linux_x86_64.tar.gz $HOME`

    `cd ~`

    `tar -zxf logo-ls_Linux_x86_64.tar.gz`

    `cd logo-ls_Linux_x86_64`

    `sudo cp logo-ls /usr/local/bin`

    `cd ~`
