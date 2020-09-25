#!/bin/bash
set -e

# Hopefully a simple script for a more sane bash environment
# ...when working with BASH on Raspbian out of the box.

# TODO
# 1) check if OS is Raspbian

# ISSUES

# NOTES
# it appears Raspbian does not create a `$HOME/.bash_profile` out of the box
#❗️❗️❗️ if this script shebang is set to `/bin/sh` ie. `dash` it will NOT run. 

echo "downloaded 'rpi_bash_setup.sh'"
echo "executing 'rpi_bash_setup.sh'"

# `$HOME/.bash_profile` setup
touch "$HOME/.bash_profile"
echo "$HOME./bash_profile created or updated."

if [ -f /etc/bash.bashrc ]; then
  tmp_bashrc_snippet_url="https://raw.githubusercontent.com/ipatch/dotfiles/release/jobs/Linux/Raspbian/snippet_bash.bashrc"
  tmp_curl_bashrc_snippet=$(curl -sL "$tmp_bashrc_snippet_url")
  tmp_grep_bashrc_check="load user specific BASH configuration files"
  # tmp_grep_bashrc_check_pos="command-not-found" #DEBUG

  if grep -q "$tmp_grep_bashrc_check" /etc/bash.bashrc
  then
    # echo "found" # DEBUG
    echo "contents of $tmp_bashrc_snippet_url already added"
  else
    # echo "snipppet not found" # DEBUG
    echo "$tmp_curl_bashrc_snippet" | sudo -A sh -c 'cat >> /etc/bash.bashrc'
    # prompt/use sudo password to modify /etc/bash.bashrc
    echo "updated /etc/bash.bashrc with $tmp_bashrc_snippet_url"
  fi
fi

if [ -f "$HOME/.bash_profile" ]; then
  tmp_bash_profile_url="https://raw.githubusercontent.com/ipatch/dotfiles/release/jobs/Linux/Raspbian/home/pi/.bash_profile"
  # store the URL of the curl cmd into shell variable
  tmp_bash_profile=$(curl -sL $tmp_bash_profile_url)

  if grep -q "ipatch checker for sh script" "$HOME/.bash_profile"
  then
    echo "contents of $tmp_bash_profile_url already added"
  else
    echo "$tmp_bash_profile" >> "$HOME/.bash_profile"
    echo "updated $HOME/.bash_profile"
  fi
fi

# TODO: figure out how to reload env for interactive login shell, until then print msg to reload
echo "run 'exec bash' to reload env, and apply changes within the current shell"
