#!/bin/bash

# Update package database and upgrade existing packages
sudo pacman -Syu --noconfirm

# Install kernel headers (required for nvidia-open-dkms)
sudo pacman -S linux-headers --noconfirm

# Install packages individually so failures don't stop the rest
echo "Installing Firefox..."
sudo pacman -S --noconfirm firefox

echo "installing gimp"
sudo pacman -S --noconfirm gimp

echo "installing playerctl"
sudo pacman -S --noconfirm playerctl

echo "installing feh..."
sudo pamcan -S --noconfirm feh

echo installing freecad 
sudo pacman -S --noconfirm freecad

echo "Installing Neovim..."
sudo pacman -S --noconfirm neovim

echo "Installing Rofi..."
sudo pacman -S --noconfirm rofi

echo "Installing Redshift..."
sudo pacman -S --noconfirm redshift

echo "Installing Picom..."
sudo pacman -S --noconfirm picom

echo "Installing qBittorrent..."
sudo pacman -S --noconfirm qbittorrent

echo "Installing Polybar..."
sudo pacman -S --noconfirm polybar

echo "Installing Pipewire..."
sudo pacman -S --noconfirm pipewire

echo "Installing Pavucontrol..."
sudo pacman -S --noconfirm pavucontrol

echo "Installing NVIDIA Drivers..."
sudo pacman -S --noconfirm nvidia-open-dkms nvidia-settings nvidia-prime

echo "Installing Kitty..."
sudo pacman -S --noconfirm kitty

echo "Installing Libnotify..."
sudo pacman -S --noconfirm libnotify


echo "Installing CopyQ..."
sudo pacman -S --noconfirm copyq

echo "Installing Prism Launcher..."
sudo pacman -S --noconfirm prismlauncher

echo "Installing Rofi-Nerdy..."
sudo pacman -S --noconfirm rofi-nerdy

echo "Installing Steam..."
sudo pacman -S --noconfirm steam

echo "Installing Fonts..."
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd ttf-jetbrains-mono

echo "Installing VLC..."
sudo pacman -S --noconfirm vlc

echo "Installing Xviewer..."
sudo pacman -S --noconfirm xviewer

echo "installing obs-studio"
sudo pacman -S --noconfirm obs-studio

echo "installing imagemagick"
sudo pacman -S --noconfirm imagemagick

sleep 1s

# Download AppImages
echo "Downloading AppImages..."
wget -O ente-auth.AppImage https://github.com/ente-io/ente/releases/download/auth-v4.4.22/ente-auth-v4.4.22-x86_64.AppImage

wget -O localsend.AppImage https://github.com/localsend/localsend/releases/download/v1.17.0/LocalSend-1.17.0-linux-x86-64.AppImage

wget -O via.AppImage https://github.com/the-via/releases/releases/download/v3.0.0/via-3.0.0-linux.AppImage 

wget -O wootility.AppImage https://api.wooting.io/public/wootility/download?os=linux&version=5.3.1

wget -O zen.AppImage https://github.com/zen-browser/desktop/releases/download/1.21.1b/zen-x86_64.AppImage

wget -O lug-helper.AppImage https://github.com/starcitizen-lug/lug-helper/releases/download/v4.14/LUG-Helper-v4.14.AppImage

# Make AppImages executable
chmod +x *.AppImage

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
