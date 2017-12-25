# time # comment this line out when not recording how long it takes to start
# an instance of the fish shell.
###
# alternative to using `time` is to use `date`
###
# NOTE: BSD based systems don't support nano seconds, `%N`
# so use GNU coreutils `gdate` or better know as `date` on *nix 🐧
###
# set -x fish_start_time (gdate +%s.%N)

# =============================================================================
# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth chris.r.jones.1983@gmail.com
# =============================================================================
#
# NOTE: `1` represents standard out or STDOUT / stdout
# `2` represents standard error or STDERR / stderr
# NOTE: common practice is to redirect both stderr and stdout to the same file
# i.e., tmux 2>&1 $HOME/logs/tmux.log &
# i.e., tmux > $HOME/logs/tmux.log 2>&1
# NOTE; tmux supports 4 levels of verbosity using `-vvvv` ✅


# set the size of the command history for fish
# NOTE: fish supports 256K unique commands in history,
# SEE: https://github.com/fish-shell/fish-shell/issues/2674

# TODO: figure how scoping works in the fish shell, i.e. access variables
# defined within a function.

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

# NOTE: All variables in a shell script are "character strings".
###
# Command aliases
# =============================================================================
###
# Added the below alias because I'm really tired of typing out the below
# command.
###
alias editfish='nvim $HOME/.config/fish/config.fish'
alias editnvim='nvim $HOME/.config/nvim/init.vim'
alias l='ls -lah'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias df='df -h'
alias du='du -h'
alias dotfiles='cd /opt/Code/dotfiles'
alias hmmm='echo "¯\_(ツ)_/¯"'
# preserve the $USER environment when running the sudo command.
alias sudo='sudo -E'

# Command aliases for git projects
alias gs='git status'
alias gd='git diff --stat'
alias ga='git add --all'
alias gp='git push'

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
    # echo $x (asdf list $x | tail -n1) >> /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER
    # CREDIT 💳: @Thom via Gitter
    echo $x (asdf list $x)[-1] >> /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER
  end
  ln -sf /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER $HOME/.tool-versions;
  # echo -e "Successfully generated your .tool-versions file in $HOME"\n"\
  # and it is linked to /opt/Code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER"

  # List the latest version of Python installed in the $HOME directory via asdf
  # set -x PYTHON_LATEST (ls ~/.asdf/installs/python/ | tail -n1)
  set -x PYTHON_LATEST (ls ~/.asdf/installs/python/)[-1]
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
  set -x MANPAGER "nvim -c 'set ft=man' -"
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
    if test -d /home/linuxbrew
      set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
      set -x PATH /home/linuxbrew/.linuxbrew/sbin $PATH
      set -x PATH $PATH /usr/local/sbin
      set -x PATH $PATH /usr/sbin
      set -x PATH $PATH /sbin

      if type -q nvim
        [ -x "/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh" ]; and \
        alias less='/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh';
      end

      # ln -sf /home/linuxbrew/.linuxbrew/share/man
      # set -x MANPATH $MANPATH /home/linuxbrew/.linuxbrew/share/man
      # set -x INFOPATH $INFOPATH /home/linuxbrew/.linuxbrew/share/info
    end
    # Set the default editor when using the `visudo` command.
    # the below env var did not fix my `visudo` issue.
    # thanks for nothing internet 🌎
    # set -x VISUAL nvim;
    # if [ $TERM = "screen" ] and [(set -q TMUX)]; then
    # if string match -qr '^screen' $TERM; and set -q TMUX
    #   mkdir $HOME/logs 2> /dev/null
    #   set logname (gdate '+%d%m%Y%H%M%S').tmux.log
    #   script -f $HOME/logs/$logname
    #   exit
    # end
  case Darwin
    # Credit 💳 https://matoski.com/article/tmux-auto-logging-output/
    # NOTE: $PPID = parent process ID. NOTE: $PPID env var is not set in 🐟
    # string match -qr '^elixir'
    # if [ $TERM = "screen" ] and [(set -q TMUX)]; then
    # if string match -qr '^screen' $TERM; and set -q TMUX
    #   mkdir $HOME/logs 2> /dev/null
    #   set logname (gdate '+%d%m%Y%H%M%S').tmux.log
    #   script -t30 $HOME/logs/$logname
    #   exit
    # end


    ###
    # Add below command / truthy statement to add syntax highlighting for `less`
    ###
    #########
    if type -q nvim
      [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
      alias less='/usr/local/share/nvim/runtime/macros/less.sh';
    end

    alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    # Setup OS specific PATH variables for macOS
    # Add the below path in order to get react-native CLI working.
    set -x PATH $PATH /usr/local/sbin
    set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
    set -x PATH $PATH $HOME/anaconda2/bin
    set -x PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
    set -x PATH $PATH $HOME/bin

    # Add man 📚 pages for user installed binaries
    for x in (asdf plugin-list)
      # echo $x/(asdf list $x | tail -n1)
      # set -x ASDF_LATEST_BINS $ASDF_LATEST_BINS (echo $x/(asdf list $x | tail -n1))
      set -x ASDF_LATEST_BINS $ASDF_LATEST_BINS (echo $x/(asdf list $x)[-1])
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

if type -q ccat
  alias cat='ccat'
end
# how to print the output of "time" to standard out after the shell has loaded?
# set -x fish_end_time (gdate +%s.%N)

# echo fish_boot_time (math $fish_end_time - $fish_start_time)
