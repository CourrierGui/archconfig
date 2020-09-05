#!/bin/sh

xrandr --auto

[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"

exec ~/.local/bin/startdwm
