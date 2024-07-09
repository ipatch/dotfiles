#!/bin/bash

# NOTE: ipatch, https://github.com/davatorium/rofi/discussions/1281#discussioncomment-412050
# cat /proc/$(pidof i3)/environ | tr '\0' '\n' | grep '^PATH'

if [ "$USER" = "capin" ]; then
  export PATH=$HOME/hombrew/sbin:$HOME/homebrew/bin:$PATH
fi
