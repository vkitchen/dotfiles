#!/usr/bin/env bash

packages=(
  tilix
  fish
  thunderbird
  tmux
  neovim
  seahorse
  libXext-devel
  libX11-devel
  libXt-devel
  gstreamer1-libav
  gstreamer1-plugins-bad-nonfree
)

function enable_rpmfusion {
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E '%fedora').noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E '%fedora').noarch.rpm
}

function install_packages {
  sudo dnf install -y ${packages[*]}
  # install plan9port
  pushd /usr/local
  sudo git clone 'https://github.com/9fans/plan9port'
  sudo mv plan9port plan9
  sudo chown -R $USER:$GROUPS plan9
  pushd /usr/local/plan9
  sudo ./INSTALL
  popd
  popd
  # use neovim as vim
  pushd /usr/bin
  sudo ln -s nvim vim
  popd
  # set fish as default shell
  sudo usermod -s `which fish` $USER
}

function configure_git {
  git config --global user.name "Vaughan Kitchen"
  git config --global user.email "v.kitchen@gnoms.org"
}

function copy_configs {
  mkdir -p ~/.config/fish
  cp config.fish ~/.config/fish/config.fish
  mkdir -p ~/.config/nvim
  cp init.vim ~/.config/nvim/init.vim
}

cp -r bin ~/
sudo dnf upgrade -y
enable_rpmfusion
install_packages
configure_git
copy_configs
