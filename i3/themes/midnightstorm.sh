#!/bin/bash

# 1. Define the list of OLD colors you want to replace
# (Space separated inside parentheses)
OLD_COLORS=("ff0000" "3cdeff" "e76f51" "0800ff" "c33e2d" "8a1618" "e2ac2e" "8600e5")


name="midnightstorm"

# 2. Define the NEW color
NEW_COLOR="ba1e21"

# 3. Loop through the list and replace each one
for old in "${OLD_COLORS[@]}"; do
    # Use double quotes so $old expands to the actual color code
    # Use 'g' flag to replace ALL occurrences on the line
    
    # Rofi
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/rofi/material.rasi
    
    # i3
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/i3/config
    
    # Polybar
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/polybar/config.ini
done

# 4. Rest of your script remains the same
rm -rf ~/.config/nvim/lua/plugins/colors.lua
cp -r ~/.config/i3/themes.nvim/$name.lua ~/.config/nvim/lua/plugins/colors.lua

feh --bg-scale ~/.config/i3/backgrounds/$name.png
i3-msg restart
