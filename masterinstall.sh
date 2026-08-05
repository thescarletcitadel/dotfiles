#!/bin/bash

# Update package database and upgrade existing packages
sudo pacman -Syyu --noconfirm

# Install kernel headers (required for nvidia-open-dkms)
sudo pacman -S linux-headers --noconfirm

# Install packages individually so failures don't stop the rest

PACKAGE = ("firefox" "gimp" "playerctl" "sudo" "pamcan" -"S" --"noconfirm" "feh" "freecad" "neovim" "rofi" "redshift" "picom" "qbittorrent" "polybar" "pipewire" "pavucontrol" "nvidia"-"open"-"dkms" "nvidia"-"settings" "nvidia"-"prime" "kitty" "libnotify" "copyq" "prismlauncher" "rofi"-"nerdy" "steam" "ttf"-"jetbrains"-"mono"-"nerd" "ttf"-"jetbrains"-"mono" "vlc" "xviewer" "obs"-"studio" "imagemagick") 

for pkg in "${PACKAGE[@]}"; do 

	sudo pacman -S --noconfirm ${pkg}

done

sleep 1s

wget -O ente-auth.AppImage https://github.com/ente-io/ente/releases/download/auth-v4.4.22/ente-auth-v4.4.22-x86_64.AppImage

wget -O localsend.AppImage https://github.com/localsend/localsend/releases/download/v1.17.0/LocalSend-1.17.0-linux-x86-64.AppImage

wget -O via.AppImage https://github.com/the-via/releases/releases/download/v3.0.0/via-3.0.0-linux.AppImage 

wget -O wootility.AppImage https://api.wooting.io/public/wootility/download?os=linux&version=5.3.1

wget -O zen.AppImage https://github.com/zen-browser/desktop/releases/download/1.21.1b/zen-x86_64.AppImage

wget -O lug-helper.AppImage https://github.com/starcitizen-lug/lug-helper/releases/download/v4.14/LUG-Helper-v4.14.AppImage

# Make AppImages executable
chmod +x *.AppImage

mkdir ~/pkg

mv *.AppImage ~/pkg 

# Make scripts executable 
chmod +x *.sh

cp -r ~/custom_scripts/i3 ~/.config
cp -r ~/custom_scripts/kitty ~/.config
cp -r ~/custom_scripts/nvim ~/.config
cp -r ~/custom_scripts/picom ~/.config
cp -r ~/custom_scripts/polybar ~/.config
cp -r ~/custom_scripts/rofi ~/.config

notify-send "restarting system"

sleep 3s
sudo reboot
