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

blue "\nComeçando a instalação do KVM...\n"

sleep 3

sudo pacman -Syyu
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs ebtables vde2 openbsd-netcat
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service

red "\nDescomente as seguintes linhas:\n\n unix_sock_group = "libvirt" \n unix_sock_rw_perms = "0777" \n"

sleep 3

sudo nano /etc/libvirt/libvirtd.conf

sudo usermod -aG libvirt $USER
sudo systemctl restart libvirtd.service

green "\nInstalação do KVM concluída.\n"

sleep 3

blue "\nGerando chave SSH...\n"

ssh-keygen

blue "\nInstalando o snap...\n"

sleep 3

cd ~/Downloads
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si

sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap

green "\nInstalação do snap concluída. Recomendamos que reinicie a máquina antes de instalar os programas.\n"
