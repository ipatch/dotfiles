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
  echo "yup your probably using macOS"
elif [ "$os" != "Darwin" ]; then
  echo "shit dude, this ain't for you"
fi

