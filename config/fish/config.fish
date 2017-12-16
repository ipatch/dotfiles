# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth chris.r.jones.1983@gmail.com

# set the size of the command history for fish
# NOTE: fish supports 256K unique commands in history,
# SEE: https://github.com/fish-shell/fish-shell/issues/2674

# TODO: figure how scoping works in the fish shell, i.e. access variables
# defined within a function.

# NOTE: All variables in a shell script are "character strings".

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
alias dotfiles='cd /opt/Code/dotfiles'

# Get asdf package manager working with fish shell.
source ~/.asdf/asdf.fish

# Configuration required for Ruby Version Manager
# rvm default

# ==============================================================================

# USER defined environment variables
set -x HOSTNAME (hostname -s)



# ==============================================================================

# Add rust-lang local bin directory to PATH for working with cargo.
set -x PATH $PATH $HOME/.cargo/bin

# NOTE: according to the below link,
# https://stackoverflow.com/a/7372938/708807
# \r is a carriage return character; it tells your terminal emulator to move the
# cursor at the start of the line.

# return the current version of erlang / OTP installed on the local system.

# cheers 🍺 for tr 😎
set -x ERL_VER (erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell\
 | tr -d \r'"')

# print / show the value & scope of ERL_VER
# Note: presently the below command prints the below output
#####
# $ERL_VER: not set in local scope
# # $ERL_VER: set in global scope, exported, with 1 elements
# # $ERL_VER[1]: length=5 value=|"20"\r|
# $ERL_VER: not set in universal scope
# set -S ERL_VER

# TL;DR
# value=|"20"\r|

# TODO: figure out to remove \r (carriage return)
# SOLVED: used "tr" to remove carriage return and double quotes

# NOTE: uncomment the below command to see diagnostic 🚕 info about the env var.
# set -S ERL_VER

# Enable shell history for elixir / erlang
# Ref: https://stackoverflow.com/questions/9560815/
switch $ERL_VER
  case '20'
    set -x ERL_AFLAGS '-kernel shell_history enabled'
  case '*'
    echo OTP v20 is not present on this system.;
end

# Setup OS specific environment variables
# DOC: http://fishshell.com/docs/current/tutorial.html#tut_conditionals
switch (uname)
  case Linux
    set -x PATH $PATH/home/linuxbrew/.linuxbrew/bin
    set -x MANPATH $MANPATH/home/linuxbrew/.linuxbrew/share/man
    set -x INFOPATH $INFOPATH/home/linuxbrew/.linuxbrew/share/info
  case Darwin
    alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    # Setup OS specific PATH variables for macOS

    # Add the below path in order to get react-native CLI working.
    set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
    set -x PATH $PATH $HOME/anaconda2/bin
    set -x PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
    set -x PATH $PATH $HOME/bin

    # Check if the asdf bin exists
    if type -q asdf
      # 1) List installed plugins via asdf version manager
      # 2) put the above output into a file.
      asdf plugin-list > /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER;
      ln -sf /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER $HOME/.tool-versions;
      echo -e "Successfully generated your .tool-versions file in $HOME"\n"\
and it is linked to /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER"
    else
      echo asdf is not installed on this system.
    end



    # List installed versions
    asdf list

    # NOTE: to access an individual item of list
    # echo $PATH[1]
end
