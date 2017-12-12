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

# Get asdf package manager working with fish shell.
source ~/.asdf/asdf.fish

# Configuration required for Ruby Version Manager
# rvm default

# Add rust-lang local bin directory to PATH for working with cargo.
set -x PATH $PATH $HOME/.cargo/bin

# Enable shell history for elixir / erlang
set -x ERL_AFLAGS '-kernel shell_history enabled'

# Setup OS specific environment variables
# DOC: http://fishshell.com/docs/current/tutorial.html#tut_conditionals
switch (uname)
  case Linux
    set -x PATH $PATH /home/linuxbrew/.linuxbrew/bin
    set -x MANPATH $MANPATH /home/linuxbrew/.linuxbrew/share/man
    set -x INFOPATH $INFOPATH /home/linuxbrew/.linuxbrew/share/info
  case Darwin
    alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    
    # Setup OS specific PATH variables for macOS
    
    # Add the below to the path in order to get react-native CLI working.
    set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
    set -x PATH $PATH $HOME/anaconda2/bin
    set -x PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
    set -x PATH $PATH $HOME/bin
end

