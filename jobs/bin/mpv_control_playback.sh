#!/bin/sh
set -e

# NOTE: for whatever reason the syntax in this file is not the exact same syntax when running these functions from an 
# interactive shell session, presently I don't know enough about BASH to discern the difference

# To run the `startRecording` function via an interactive BASH session

# echo '{ "command": [ "set_property", "stream-record", "/absolute/path/to/recording.ts" ] }' | socat - /tmp/mpvsocket | jq -r '.data'

# NOTE: when exp with running the above cmd, when rerunning the cmd from a CLI the file will be overwritten if the 
# filename is the same from the previous cmd

# NOTE: this script has made some improvements with recording live internet streams, a single key press if `input.conf` is 
# setup with mpv is all that is needed to `start` / `stop` a recording from the mpv interface.

# NOTE: there were some issues where a new recording would be started after stopping a recording, that issue should be resolved now.

# NOTE: this `record.sh` script presently can not go back in the playback history and record the playback from the seeked position.
# SEE: https://github.com/mpv-player/mpv/issues/7275

getPlaybackStatus() {
  plackbackStatus=$(echo '{ "command": ["get_property", "pause"] }' | \
    socat - /tmp/mpvsocket | \
    jq -r '.data')
}

startPause() {
  echo "starting pause of playback"
  echo '{ "command": [ "set_property", "pause", true] }' | socat - /tmp/mpvsocket
 echo "playback paused"
}

stopPause() {
  echo "resuming playback"
  echo '{ "command": ["set_property", "pause", false] }' | \
    socat - /tmp/mpvsocket
  echo "playback resumed"
}

togglePlayback() {
  getPlaybackStatus

  # check if data key is empty or contains a string value of `false`
  if [[ -z "$plackbackStatus" ||  "$plackbackStatus" == "false" ]]
  then
    startPause
  else
    stopPause
  fi
}

# expEcho() {
#   echo "just this"
# }

togglePlayback
