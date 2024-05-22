# Instalação Ubuntu Server 22.04

Após realizar a instalação padrão do Ubuntu Server, siga este passo a passo:

- Instale o gerenciador de pacotes **nala**:
	
	`sudo apt update -y`
	`sudo apt upgrade -y`
	`sudo apt install nala -y`

- Defina o horário do servidor para São Paulo - Brazil:

	 `sudo timedatectl set-timezone America/Sao_Paulo`

- Instale os pacotes essenciais:

	`sudo nala install git curl wget neofetch dkms perl build-essential -y`
	`sudo nala install python3.10-full python3.10-dev -y`
	`sudo nala install zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl -y`

