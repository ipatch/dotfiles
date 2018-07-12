#!/bin/sh

# GitHub: @ipatch
# Twitter: @truckmonth
# Email: me@chrisrjones.com
# Install script for @ipatch dotfiles.
# version: 0.0.5
echo "more wtfz"

##############################
# PREAMBLE
##
# `curl`
  # -f = fail silently
  # -s = silent mode, ie. no progress bar
  # -S = works in conjunction with `-s` and shows errors if something fails "F-"
  # -L = useful for redirection
##

#############################
# INSTALLATION
##
# curl -s https://raw.githubusercontent.com/ipatch/dotfiles/feature-exp-with-curl/develop/install.sh | /bin/sh


# look for bash
BASH_PATH="type -a bash"
echo $PATH
