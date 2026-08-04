#!/bin/bash

STATE_DIR="/dev/shm/.timer"
TIME_FILE="$STATE_DIR/time_remaining"

if [ -f "$TIME_FILE" ] && [ -f "$STATE_DIR/is_running" ]; then
    remaining=$(cat "$TIME_FILE")
    h=$((remaining / 3600))
    m=$(((remaining % 3600) / 60))
    s=$((remaining % 60))

    printf "⏱ %02d:%02d:%02d" $h $m $s
else
    echo ""
fi
