#!/bin/bash

# Directory to store timer state
STATE_DIR="/dev/shm/.timer"
TIME_FILE="$STATE_DIR/time_remaining"
RUNNING_FILE="$STATE_DIR/is_running"

mkdir -p "$STATE_DIR"

# Function to parse time string (e.g., "10h 5m 30s") into total seconds
parse_time() {
    local input="$*"
    local total_seconds=0

    # Extract hours
    if [[ $input =~ ([0-9]+)h ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]} * 3600))
    fi

    # Extract minutes
    if [[ $input =~ ([0-9]+)m ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]} * 60))
    fi

    # Extract seconds
    if [[ $input =~ ([0-9]+)s ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]}))
    fi

    echo $total_seconds
}

# Function to format seconds back to readable time
format_time() {
    local seconds=$1
    local h=$((seconds / 3600))
    local m=$(((seconds % 3600) / 60))
    local s=$((seconds % 60))

    if [ $h -gt 0 ]; then
        printf "%dh %dm %ds" $h $m $s
    elif [ $m -gt 0 ]; then
        printf "%dm %ds" $m $s
    else
        printf "%ds" $s
    fi
}

# Main logic based on command
case "$1" in
    start|add)
        if [ -z "$2" ]; then
            echo "Usage: timer.sh $1 <time> (e.g., 'timer.sh start 10h 30m')"
            exit 1
        fi

        shift
        local_input="$*"
        added_seconds=$(parse_time "$local_input")

        # Get existing time or default to 0
        if [ -f "$TIME_FILE" ]; then
            current_seconds=$(cat "$TIME_FILE")
        else
            current_seconds=0
        fi

        new_seconds=$((current_seconds + added_seconds))
        echo $new_seconds > "$TIME_FILE"
        echo "true" > "$RUNNING_FILE"

        echo "Timer started/added: $(format_time $new_seconds)"
        ;;

    stop)
        rm -f "$RUNNING_FILE"
        if [ -f "$TIME_FILE" ]; then
            remaining=$(cat "$TIME_FILE")
            echo "Timer stopped. Time was: $(format_time $remaining)"
        else
            echo "No active timer"
        fi
        ;;

    reset)
        rm -f "$TIME_FILE" "$RUNNING_FILE"
        echo "Timer reset"
        ;;

    show)
        if [ ! -f "$TIME_FILE" ]; then
            echo "No timer set"
        else
            remaining=$(cat "$TIME_FILE")
            echo "$(format_time $remaining)"
        fi
        ;;

    *)
        echo "Usage: timer.sh {start|add|stop|reset|show} [time]"
        echo "Examples:"
        echo "  timer.sh start 10h 30m"
        echo "  timer.sh add 5m"
        echo "  timer.sh stop"
        echo "  timer.sh reset"
        echo "  timer.sh show"
        exit 1
        ;;
esac
