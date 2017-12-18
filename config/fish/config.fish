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

if type -q rustc
  # Add rust-lang local bin directory to PATH for working with cargo.
  set -x PATH $PATH $HOME/.cargo/bin
end

# NOTE: according to the below link,
# https://stackoverflow.com/a/7372938/708807
# \r is a carriage return character; it tells your terminal emulator to move the
# cursor at the start of the line.

# NOTE: uncomment the below command to see diagnostic 🚕 info about the env var.
# set -S ERL_VER

# Check if the asdf binary exists
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

  # List the latest version of Python installed in the $HOME directory via asdf
  set -x PYTHON_LATEST (ls ~/.asdf/installs/python/ | tail -n1)
  # Add the latest version of Python to the PATH
  set -x PATH $PATH ~/.asdf/installs/python/$PYTHON_LATEST/bin

else
  # echo asdf is not installed on this system.
end

# Symlink / link dotfiles from /opt/Code/dotfiles/ to $HOME directory.
ln -sf /opt/Code/dotfiles/bash/bash_profile $HOME/.bash_profile
ln -sf /opt/Code/dotfiles/bash/bashrc $HOME/.bashrc

if type -q nvim
  ln -sf /opt/Code/dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim
end

if type -q vim
  ln -sf /opt/Code/dotfiles/vim/editorconfig $HOME/.editorconfig
  ln -sf /opt/Code/dotfiles/vim/vimrc $HOME/.vimrc
end

ln -sf /opt/Code/dotfiles/git/gitconfig  $HOME/.gitconfig

if type -q r2
  ln -sf /opt/Code/dotfiles/radare/radare2rc  $HOME/.radare2rc
end

if type -q tmux
  ln -sf /opt/Code/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
end

if type -q iex
  ln -sf /opt/Code/dotfiles/lang/elixir/iex.exs $HOME/.iex.exs
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
    set -x PATH $PATH /home/linuxbrew/.linuxbrew/bin
    set -x MANPATH $MANPATH /home/linuxbrew/.linuxbrew/share/man
    set -x INFOPATH $INFOPATH /home/linuxbrew/.linuxbrew/share/info
  case Darwin
    alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    # Setup OS specific PATH variables for macOS
    # Add the below path in order to get react-native CLI working.
    set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
    set -x PATH $PATH $HOME/anaconda2/bin
    set -x PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
    set -x PATH $PATH $HOME/bin

    # Add man 📚 pages for user installed binaries
    for x in (asdf plugin-list)
      # echo $x/(asdf list $x | tail -n1)
      set -x ASDF_LATEST_BINS $ASDF_LATEST_BINS (echo $x/(asdf list $x | tail -n1))
      # NOTE: to access an individual item of a list
      # echo $PATH[1]
    end

    # MANPATHS
    # 1) elixir = $HOME/.asdf/installs/elixir/1.5.2/man
    # 2) erlang = $HOME/.asdf/installs/erlang/20.0/lib/erlang/man
    # 3) nodejs = $HOME/.asdf/installs/nodejs/8.1.2/share/man
    # 4) python =  $HOME/.asdf/installs/python/3.6.3/share/man
    # 5) ruby = $HOME/.asdf/installs/ruby/2.3.1/share/man
    # 6) rust = $HOME/.asdf/installs/rust/1.22.1/share/man

    # FOR PEACE OF MIND DON'T SET THE MANPATH ENV VAR!!!

    if type -q asdf
      for x in $ASDF_LATEST_BINS
        if string match -qr '^elixir' $x
          ln -sf $HOME/.asdf/installs/$x/man/* /usr/local/share/man/man1/
        end
        if string match -qr '^erlang' $x
          # TODO: setup erlang documentation.

          # set -x MANPATH $MANPATH $HOME/.asdf/installs/$x/lib/erlang/man
          # ln -s $HOME/.asdf/installs/$x/lib/erlang/man/man[1-7] /usr/local/share/man/man
        end
        if string match -qr '^nodejs' $x
          ln -sf $HOME/.asdf/installs/$x/share/man/man1/* /usr/local/share/man/man1/
        end
        if string match -qr '^python' $x
          # no need to link the python man pages because python links man pages
          # when installing python.
        end
        if string match -qr '^ruby' $x
          # don't link ruby man pages because homebrew has local man pages.
        end
        if string match -qr '^rust' $x
          # set -x MANPATH $MANPATH $HOME/.asdf/installs/$x/share/man
          ln -sf $HOME/.asdf/installs/rust/1.22.1/share/man/man1/* /usr/local/share/man/man1/
        end
      end
    end

    # NOTE: to access an individual item of a list
    # echo $PATH[1]
end

# Add special 🚌 aliases if certain binaries are found.
if type -q pycp
  alias cp='pycp -i'
end
