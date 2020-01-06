#!/bin/sh
xautolock -time 5 -locker xflock4 -notify 20 -notifier 'xset dpms force off' &
xautolock -time 7 -locker "systemctl suspend"
