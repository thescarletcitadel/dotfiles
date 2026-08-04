#!/bin/bash

options="Stop\nReset\nCancel"

input=$(echo -e "$options" | rofi -config ~/.config/rofi/timer.rasi -dmenu -p "type time to start:")

if [ -z "$input" ]; then
    exit 0
fi

# Process the input
case "$input" in
    [Ss]top)
        /usr/local/bin/timer.sh stop
        ;;
    [Rr]eset)
        /usr/local/bin/timer.sh reset
        ;;
    [Cc]ancel)
        echo "Action canceled."
        ;;
    *)
        clean_time=$(echo "$input" | sed -E 's/^[Ss]tart[[:space:]]+//')

        /usr/local/bin/timer.sh start "$clean_time"
        ;;
esac
