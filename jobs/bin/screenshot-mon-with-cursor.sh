#!/bin/bash

# Get cursor position
eval $(xdotool getmouselocation --shell)

# Find the monitor containing the cursor
geometry=$(xrandr --query | grep ' connected' | while read line; do
    # Parse geometry like 2560x1440+0+0
    if [[ $line =~ ([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+) ]]; then
        w=${BASH_REMATCH[1]}
        h=${BASH_REMATCH[2]}
        x=${BASH_REMATCH[3]}
        y=${BASH_REMATCH[4]}
        
        if (( X >= x && X < x + w && Y >= y && Y < y + h )); then
            echo "${w}x${h}+${x}+${y}"
            break
        fi
    fi
done)

maim -g "$geometry" /tmp/screenshot.png && xclip -selection clipboard -t image/png < /tmp/screenshot.png
