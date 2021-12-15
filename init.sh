#!/bin/sh

# link to standard home directory type dotfile
function hlink() {
	# -e expands links. fails if link is broken
	if [ -e "$HOME/.$1" -o -L "$HOME/.$1" ]; then
		echo "rm ~/.$1"
		rm ~/.$1
	fi
	ln -s $PWD/$1 ~/.$1
}

hlink config/nvim/init.vim
hlink cwmrc
hlink kshrc
hlink newsboat/urls
hlink profile
hlink tmux.conf
