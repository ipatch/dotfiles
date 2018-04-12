#!/bin/sh

# Remove those pesky `.DS_Store` files on macOS

# To get a list all of `.DS_Store` files on the local system
#... `sudo -E ls -R / | grep "\.DS_Store"`

# Stupid 💩 to hopefully get launchd / launchctl to play nice
/bin/launchctl setenv PATH /Users/capin/.local/bin

/usr/local/bin/find / -name .DS_Store -exec /bin/rm -rf {} \; -print

/bin/launchctl unsetenv PATH



