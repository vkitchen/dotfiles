#!/usr/bin/env bash

filename="$HOME/Pictures/%Y-%m-%d-%T_\$wx\$h.png"

screenshot() {
	case $1 in
	full)
		scrot -m "$filename" 
		;;
	window)
		scrot -s "$filename"
		;;
	*)
		;;
	esac;
}

screenshot $1
