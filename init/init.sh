#!/usr/bin/env bash

packages=(
  tilix
  fish
  thunderbird
  tmux
  neovim
  seahorse
)

# Fish Config
read -r -d '' fishConfig <<'EOF'
set fish_greeting

set -x PLAN9 /usr/local/plan9
set -x PATH $PLAN9/bin $PATH
EOF


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

sudo dnf upgrade -y
install_packages
configure_git
