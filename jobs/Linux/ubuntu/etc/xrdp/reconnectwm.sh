#!/bin/sh

# Write procedures here you want to execute on reconnect

# refresh xfce4 display settings
xrandr --auto

# restore wallpaper
xfdesktop --reload

# restart panel
xfce4-panel --restart &

# restart notification daemon
pkill xfce4-notifyd && xfce4-notifyd &

# log reconnect event for debugging
echo "session reconnected at $(date)" >> /var/log/xrdp-connect.log
