#!/bin/bash

# Format: HH:MM
# Change "%H:%M" to whatever format you prefer (e.g., "%I:%M %p" for 12-hour)
TIME=$(date +"%r")

# Output the time
echo "$TIME"

# Optional: If you want Polybar to update every second, 
# you need to set interval=1 in the module config below.
# If you want a tooltip or alternate text on hover, you can use:
# echo "%{T2}%{+u}%{+b}%{+o}%{+c}%{+r}%{+l}%{+w}%{+s}%{+t}%{+a}%{+d}%{+f}%{+g}%{+h}%{+i}%{+j}%{+k}%{+m}%{+n}%{+p}%{+q}%{+r}%{+s}%{+t}%{+u}%{+v}%{+w}%{+x}%{+y}%{+z}"
# But for simple time, just the echo is enough.
