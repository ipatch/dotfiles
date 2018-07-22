#!/bin/sh
set -e

# A simple script to symlink a Bus Pirate to a reasonable name within the `/dev` dir on macOS

if [ -c /dev/tty.usbserial-A700dzDq ]
then
  # echo "found bus pirate"
  sudo ln -sf /dev/tty.usbserial-A700dzDq /dev/buspirate
  osascript -e 'display notification "Bus Pirate connected via USB" with title "Bus Pirate"' 
else
  # echo "no bus pirate"
  sudo rm -rf /dev/buspirate
  osascript -e 'display notification "Bus Pirate disconnected via USB" with title "Bus Pirate"'
fi

