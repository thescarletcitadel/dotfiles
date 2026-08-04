#!/bin/bash
CONFIG="$HOME/.config/i3/config"

# We'll read the file line by line to pair comments with bindings
prev_line=""

while IFS= read -r line; do
    # Check if current line is a binding
    if [[ "$line" =~ ^bindsym|^bindcode ]]; then
        key=$(echo "$line" | sed 's/bind\(sym\|code\) //' | awk '{print $1}')
        command=$(echo "$line" | sed 's/bind\(sym\|code\) [^ ]* //')
        
        # Check if the previous line was a comment
        if [[ "$prev_line" =~ ^# ]]; then
            # Remove the '#' and trim whitespace
            desc=$(echo "$prev_line" | sed 's/^#\s*//' | xargs)
            output="$desc [$key] → ${command:0:40}"
        else
            # No description found
            output="[$key] → ${command:0:40}"
        fi
        
        echo "$output"
    fi
    
    # Store current line for next iteration
    prev_line="$line"
done < "$CONFIG" | \
rofi -dmenu -p "i3 Keybindings" -i -width 45 -lines 15 -font "monospace 10"
