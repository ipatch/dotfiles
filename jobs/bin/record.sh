#!/bin/sh

# 0) create a file to store the recording
# touch /Users/capin/Movies/my-recordings/streams/record


# 1) find current mpv process
# mpv_process_number=$(pgrep mpv)

# 1.a) store the process num of mpv into the recording file, tmp # DEBUG
# echo "$mpv_process_number" >> /Users/capin/Movies/my-recordings/streams/record


echo "{\"command\": [\"set_property\", \"stream-record\", \"$HOME/Movies/my-recordings/streams/$(date +%F--%T)recording.ts\"] }" | socat - /tmp/mpvsocket

