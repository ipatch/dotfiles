#!/bin/sh
# Install script for @ipatch dotfiles.
# version: 0.0.4

##############################
# PREAMBLE
##
# `curl`
  # -f = fail silently
  # -s = silent mode, ie. no progress bar
  # -S = works in conjunction with `-s` and shows errors if something fails "F-"
  # -L = useful for redirection
##


# setup some env vars for install script
GREEN_COLOR="\033[0;32m"

function green_color() {
  echo -e "${GREEN_COLOR}\c"
}


function welcome() {
  green_color

}




