#!/usr/local/bin/bash
set -e

# NOTE: for whatever reason the syntax in this file is not the exact same syntax when running these functions from an 
# interactive shell session, presently I don't know enough about BASH to discern the difference

# To run the `startRecording` function via an interactive BASH session

# echo '{ "command": [ "set_property", "stream-record", "/absolute/path/to/recording.ts" ] }' | socat - /tmp/mpvsocket | jq -r '.data'

# NOTE: when exp with running the above cmd, when rerunning the cmd from a CLI the file will be overwritten if the 
# filename is the same from the previous cmd

# NOTE: `PATH` to commands must be absolute for time being
# TODO: set path for commands to variables possibly, to avoid having to type out full path 
# to commands ie. `socat`

getPlaybackStatus() {
    # /usr/local/bin/hs -c "alert('inside getplaybackstatus func')"

  plackbackStatus=$(echo '{ "command": ["get_property", "pause"] }' | \
    /usr/local/bin/socat - /tmp/mpvsocket | \
    /usr/local/bin/jq -r '.data')
}

startPause() {
  /usr/local/bin/hs -c "alert('mpv paused')"
  echo "starting pause of playback"
  echo '{ "command": [ "set_property", "pause", true] }' | /usr/local/bin/socat - /tmp/mpvsocket
  echo "playback paused"
}

stopPause() {
  /usr/local/bin/hs -c "alert('mpv playback resumed')"
  echo "resuming playback"
  echo '{ "command": ["set_property", "pause", false] }' | \
    /usr/local/bin/socat - /tmp/mpvsocket
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

togglePlayback
