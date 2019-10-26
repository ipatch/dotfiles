#!/bin/sh
set -e

# A simple BAsh script to try and remove those pesky `.DS_Store` files on macOS

# TODO
# 1) determine the exit status of the script, ie. did it succedd or fail, ie. 1 or 0
# 2) log how long it took to run the process / script / find cmd
# 3) note the date & time the cmd was run

# To get a list all of `.DS_Store` files on the local system
#... `sudo -E ls -R / | grep "\.DS_Store"`

if [ -x /usr/local/bin/gfind ]; then
  # use `gfind` from brew, ie. `brew install findutils`, and search entire system
  # search specifically for macOS's `.DS_Store` files
  # exclude the `/Volumes,/dev` dirs
  # if a `.DS_Store` file found remove it
  # sallow, ie. don't print permission denied messages to STDOUT

    # ! -path '*{/Volumes/,/dev/*}' \

  /usr/local/bin/gfind / \
    -name .DS_Store \
    ! -path '/Volumes/*' \
    ! -path '*/dev/*' \
    -exec /bin/rm -rf {} \; \
    -print 2>&1 | /usr/bin/grep -v "Permission denied"
elif [ -x /usr/bin/find ]; then
  # no brew `gfind` use macOS `/usr/bin/find` instead
  # search specifically for macOS's `.DS_Store` files
  # exclude the `/Volumes,/dev` dirs
  # if a `.DS_Store` file found remove it
  # sallow, ie. don't print permission denied messages to STDOUT
  /usr/bin/find / \
    -name .DS_Store \
    ! -path '*/Volumes/*' \
    ! -path '*/dev/*' \
    -exec /bin/rm -rf {} \; \
    -print 2>&1 | /usr/bin/grep -v "Permission denied"
fi


