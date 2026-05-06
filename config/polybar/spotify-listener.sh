#!/bin/bash

player_status() {
    status=$(playerctl -p spotify status 2>/dev/null)

    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
        polybar-msg action spotify hook 1
        polybar-msg action previous hook 1
        polybar-msg action next hook 1
        if [ "$status" = "Playing" ]; then
            polybar-msg action playpause hook 1
        else
            polybar-msg action playpause hook 2
        fi
    else
        polybar-msg action spotify hook 0
        polybar-msg action previous hook 0
        polybar-msg action next hook 0
        polybar-msg action playpause hook 0
    fi
}

# Update on launch
player_status

# Watch for metadata changes (fires on track change AND play/pause)
playerctl -p spotify -F metadata -f '{{status}} {{artist}} {{title}}' 2>/dev/null | while read -r _; do
    player_status
done
