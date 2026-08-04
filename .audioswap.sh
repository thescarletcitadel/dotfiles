#!/bin/bash

EARBUDS="alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo"
EDIFIER="alsa_output.usb-bestechnic_EDIFIER_M60_20160406.1-00.analog-stereo"

# Get the current default sink name
SINK=$(pactl get-default-sink)

# Compare the current sink and toggle
if [ "$SINK" = "$EDIFIER" ]; then
    pactl set-default-sink "$EARBUDS"
    notify-send "Audio changed to Corsair"
    paplay /usr/local/bin/notif.mp3
else
    pactl set-default-sink "$EDIFIER"
    notify-send "Audio changed to Edifier"
    paplay /usr/local/bin/notif.mp3
fi
