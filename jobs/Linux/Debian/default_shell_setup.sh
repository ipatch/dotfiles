#!/bin/bash
set -e

# TODO
# 1. check the default shell for the $USER

# ISSUES

# NOTES

# check default shell

# store value of current user
script_user=$(whoami)
echo $script_user # DEBUG

# get the current default shell stored within the `/etc/passwd` for $script_user

# NOTE: using files and shell envs with awk is above my pay grade
# script_user_default_shell=$(awk -F: $script_user { print $7}' /etc/passwd)

$script_user_default_shell=$(grep "$script_user" </etc/passwd | cut -f 7 -d ":")
echo $script_user_default_shell
