#!/bin/sh
set -e

echo "Is this a good question (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo; answer=$(head -c 1) ; stty "$old_stty_cfg"
if echo "$answer" | grep -iq "^y"; then
  echo Yes
else
  echo No
fi
