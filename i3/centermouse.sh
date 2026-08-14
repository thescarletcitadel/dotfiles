#!/bin/bash
# Get the active window ID geometry and move mouse to center
eval $(xdotool getactivewindow getwindowgeometry --shell)
if [ "$WIDTH" -gt 0 ] && [ "$HEIGHT" -gt 0 ]; then
    xdotool mousemove --window $WINDOW $((WIDTH / 2)) $((HEIGHT / 2))
fi
