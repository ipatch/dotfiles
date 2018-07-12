#!/bin/sh
# GitHub: @ipatch
# Twitter: @truckmonth
# Email: me@chrisrjones.com
# Install script for @ipatch dotfiles.
# version: 0.0.5

##############################
# INSTALLATION
##
# curl -s https://raw.githubusercontent.com/ipatch/dotfiles/feature-exp-with-curl/develop/install.sh | /bin/sh

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




