#!/usr/bin/env bash
set -e # stop if any cmd fails

export PATH="/usr/bin:/bin" # set PATH
# export PATH="" # DEBUG
# echo $PATH # DEBUG
# echo "$PWD" # DEBUG

tc_uname=$(command -v uname)

if [ -z "$tc_uname" ];
then
  echo "could not determine OS"
else
  echo "$tc_uname" found
fi

tcmounter_os=$(eval "$tc_uname")

tcmounter_darwin() {
  echo "giddy up"

  # determine the wireless network name, ie. Lan

  # set wireless network name in script and compare
  
}

case $tcmounter_os in
  "Darwin") echo "99% sure you're running macOS"
    tcmounter_darwin;;
  "Linux") echo "appears you're running some GNU+Linux distro"
    echo "TODO" ;;
  *) echo "you're too cool for me";;
esac





