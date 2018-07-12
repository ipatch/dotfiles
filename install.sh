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

# prefix all local vars in this script with `DOTS`,I use the word local very loosely

# look for bash
DOTS_BASH_PATH="$(type -a bash)"
printf '%s\n' "$DOTS_BASH_PATH"

# > When setting the output of a command to a variable make sure to enclose `$(command)` within double quotes
  # Ex. `"$(type -a bash)"

# > `printf` is preferred over `echo`
# > However, if using `echo` do `echo "$MY_VAR"` as opposed to `echo $MY_VAR` to properly interpret new line, ie. `\n`

echo "$SHELL"
echo "foo"
