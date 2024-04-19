#!/bin/sh

# link to standard home directory type dotfile
hlink() {
	# -e expands links. fails if link is broken
	if [ -e "$HOME/.$1" -o -L "$HOME/.$1" ]; then
		echo "rm ~/.$1"
		rm ~/.$1
	fi
	ln -s $PWD/$1 ~/.$1
}

hlink config/fish/config.fish
hlink config/mako/config
hlink config/nvim/init.lua
hlink config/sway/config
hlink tmux.conf
