#!/bin/sh
set -e

# NOTE: for whatever reason the syntax in this file is not the exact same syntax when running these functions from an interactive shell session, presently I don't know enough about BASH to discern the difference

# To run the `startRecording` function via an interactive BASH session

# echo '{ "command": [ "set_property", "stream-record", "/absolute/path/to/recording.ts" ] }' | socat - /tmp/mpvsocket | jq -r '.data'

# NOTE: when exp with running the above cmd, when rerunning the cmd from a CLI the file will be overwritten if the filename is the same from the previous cmd

# NOTE: this script has made some improvements with recording live internet streams, a single key press if `input.conf` is setup with mpv is all that is needed to `start` / `stop` a recording from the mpv interface.

# NOTE: there were some issues where a new recording would be started after stopping a recording, that issue should be resolved now.

# NOTE: this `record.sh` script presently can not go back in the playback history and record the playback from the seeked position.
# SEE: https://github.com/mpv-player/mpv/issues/7275

getRecordingStatus() {
  recordingStatus=$(echo '{ "command": ["get_property", "stream-record"] }' | \
    socat - /tmp/mpvsocket | \
    jq -r '.data')
}

startRecording() {
  echo "starting recording"
  echo "{\"command\": [ \"set_property\", \"stream-record\", \"$HOME/Movies/my-recordings/streams/$(date +%Y-%m-%d--%H-%M-%S)-recording.ts\"] }" | socat - /tmp/mpvsocket
 echo "recording started"
}

stopRecording() {
  echo "stopping recording"
  echo '{ "command": ["set_property", "stream-record", "false"] }' | \
    socat - /tmp/mpvsocket
  echo "recording stopped"
}

toggleRecording() {
  getRecordingStatus

  # check if data key is empty or contains a string value of `false`
  if [[ -z "$recordingStatus" ||  "$recordingStatus" == "false" ]]
  then
    startRecording
  else
    stopRecording
  fi
}

# expEcho() {
#   echo "just this"
# }

toggleRecording
