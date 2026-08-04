#!/bin/bash

#option=$(printf "cipher\ncrimsonwaves\nrosepine\nfelix\nmidnightstorm\nfirecracker\nraven\nqueenofthorns" | rofi \
#    -dmenu \
#    -config ~/.config/rofi/themes.rasi \
#    -p "Wallpaper")
#
#case "$option" in 
#    "crimsonwaves") /home/crimson/.config/i3/themes/crimonwaves.sh ;;
#    "cipher") /home/crimson/.config/i3/themes/cipher.sh ;;
#    "rosepine") /home/crimson/.config/i3/themes/rosepine.sh;;
#    "felix") /home/crimson/.config/i3/themes/felix.sh;;
#    "midnightstorm") /home/crimson/.config/i3/themes/midnightstorm.sh;;
#    "firecracker") /home/crimson/.config/i3/themes/firecracker.sh;;
#    "raven") /home/crimson/.config/i3/themes/raven.sh;;
#    "queenofthorns") /home/crimson/.config/i3/themes/queenofthorns.sh;;
#
#esac




option=$(printf "firecracker\nfelix" | rofi \
    -dmenu \
    -config ~/.config/rofi/themes.rasi \
    -p "Wallpaper")



case "$option" in
	"firecracker") feh --bg-scale /home/crimson/.config/i3/backgrounds/firecracker.png ;;
	"felix") feh --bg-scale /home/crimson/.config/i3/backgrounds/felix.png ;;

esac
