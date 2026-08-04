#!/bin/bash

option=$(printf "Lock\nPower Off\nRestart\nUpdate" | rofi \
    -dmenu \
    -config ~/.config/rofi/powermenu.rasi \
    -p "Power Menu")

case "$option" in 
    "Lock") i3lock -c 000000 ;;
    "Power Off") poweroff ;;
    "Restart") reboot ;;
    "Update") kitty --hold sudo pacman -Syu;;
esac
