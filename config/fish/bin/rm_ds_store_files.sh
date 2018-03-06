#!/bin/sh

# Remove those pesky `.DS_Store` files on macOS

# To get a list all of `.DS_Store` files on the local system
#... `sudo -E ls -R / | grep "\.DS_Store"`

sudo -E find / -name .DS_Store -exec rm -f {} \; -print



