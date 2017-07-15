#!/usr/bin/env bash

packages=(
  tilix
  fish
  thunderbird
  tmux
  neovim
  seahorse
  gstreamer1-libav
  gstreamer1-plugins-bad-nonfree
)

# Fish Config
read -r -d '' fishConfig <<'EOF'
set fish_greeting

set -x PLAN9 /usr/local/plan9
set -x PATH ~/bin $PLAN9/bin $PATH
EOF

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
  # configure fish and add plan9 to it
  mkdir -p ~/.config/fish
  echo "$fishConfig" > ~/.config/fish/config.fish
}

function configure_git {
  git config --global user.name "Vaughan Kitchen"
  git config --global user.email "v.kitchen@gnoms.org"
}

mkdir ~/bin
sudo dnf upgrade -y
enable_rpmfusion
install_packages
configure_git
