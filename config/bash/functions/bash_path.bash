#!/usr/bin/env bash

# Calling example:
#   append_to PATH "/usr/local/bin"

# {app,pre}pend_to path-var-name dirpath
# remove_from path-var-name dirpath
#
# Functions to manipulate a path-style variable.  {app,pre}pend_to
# both remove any other instances of dirname before adding it to
# the start or end of the path-var-name variable.
#
# Uses eval to allow target path varname to be passed in.

function remove_from() {
  # add surrounging colons
  eval tmp_path=":\$${1}:"
  # if dir is already there, remove it
  (echo "${tmp_path}" | grep --silent ":${2}:") &&
    tmp_path=$(echo "$tmp_path" | sed "s=:${2}:=:=g")
  # remove surrounding colons
  tmp_path=$(echo "$tmp_path" | sed 's=^:==; s=:$==')
  eval export $1=\"$tmp_path\"
}
function append_to() {
  remove_from "$1" "$2"  # clean the path contents
  eval export $1=\"\$${1}:$2\"
}

function prepend_to() {
  remove_from "$1" "$2"  # clean the path contents
  eval export $1=\"${2}:\$$1\"
}
