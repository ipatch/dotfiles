#!/bin/sh
set -e
# Remove those pesky `.DS_Store` files on macOS

# To get a list all of `.DS_Store` files on the local system
#... `sudo -E ls -R / | grep "\.DS_Store"`

/usr/local/bin/find / -name .DS_Store -exec /bin/rm -rf {} \; -print 2>&1 | grep -v "Permission denied"

