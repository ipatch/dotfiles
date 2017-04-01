# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth chris.r.jones.1983@gmail.com

# set the size of the command history for fish
# Note - fish supports 256K unique commands in history,
# SEE - https://github.com/fish-shell/fish-shell/issues/2674


# Command aliases
alias l='ls -lah'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

# Command aliases for git projects
alias gs='git status'
alias gd='git diff --stat'
alias ga='git add --all'
alias gp='git push'

# Command aliases
alias df='df -h'
alias dotfiles="cd /opt/Code/dotfiles"

# Get asdf package manager working with fish shell.
source ~/.asdf/asdf.fish

# Configuration required for Ruby Version Manager
# rvm default

# Add the below to the path in order to get react-native CLI working.
set -x PATH $PATH /Users/capin/Library/Android/sdk/platform-tools
