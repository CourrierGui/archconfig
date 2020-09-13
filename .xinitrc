#!/bin/sh

xrandr --auto

[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"

exec dbus-launch ~/.local/bin/startdwm
