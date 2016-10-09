#!/bin/bash

wid=`xdotool getactivewindow`
max_state=`xprop -id $wid _NET_WM_STATE`

wmctrl -ir $wid -b remove,maximized_vert,maximized_horz
eval `xdotool getwindowgeometry --shell $wid`

new_x=1920
if [[ "$X" -ge "$new_x" ]]; then
  new_x=0
fi

xdotool windowmove $wid $new_x $Y
if [ -z "${max_state/*_NET_WM_STATE_MAXIMIZED_*/}" ]; then
  wmctrl -ir $wid -b add,maximized_vert,maximized_horz
fi

xdotool windowraise $wid
