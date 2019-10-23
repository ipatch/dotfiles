#!/bin/bash
set -e

# Hopefully a simple script for a more sane bash environment
# ...when working with BASH on Raspbian out of the box.

# TODO
# 1) check if OS is Raspbian
# 2) check if `/etc/bashrc.bash already contains contents of snippet

# ISSUES

# NOTES
# it appears Raspbian does not create a `$HOME/.bash_profile` out of the box
#❗️❗️❗️ if this script shebang is set to `/bin/sh` ie. `dash` it will NOT run. 

# create `$HOME/.bash_profile`
echo "downloaded 'rpi_bash_setup.sh'"
echo "executing 'rpi_bash_setup.sh'"

touch "$HOME/.bash_profile"

echo "$HOME./bash_profile created or updated."

if [ -f /etc/bash.bashrc ]; then
  tmp_bashrc_snippet_url="https://raw.githubusercontent.com/ipatch/dotfiles/fall/dev/jobs/Linux/Raspbian/snippet_bash.bashrc"

  grep -q "load user specific BASH configuration files" /etc/bash.bashrc

  # store exit status of grep cmd to shell var
  status=$?
  echo "bashrc grep cmd status = $status" 

  if test $status -eq 0
  then
    echo "contents of $tmp_bashrc_snippet_url already added"
  else
    tmp_curl_bashrc_snippet=$(curl -sL "$tmp_bashrc_snippet_url")
    echo "$(tmp_curl_bashrc_snippet)" | sudo -A sh -c 'cat >> /etc/bash.bashrc'
    echo "udpated /etc/bash.bashrc with $tmp_bashrc_snippet_url"
    # prompt/use sudo password to modify /etc/bash.bashrc
    echo "appended the contents of $tmp_bashrc_snippet_url to /etc/bash.bashrc"
  fi
  else
    echo "no /etc/bash.bahrc found"
fi

if [ -f "$HOME/.bash_profile" ]; then
  tmp_bash_profile_url="https://raw.githubusercontent.com/ipatch/dotfiles/master/jobs/Linux/Raspbian/home/pi/.bash_profile"

  grep -q "ipatch checker for sh script" "$HOME/.bash_profile"

  status=$?

  if test $status eq 0
  then
    echo "contents of $tmp_bash_profile_url already added"
  else
    # store the URL of the curl cmd into shell variable
    tmp_bash_profile=$(curl -sL $tmp_bash_profile_url)
    echo "$tmp_bash_profile" >> "$HOME/.bash_profile"
    echo "updated $HOME/.bash_profile"
  fi
fi

# TODO possible to reload env for interactive login shell?
echo "run 'exec bash' to reload env"
