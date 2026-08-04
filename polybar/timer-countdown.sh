#!/bin/bash

STATE_DIR="/dev/shm/.timer"
TIME_FILE="$STATE_DIR/time_remaining"
RUNNING_FILE="$STATE_DIR/is_running"

while true; do
    sleep 1

    if [ ! -f "$RUNNING_FILE" ]; then
        continue
    fi

    if [ ! -f "$TIME_FILE" ]; then
        continue
    fi

    remaining=$(cat "$TIME_FILE")

    if [ $remaining -le 0 ]; then
        rm -f "$RUNNING_FILE" "$TIME_FILE"
        notify-send "Timer Complete!" "Your timer has finished"
        break
    fi

    echo $((remaining - 1)) > "$TIME_FILE"
done
