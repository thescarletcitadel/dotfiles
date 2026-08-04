#!/bin/bash

# 1. Define the list of OLD colors you want to replace
# (Space separated inside parentheses)
OLD_COLORS=("3cdeff" "c33e2d" "e2ac2e" "e76f51" "ba1e21" "8600e5" "0800ff")

NEW_COLOR="ff0000"

for old in "${OLD_COLORS[@]}"; do
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/rofi/material.rasi
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/i3/config
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/polybar/config.ini
done

#rm -rf ~/.config/nvim/lua/plugins/colors.lua
#cp -r ~/.config/i3/themes.nvim/crimsonwaves.lua ~/.config/nvim/lua/plugins/colors.lua

feh --bg-scale ~/.config/i3/backgrounds/crimsonwaves.png
i3-msg restart

