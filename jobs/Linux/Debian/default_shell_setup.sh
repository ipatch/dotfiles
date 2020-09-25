#!/bin/bash
set -e

# TODO
# 0. check if fish shell is installed
# 1. if default shell is already fish do nothing
# 2. 

# ISSUES

# NOTES
# 1. check the current OS
# 2. get and store the current $USER executing script
# 3. get the current $USER default shell

# get current OS
os=$(uname);
echo "your OS appears to be $os";

if [[ "$os" == "Darwin" ]]; then
  echo "this script is intended for GNU+Linux distros";
  # exit; # DEBUG
fi

# store value of current user
script_user=$(whoami);
echo $script_user; # DEBUG

# get the current default shell stored within the `/etc/passwd` for $script_user

# NOTE: using files and shell envs with awk is above my pay grade
# script_user_default_shell=$(awk -F: $script_user { print $7}' /etc/passwd)

# SEE: https://unix.stackexchange.com/a/358996/33002

script_user_default_shell=$(grep ^"$script_user": </etc/passwd | cut -f 7 -d ":");
echo $script_user_default_shell;

installed_shells=$(cat /etc/shells);
# echo "the installed shells are $installed_shells"; # DEBUG

# search the contents of `installed_shells` for fish
if [[ $installed_shells == *"fish"* ]]; then
  echo "fish shell seems to be installed"
  chsh -s /usr/bin/fish
  echo "default shell set to /usr/bin/fish"
fi

