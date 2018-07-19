#!/bin/sh
set -e

##############################
# CONTACT
##
# GitHub: @ipatch
# Twitter: @truckmonth
# Email: me@chrisrjones.com
# Install script for @ipatch dotfiles.
# version: 0.0.5

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

# TODO: prefix all local vars in this script with `dots`, I use the word local very loosely

# look for bash v1
# dots_bash_path="$(type -a bash)"
# printf '%s\n' "$dots_bash_path"

# > the above was cool, but did not play well with Alpine Linux /bin/sh inside a docker container

##############################
# TODO: clear all previous environment variables 👩
## 

##############################
# NOTE: taste the rainbow™ 🌈
##
Bld='\e[1m' # Enable Bold text
Itl='\e[3m' # Enable Italic
Und='\e[4m' # Enable Underline
Rst='\e[0m' # Reset text

# Regular             High Intensity      BoldHigh Intens  
Bla='\e[0;30m';     IBla='\e[0;90m';    BIBla='\e[1;90m';  
Red='\e[0;31m';     IRed='\e[0;91m';    BIRed='\e[1;91m';  
Gre='\e[0;32m';     IGre='\e[0;92m';    BIGre='\e[1;92m';  
Yel='\e[0;33m';     IYel='\e[0;93m';    BIYel='\e[1;93m';  
Blu='\e[0;34m';     IBlu='\e[0;94m';    BIBlu='\e[1;94m';  
Pur='\e[0;35m';     IPur='\e[0;95m';    BIPur='\e[1;95m';  
Cya='\e[0;36m';     ICya='\e[0;96m';    BICya='\e[1;96m';  
Whi='\e[0;37m';     IWhi='\e[0;97m';    BIWhi='\e[1;97m';  

# Usage: `printf "${Blu}blue ${Red}red ${Rst}etc..."`
printf "%blue %red %etc..." "$Blu" "$Red" "$Rst""\\n"
printf "%Hello World" "$Gre" "$Rst""\\n"
printf "%italics" "$Itl" "$Rst" "\\n"
printf "% %italics" "$Itl" "$Red" "$Rst" "\\n"

printf "% % BOLD + italics" "$Itl" "$Bld" "$Rst" "\\n"
printf "% %bold + italics" "$Bld" "$Itl" "$Rst" "\\n"
printf "% %This text should bold + blue" "$Bld" "$Blu" "$Rst" "\\n"
# retrieve 🐕 running Operating System
if test -x /usr/bin/uname
then
  dots_os="$(/usr/bin/uname)"
  printf "Your %OS appears to be %, ie. %macOS" "$BIWhi" "$Rst" "$dots_os" "$BIWhi" "$Rst" "\\n"
  # ask $USER if the above is correct?
  printf "Im going to test the color %Green" "$Gre" "$Rst" "\\n"
  read -r "Is your OS macOS (${Gre}y${Rst}/${Red}n${Rst})?" choice < /dev/tty
  case "$choice" in
    y|Y ) printf "👌 %Okay, lets continue...""\\n" "$Gre";;
    n|N ) printf "%Well 💩 thats embarrassing'\\n'...and we cant continue.""\\n" "$Red";;
    # TODO: add color for 'y' and 'n' if possible
    *) printf "%You gotta mash %y %or %n""\\n" "$Rst" "$Gre" "$Rst" "$Red"

  esac
elif test -x /bin/uname
then
  dots_os="$(/bin/uname)"
  echo "Your OS appears to be $dots_os"
  # ask $USER if the above is correct?
  read -r "Is your OS Linux (y/n)?" choice < /dev/tty
  case "$choice" in
    y|Y ) printf "👌 Okay, wtf lets  '\\n' continue...""\\n";;
    n|N ) printf "well 💩 that'\\''s embarrassing '\\n' and we can't continue.""\\n";;
    # TODO: add color for 'y' and 'n' if possible
    *) echo "you gotta mash 'y' or 'n'"
  esac

else
  # TODO: test this condition using a FreeBSD docker image
  printf "Could not identify your OS 🤷"
fi

# look for bash v2
if test -x /usr/local/bin/bash
then
  printf "found /usr/local/bin/bash"
  dots_bash_bin="/usr/local/bin/bash" 
  printf "% =" "$dots_bash_bin"
elif test -x /usr/bin/bash
then
  echo "found /usr/bin/bash"
  dots_bash_bin="/usr/bin/bash"
else
  echo "404 bash not found"
fi

printf "%" "$dots_bash_bin"

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

