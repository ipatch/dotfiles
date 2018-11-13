#!/usr/bin/env bash

# exit if any part of script fails
set -e

# DEBUG
# set -x

if [ -x /usr/bin/uname ]; then
  os=$(/usr/bin/uname)
  export os
elif [ -x /bin/uname ]; then
  os=$(/bin/uname)
  export os
fi

if [ "$os" = "Darwin" ]; then
  # echo "yup your probably using macOS"

  desktop_icon_status=$(defaults read com.apple.finder CreateDesktop)

  # echo "$desktop_icon_status"

  if [ "$desktop_icon_status" = "1" ]; then
    defaults write com.apple.finder CreateDesktop -bool false;
    killall Finder;
    echo "no desktop icons for you!"
  elif [ "$desktop_icon_status" = "0" ]; then
    defaults write com.apple.finder CreateDesktop -bool true;
    killall Finder;
    echo "Desktop icons should be visible"
  fi

elif [ "$os" != "Darwin" ]; then
  echo "shit dude, this ain't for you"
fi
