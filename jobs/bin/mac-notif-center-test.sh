#!/bin/sh
set -e

# A stupid shell script to fuck around notification center using apple script from the CLI in conjuction with launchd / launchctl.

/usr/bin/osascript -e 'display notification "hello from notif center & launcd" with title "wtf"'
