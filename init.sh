#!/usr/bin/env bash

packages=(
  man-pages
  bc
  tmux
  elinks
  vim
  spectrwm
  Xorg
  xorg-x11-xinit
  xorg-x11-drv-intel
  xorg-x11-drv-libinput
  firefox
  telegram-desktop
  st
  scrot
  pulseaudio
  alsa-utils
  mpv
  gimp
  inkscape
  pulseaudio-utils
  ranger
  sxiv
  NetworkManager-tui
  NetworkManager-wifi
  wine
  mutt
  spotify
  libreoffice
  weechat
  git
  moreutils
  nmap
  fish
  zathura
  zathura-ps
  zathura-pdf-mupdf
  python2-websocket-client
  isync
  bind-utils
  w3m
  antiword
  dunst
  msmtp
  @development-tools
  net-tools
  pciutils
  iwl7260-firmware
)

function add_repos {
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E '%fedora').noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E '%fedora').noarch.rpm
  sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
  sudo dnf enable dawid/better_fonts
}

function install_packages {
  sudo dnf install -y ${packages[*]}
  # set fish as default shell
  sudo usermod -s `which fish` $USER
}

function configure_git {
  git config --global user.name "Vaughan Kitchen"
  git config --global user.email "v.kitchen@gnoms.org"
}

cp -r bin ~/
sudo dnf upgrade -y
add_repos
install_packages
configure_git
