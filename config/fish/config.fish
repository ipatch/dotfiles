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
alias du='du -h'
alias dotfiles="cd /opt/Code/dotfiles"

# Command aliases for homebrew install of PostgreSQL
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Get asdf package manager working with fish shell.
source ~/.asdf/asdf.fish

# Configuration required for Ruby Version Manager
# rvm default

# Add the below to the path in order to get react-native CLI working.
set -x PATH $PATH /Users/capin/Library/Android/sdk/platform-tools

# Add the anaconda2 binaries to the path.
set -x PATH $PATH /Users/capin/anaconda2/bin

# Add modules installed from yarn globally to the PATH.
set -x PATH $PATH /Users/capin/.config/yarn/global/node_modules/.bin

# Add local user bin within home directory to the PATH.
set -x PATH $PATH /Users/capin/bin

# Enable shell history for elixir / erlang
set -x ERL_AFLAGS '-kernel shell_history enabled'
