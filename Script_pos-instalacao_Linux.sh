#Salvar o arquivo em formato .sh, e executar com previlégios de adm.

#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #

URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
  snapd
  darktable
  ubuntu-restricted-extras
  virtualbox
  flameshot
  steam-installer
  steam-devices
  steam:i386
  brave
  discord
  code
  telegram-desktop
  wine
  kate
  libreoffice-l10n-pt-br
)

# ---------------------------------------------------------------------- #

# ----------------------------- REQUISITOS ----------------------------- #

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap (Driver Logitech)##
sudo apt-add-repository universe -y
sudo add-apt-repository ppa:obsproject/obs-studio -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE focal main"
# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #

## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Download e instalação de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

## Corrigindo pequenos erros de instalação
sudo apt --fix-broken install -y

# Instalando programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

# Instalando Wine
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## Remover programas ##
sudo apt remove gimp -y

## Instalando suporte Flatpak ##
sudo apt install gnome-software-plugin-flatpak

## Instalando pacotes Snap ##
sudo snap install spotify

# ---------------------------------------------------------------------- #

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

# ---------------------------------------------------------------------- #
