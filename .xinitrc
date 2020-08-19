#!/bin/sh

xrandr --auto

[ -f "/home/guillaume/.xprofile" ] && . "/home/guillaume/.xprofile"

exec ~/.local/bin/startdwm
