#!/bin/bash

OLD_COLORS=("e2ac2e" "c33e2d" "0800ff" "e76f51" "ff0000" "ba1e21" "8600e5")



NEW_COLOR="3cdeff"

for old in "${OLD_COLORS[@]}"; do
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/rofi/material.rasi
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/i3/config
    
    sed -i "s/${old}/${NEW_COLOR}/g" /home/crimson/.config/polybar/config.ini
done

rm -rf ~/.config/nvim/lua/plugins/colors.lua
cp -r ~/.config/i3/themes.nvim/cipher.lua ~/.config/nvim/lua/plugins/colors.lua

feh --bg-scale ~/.config/i3/backgrounds/cipher.png
i3-msg restart


