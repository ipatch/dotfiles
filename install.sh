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

# prefix all local vars in this script with `dots`,I use the word local very loosely

# look for bash v1
# dots_bash_path="$(type -a bash)"
# printf '%s\n' "$dots_bash_path"

# > the above was cool, but did not play well with Alpine Linux /bin/sh inside a docker container

# look for bash v2
if test -x /usr/local/bin/bash
then
  echo "found /usr/local/bin/bash"
  dots_bash_bin="/usr/local/bin/bash" 
  echo "dots_bash_bin = $dots_bash_bin"
elif test -x /usr/bin/bash
then
  echo "found /usr/bin/bash"
  dots_bash_bin="/usr/bin/bash"
else
  echo "404 bash not found"
fi

echo "$dots_bash_bin"

# > When setting the output of a command to a variable make sure to enclose `$(command)` within double quotes
  # Ex. `"$(type -a bash)"

# > `printf` is preferred over `echo`
# > However, if using `echo` do `echo "$MY_VAR"` as opposed to `echo $MY_VAR` to properly interpret new line, ie. `\n`

# echo "$SHELL"
# echo "$0"
# > Running `echo "$0"` locally echos `./install.sh`

# sanity check 👩
# echo "foo"

# if $DOTS_BASH_PATH contains `/usr/local/bin/bash` or `/usr/bin/bash`
    # change the current shell to `bash`
# end / fi
# if expr "$dots_bash_path" : ".*bash" >/dev/null;
# then echo "found bash"
# else
  # echo "you need to install BASH to continue"
  # exit 1
# fi

# check to see if script will stop if bash isn't found
# echo "how the hell did i get here without bash"

# swith from /bin/sh to /usr/bin/env bash



