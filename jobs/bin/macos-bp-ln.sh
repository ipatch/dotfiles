#!/bin/sh
set -e

# A simple script to symlink a Bus Pirate to a reasonable name within the `/dev` dir on macOS

os="$(uname)"

case $os in
  Darwin)
    if [ -c /dev/tty.usbserial-A700dzDq ]
    then
      # echo "found bus pirate"
      sudo ln -sf /dev/tty.usbserial-A700dzDq /dev/buspirate
      osascript -e 'display notification "Bus Pirate connected via USB" with title "Bus Pirate"' 
    elif [ ! -c /dev/tty.usbserial-A700dzDq ] && [ -h /dev/buspirate ]
    then
      # echo "no bp found"
      sudo rm /dev/buspirate
      osascript -e 'display notification "No Bus Pirate found 🤷, and removed /dev/buspirate" with title "Bus Pirate"'
    else
      echo "how the fuck did we get here"
      # echo "no bus pirate"
      # if [ -h /dev/buspirate ]
      # then
      #   sudo rm -r /dev/buspirate
      #   osascript -e 'display notification "Bus Pirate disconnected via USB" with title "Bus Pirate"'
      # fi
    fi
    ;;
  Linux)
    echo "use a udev rule for this shit"
    ;;
  *)
    echo "no soup 🍜 for you, come back in 1 year"
    ;;
esac

