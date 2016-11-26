#!/bin/sh

connected=`cat /sys/class/drm/card0-VGA-1/status`

export DISPLAY=":0.0"

if test $connected = "connected"; then
    xrandr --output VGA1 --right-of eDP1 --auto
else
    xrandr --output VGA1 --off
fi
