#!/bin/bash

windowid=`xwininfo -root -tree|grep -i xfce4-terminal|grep 19[0-9][0-9]|awk '{print $1}'`
#echo $windowid

if [ "x$windowid" != "x" ]; then
    isunmapped=`xwininfo -id $windowid|grep IsUnMapped`

    if [ "x$isunmapped" != "x" ]; then
        desktop=`xdotool get_desktop`
        xdotool set_desktop_for_window $windowid $desktop
        xdotool windowmap $windowid
        xdotool windowsize $windowid 1920 1080
        xdotool windowraise $windowid
    else
        xdotool windowunmap $windowid
    fi
else
    xfce4-terminal --fullscreen
fi
