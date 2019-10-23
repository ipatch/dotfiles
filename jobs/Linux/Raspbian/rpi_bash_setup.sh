#!/bin/bash
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
#❗️❗️❗️ if shebang is set to `/bin/sh` ie. `dash` it will NOT run. 

# create `$HOME/.bash_profile`
echo "downloaded 'rpi_bash_setup.sh'"
echo "executing 'rpi_bash_setup.sh'"

touch "$HOME/.bash_profile"

echo "$HOME./bash_profile created."

curl -s --output "$PWD/snippet_bash.bashrc" "https://raw.githubusercontent.com/ipatch/dotfiles/fall/dev/jobs/Linux/Raspbian/snippet_bash.bashrc" # hide contents of snippet, but download to local file

echo "downloaded snippet_bash.bashrc"

# sudo -S tee -a "$PWD/snippet_bash.bashrc" >> /etc/bash.bashrc
echo "$(cat $PWD/snippet_bash.bashrc)" | sudo -p sh -c 'cat >> /etc/bash.bashrc'
