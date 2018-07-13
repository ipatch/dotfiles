#!/bin/sh

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
printf "${Blu}blue ${Red}red ${Rst}etc...\n"
printf "${Gre}Hello World${Rst}\n"
printf "${Itl}italics${Rst}\n"
printf "${Itl}${Red}italics${Rst}\n"

printf "${Itl}${Bld}BOLD + italics${Rst}\n"
printf "${Bld}${Itl}bold ++ italics${Rst}\n"
printf "${Bld}${Blu}This text should bold + blue${Rst}\n"
# retrieve 🐕 running Operating System
if test -x /usr/bin/uname
then
  dots_os="$(/usr/bin/uname)"
  echo "Your ${BWhi}OS${RCol} appears to be $dots_os, ie. ${BWhi}macOS${RCol}"
  # ask $USER if the above is correct?
  read -p "I'm going to test the color ${Gre}Green"
  read -p "Is your OS macOS (${Gre}y${CRol}/${Red}n${CRol})?" choice
  case "$choice" in
    y|Y ) printf "\n👌 ${Gre}Okay, let\'s continue...\n";;
    n|N ) printf "\n${Red}Well 💩 that\'s embarrassing 🙈\n...and we can\'t continue.\n";;
    # TODO: add color for 'y' and 'n' if possible
    *) echo "\n${RCol}You gotta mash ${Gre}y ${CRol}or ${Red}n'\n"

  esac
elif test -x /bin/uname
then
  dots_os="$(/bin/uname)"
  echo "Your OS appears to be $dots_os"
  # ask $USER if the above is correct?
  read -p "Is your OS Linux (y/n)?" choice
  case "$choice" in
    y|Y ) printf "👌 Okay, wtf let\'s \ncontinue...\n";;
    n|N ) printf "well 💩 that\'s embarrassing 💩\nand we can't contine.\n";;
    # TODO: add color for 'y' and 'n' if possible
    *) echo "you gotta mash 'y' or 'n'"
  esac

else
  # TODO: test this condition using a FreeBSD docker image
  echo "Could not identify your OS 🤷"
fi

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



