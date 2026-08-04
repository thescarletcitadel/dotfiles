#!/bin/bash
if playerctl status 2>/dev/null | grep -q "Playing"; then
    title=$(playerctl metadata title 2>/dev/null)
    artist=$(playerctl metadata artist 2>/dev/null)
    echo "${artist:-Unknown} - ${title:-Unknown}"
else
    echo "No media playing"
fi
