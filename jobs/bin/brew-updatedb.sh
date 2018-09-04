#!/bin/sh
set -e

/bin/launchctl setenv PATH /Users/capin/.local/bin

sudo -E /usr/local/bin/updatedb

/bin/launchctl unsetenv PATH
