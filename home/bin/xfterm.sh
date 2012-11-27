#!/bin/bash

windowid=`xwininfo -root -tree|grep Xfce4-terminal|grep 19[0-9][0-9]|awk '{print $1}'`
echo $windowid

if [ "x$windowid" != "x" ]; then
    isunmapped=`xwininfo -id $windowid|grep IsUnMapped`
    echo $isunmapped
    if [ "x$isunmapped" != "x" ]; then
        xdotool windowmap $windowid
        xdotool windowsize $windowid 1920 1080
        xdotool windowraise $windowid
    else
        xdotool windowunmap $windowid
    fi
else
    xfce4-terminal --fullscreen
fi
