#!/usr/bin/env bash

set -e

if [ -x /usr/bin/uname ]; then
  os=$(/usr/bin/uname)
  export os
elif [ -x /bin/uname ]; then
  os=$(/bin/uname)
  export os
fi

if [ "$os" = Darwin ]; then
  echo "the output of 'sysctl machdep.cpu.microcode_version' is"
  sysctl machdep.cpu.microcode_version
elif [ "$os" != Darwin ]; then
  echo "dis shit only flys on macOS ...bro"
fi
