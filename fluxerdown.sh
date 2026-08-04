pactl list sink-inputs | grep -B 100 "fluxer" | grep -oP 'Sink Input #\K\d+' | xargs -I {} pactl set-sink-input-volume {} -5%
