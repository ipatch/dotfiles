#!/bin/sh
set -e

# Hopefully a simple script for a more sane bash environment
# ...when working with BASH on Raspbian out of the box.

# 1) check if OS is Raspbian
# 2) pullin text for /etc/bash.bashrc
# 3) update /etc/bash.bashrc

# possible issues
# 1) more than likely sudo will be required


# NOTES
# it appears Raspbian does not create a `$HOME/.bash_profile` out of the box

# create `$HOME/.bash_profile`
echo "downloaded 'rpi_bash_setup.sh'"
echo "executing 'rpi_bash_setup.sh'"

touch "$HOME/.bash_profile"

echo "$HOME./bash_profile created."

curl "https://raw.githubusercontent.com/ipatch/dotfiles/fall/dev/jobs/Linux/Raspbian/snippet_bash.bashrc"

echo "downloaded snippet_bash.bashrc"
