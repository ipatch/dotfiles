#!/usr/bin/env bash

set -e
# Debugging
## set -ex # `-x` will print each line / statement of a bash script

# setup an $OS env var for distinguishing between different Operating Systems
# NOTE: Darwin = macOS, Linux = Debian; and other assorted Linux distros
if [ -x /usr/bin/uname ]; then
	os=$(/usr/bin/uname)
	export os
elif [ -x /bin/uname ]; then
	os=$(/bin/uname)
	export os
fi

if [ "$os" = Darwin ]; then
  pmset -g batt
elif [ "$os" != Darwin ]; then
  echo "dis shit only flies on macOS ...bro"
fi
