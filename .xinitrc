#!/bin/sh

dunst &
asdf
sleep 2
hsetroot -solid black
compton -b --backend=glx
exec spectrwm
