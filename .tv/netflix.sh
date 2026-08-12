#!/bin/bash
URL="${1:-https://flixer.su}"
NEW_NAME="netflix"

# Path to the Zen executable (adjust if you have a permanent installation path)
ZEN_BIN="$HOME/pkg/zen.AppImage"

i3-msg "workspace ai"

# Launch Zen browser with the URL
i3-msg "exec $ZEN_BIN --new-window '$URL' &"
sleep 3

# Get window ID of the newly opened Zen window (matching 'zen' or the window title)
WIN_ID=$(wmctrl -l | grep -iE "zen|lumo" | tail -1 | awk '{print $1}')

if [ -n "$WIN_ID" ]; then
    wmctrl -i -r "$WIN_ID" -N "$NEW_NAME"
fi

