#!/bin/bash

NOTES_DIR="/mnt/notes"
TERMINAL="kitty -e" 

mkdir -p "$NOTES_DIR"
cd "$NOTES_DIR" || exit 1

# 1. Find .md files, strip the leading './', and remove the '.md' extension for the menu
SELECTION=$(find . -type f -name "*.md" -not -path '*/.*' | sed -e 's|^\./||' -e 's|\.md$||' | rofi -dmenu -p "Notes:")

if [ -z "$SELECTION" ]; then
    exit 0
fi

# 2. Automatically append .md to the selection for Neovim to open/create
$TERMINAL nvim "$NOTES_DIR/$SELECTION.md"
