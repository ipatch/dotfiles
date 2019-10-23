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
#❗️❗️❗️ if shebang is set to `/bin/sh` ie. `dash` it will NOT run. 

# create `$HOME/.bash_profile`
echo "downloaded 'rpi_bash_setup.sh'"
echo "executing 'rpi_bash_setup.sh'"

touch "$HOME/.bash_profile"

echo "$HOME./bash_profile created."

# store the about of curl cmd into shell variable
TMP_BASH_PROFILE_URL="https://raw.githubusercontent.com/ipatch/dotfiles/master/jobs/Linux/Raspbian/home/pi/.bash_profile"
TMP_BASH_PROFILE=$(curl -L $TMP_BASH_PROFILE_URL)

echo "$TMP_BASH_PROFILE" >> "$HOME/.bash_profile"

echo "updated $HOME/.bash_profile"

curl -s --output "$PWD/snippet_bash.bashrc" "https://raw.githubusercontent.com/ipatch/dotfiles/fall/dev/jobs/Linux/Raspbian/snippet_bash.bashrc" # hide contents of snippet, but download to local file

echo "downloaded snippet_bash.bashrc"

# prompt for sudo password to modify /etc/bash.bashrc
# sudo -A sh -c 'cat /etc/hosts'

# sudo -S tee -a "$PWD/snippet_bash.bashrc" >> /etc/bash.bashrc
echo "$(cat $PWD/snippet_bash.bashrc)" | sudo -A sh -c 'cat >> /etc/bash.bashrc'

echo "appended the contents of snippet_bash.bashrc to /etc/bash.bashrc"
echo "it is safe to remove the local copy of snippet_bash.bashrc with $PWD"
echo "reload shell"
exec bash
