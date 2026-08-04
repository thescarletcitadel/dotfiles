#!/bin/bash

killall conky 2>/dev/null

sleep 60

if ! pgrep -x "picom" > /dev/null; then
    picom &
fi

sleep 2

conky -c /home/crimson/.config/conky/clock.conf &
conky -c /home/crimson/.config/conky/world.conf &
conky -c /home/crimson/.config/conky/sidebar.conf &
conky -c /home/crimson/.config/conky/clock2.conf &
conky -c /home/crimson/.config/conky/world2.conf &
conky -c /home/crimson/.config/conky/sidebar2.conf &

wait
