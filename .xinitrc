#!/bin/sh

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

dunst &
asdf
sleep 2
hsetroot -solid black
compton -b --backend=glx
ibus-daemon -xd
exec spectrwm
