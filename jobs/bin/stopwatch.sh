#!/bin/bash

STATE_FILE="/tmp/polybar_stopwatch_state"
START_TIME_FILE="/tmp/polybar_stopwatch_start_time"
ACCUMULATED_TIME_FILE="/tmp/polybar_stopwatch_accumulated_time"

# Initialize files if they don't exist
[ ! -f "$STATE_FILE" ] && echo "stopped" > "$STATE_FILE"
[ ! -f "$ACCUMULATED_TIME_FILE" ] && echo "0" > "$ACCUMULATED_TIME_FILE"

state=$(cat "$STATE_FILE")
accumulated_time=$(cat "$ACCUMULATED_TIME_FILE")
current_time=$(date +%s.%N) # Use nanoseconds for better precision

case "$1" in
    "start")
        if [ "$state" == "stopped" ]; then
            echo "running" > "$STATE_FILE"
            echo "$current_time" > "$START_TIME_FILE"
        fi
        ;;
    "stop")
        if [ "$state" == "running" ]; then
            start_time=$(cat "$START_TIME_FILE")
            elapsed=$(awk "BEGIN { print $current_time - $start_time }")
            accumulated_time=$(awk "BEGIN { print $accumulated_time + $elapsed }")
            echo "stopped" > "$STATE_FILE"
            echo "$accumulated_time" > "$ACCUMULATED_TIME_FILE"
        fi
        ;;
    "reset")
        echo "stopped" > "$STATE_FILE"
        echo "0" > "$ACCUMULATED_TIME_FILE"
        rm -f "$START_TIME_FILE" # Remove start time file on reset
        ;;
    *) # Display time
        display_time="$accumulated_time"
        if [ "$state" == "running" ]; then
            start_time=$(cat "$START_TIME_FILE")
            current_elapsed=$(awk "BEGIN { print $current_time - $start_time }")
            display_time=$(awk "BEGIN { print $accumulated_time + $current_elapsed }")
        fi

        # Format the time (basic example: seconds with 2 decimal places)
        # You'll want to format this into HH:MM:SS or MM:SS.ms properly
        printf "%.2f" "$display_time"
        ;;
esac
