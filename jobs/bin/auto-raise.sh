#!/bin/bash

# check if autoraise is running
os=$(/usr/bin/uname)

if [ "$os"  = "Darwin" ]; then
  # echo "macOS found"
  pgrep=/usr/bin/pgrep

  if $pgrep -ix "autoraise" >/dev/null; then
    echo "autoraise appears to be running"
    autoraise_pid="$($pgrep -ix autoraise)"
    echo "autoraise PID is $autoraise_pid"
    echo "stopping autoraise $autoraise_pid"
    kill "$autoraise_pid"
    exit;
  else
    # if autoraise is not running, start it, else kill it.
    echo "autoraise appears to be NOT running"
    echo "trying to start /Applications/AutoRaise/AutoRaise"
    /Applications/AutoRaise/AutoRaise -delay 2&
    echo "autoraise started"
    exit;
  fi
else
  echo "macOS NOT found"
fi

