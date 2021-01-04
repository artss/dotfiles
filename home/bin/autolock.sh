#!/bin/sh

exit 0

xset dpms force on

#xautolock \
#  -time 1 \
#  -locker "pacmd list-sink-inputs|grep RUNNING || xflock4" \
#  -notify 20 \
#  -notifier "notify-send -i /usr/share/icons/Papirus/48x48/apps/gnome-power-manager.svg 'Power' 'Screen is about to be locked'" \
#  -killtime 10 \
#  -killer "grep closed /proc/acpi/button/lid/LID0/state && systemctl suspend"

xset s 10 5
xss-lock \
  -n "notify-send -i /usr/share/icons/Papirus/48x48/apps/gnome-power-manager.svg 'Power' 'Screen is about to be locked'" \
   -- \
   bash -c 'xflock4 &; sleep 5; grep closed /proc/acpi/button/lid/LID0/state && systemctl suspend'
