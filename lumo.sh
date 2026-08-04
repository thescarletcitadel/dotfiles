#!/bin/bash
URL="${1:-https://lumo.proton.me}"
NEW_NAME="lumo"


i3-msg "workspace ai"

i3-msg "exec firefox --new-window "$URL" &"
sleep 3

# Get window ID of newly opened Firefox window
WIN_ID=$(wmctrl -l | grep -i firefox | tail -1 | awk '{print $1}')

if [ -n "$WIN_ID" ]; then
    wmctrl -i -r "$WIN_ID" -N "$NEW_NAME"
fi
