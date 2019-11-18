#!/bin/sh

# touch /Users/capin/ltmp/foooooo

echo '{"command": ["set_property", "stream-record", "false"] }' | socat - /tmp/mpvsocket
