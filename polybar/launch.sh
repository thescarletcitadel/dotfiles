#!/bin/bash

pkill polybar
sleep 0.1 


echo "starting polybar left"
polybar left &

echo "starting polybar right"
polybar right &

if ! pgrep -f "timer-countdown.sh"; then
    /usr/local/bin/timer-countdown.sh &
fi
