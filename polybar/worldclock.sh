#!/bin/bash

# --- CONFIGURATION ---
# Format: "City Name|Timezone|Comment"
CITIES=(
    "Seattle|America/Los_Angeles|the boys"
    "Stockholm|Europe/Stockholm|Rayne suli"
    "Sydney|Australia/Sydney|argonian"
    "London|Europe/London|yumi"
    "Denver|America/Denver|opal"
    "New York|America/New_York|standard for telling people time"
    "Japan|Asia/Tokyo|octo and myn"
)
# ---------------------

# Fixed dimensions
WIDTH=450  # Increased width slightly to fit the new column comfortably
HEIGHT=500

# Build Zenity arguments (Added the Comment column)
ARGS=("--list" "--title=World Clock" \
      "--width=$WIDTH" "--height=$HEIGHT" \
      "--column=City" "--column=Time" "--column=Date" "--column=Comment")

# Populate data
for entry in "${CITIES[@]}"; do
    # Updated IFS read to capture the third 'comment' variable
    IFS='|' read -r name tz comment <<< "$entry"

    time_val=$(TZ="$tz" date '+%H:%M')
    date_val=$(TZ="$tz" date '+%a %b %d')

    # Append all four pieces of data to match the four columns
    ARGS+=("$name" "$time_val" "$date_val" "$comment")
done

# Launch Zenity in background and capture PID
zenity "${ARGS[@]}" &
ZENITY_PID=$!

# Wait a moment for Zenity to start
sleep 0.2

# Get the current active window ID before Zenity opens
CURRENT_WIN=$(xprop -root _NET_ACTIVE_WINDOW | awk '/window id/ {print $NF}' | tr -d ',')

# Monitor for focus changes
#while kill -0 $ZENITY_PID 2>/dev/null; do
 #  sleep 0.1
    NEW_WIN=$(xprop -root _NET_ACTIVE_WINDOW | awk '/window id/ {print $NF}' | tr -d ',')

    # If active window changed, kill Zenity
  #  if [[ "$NEW_WIN" != "$CURRENT_WIN" ]]; then
   #     kill $ZENITY_PID 2>/dev/null
    #    exit 0
    #fi

    #CURRENT_WIN=$NEW_WIN
#done
