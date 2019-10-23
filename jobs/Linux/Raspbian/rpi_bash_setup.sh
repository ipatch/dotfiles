#!/bin/sh

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
touch "$HOME/.bash_profile"
