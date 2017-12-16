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

# NOTE: uncomment the below command to see diagnostic 🚕 info about the env var.
# set -S ERL_VER

# Check if the asdf bin exists
if type -q asdf
  rm -f /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER > /dev/null
  # 1) List installed plugins & version numbers via asdf version manager
  # 2) put the above output into a file.
  for x in (asdf plugin-list)
    echo $x (asdf list $x | tail -n1) >> /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER
  end
  ln -sf /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER $HOME/.tool-versions;
  # echo -e "Successfully generated your .tool-versions file in $HOME"\n"\
  # and it is linked to /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER"
else
  # echo asdf is not installed on this system.
end

# cheers 🍺 for tr 😎
# return the current version of erlang / OTP installed on the local system.
set -x ERL_VER (erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell\
 | tr -d \r'"')

# Enable shell history for elixir / erlang
# Ref: https://stackoverflow.com/questions/9560815/
switch $ERL_VER
  case '20'
    set -x ERL_AFLAGS '-kernel shell_history enabled'
  case '*'
    # echo OTP v20 is not present on this system.;
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

    # NOTE: to access an individual item of a list
    # echo $PATH[1]
end
