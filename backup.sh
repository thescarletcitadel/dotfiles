#!/bin/bash

# Define source and destination
SOURCE_DIR="$HOME/.config"
BACKUP_DIR="$HOME/dotfiles"

# List of directories to back up
CONFIGS=("i3" "dunst" "picom" "polybar" "rofi" "nvim" "kitty")

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

echo "🚀 Starting dotfiles backup..."

# Loop through and copy each directory
for config in "${CONFIGS[@]}"; do
    if [ -d "$SOURCE_DIR/$config" ]; then
        echo "📦 Backing up: $config"
        # Using cp -r (recursive) and -p (preserve attributes)
        # Adjusting to copy the directory itself into ~/dotfiles
        cp -rp "$SOURCE_DIR/$config" "$BACKUP_DIR/"
    else
        echo "⚠️  Warning: $SOURCE_DIR/$config not found, skipping."
    fi
done

echo "✅ Backup complete! Your dotfiles are in $BACKUP_DIR"
