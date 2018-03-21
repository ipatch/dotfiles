#############################
#
# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth <- twitter
# Contact: @ipatch <- github 
# Email: chris.r.jones.1983@gmail.com
##

#############################
# fundle setup
##
fundle plugin 'edc/bass'
# fundle plugin 'tuvistavie/fish-ssh-agent'

fundle init
# END - fundle setup

# disable default fish greeting
set fish_greeting ""

if status --is-interactive
  source $HOME/.config/fish/interactive.fish
  # Base16 Shell - a sane colorscheme for better shell colors 🌈
  eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

#############################
# USER defined environment variables
##
set -gx TERM xterm-256color
set -gx HOSTNAME (hostname -s)
set -gx DOTFILES /opt/Code/dotfiles
set -gx dotfiles /opt/Code/dotfiles
set -gx dot /opt/Code/dotfiles
set -gx dots /opt/Code/dotfiles
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx CODE /opt/code
set -gx code /opt/code
# set -gx LC_CTYPE "en_US.UTF-8"
# set -gx GREP_OPTIONS --color=auto

if type -q rustc
  # Add rust-lang local bin directory to PATH for working with cargo.
  set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
end

if type -q fzf
  # set -gx FZF_DEFAULT_COMMAND 'fd --type f'
  # set -gx FZF_DEFAULT_COMMAND 'git ls-files'
  # NOTE: the below `rg` is short for ripgrep and can be installed via homebrew
  if type -q rg
    set -gx FZF_DEFAULT_COMMAND 'rg --files'
  else
    # DO SOMETHING!
  end
  # set -gx FZF_DEFAULT_OPTS --preview='head -n50 {}'
  set -gx FZF_DEFAULT_OPTS '--preview="head -n50 {}"'
  # TODO: figure out how to properly load function in fish
  # _fzf_compgen_path() {
  #   fd --hidden --follow --exclude ".git" . "$argv"
  # }
end

switch (uname)
  case Darwin
    #########################
    # macOS specific env vars
    ##
    # set -gx LC_ALL "en_US.UTF-8"
    # set -gx LANG "en_US"
    #########################
    # Setup OS specific PATH variables for macOS
    #
    # NOTE: added /usr/local/sbin ahead of /sbin in `/etc/paths`
    #
    #########################
    # NOTE: prepend gnu-sed to the beginning of the $fish_user_paths
    ##
    set -gx fish_user_paths $fish_user_paths /usr/local/opt/gnu-sed/libexec/gnubin
    #########################
    # Add the below path in order to get react-native CLI working.
    ##
    set -gx fish_user_paths $fish_user_paths $HOME/Library/Android/sdk/platform-tools
    # set -gx fish_user_paths $fish_user_paths $HOME/anaconda2/bin
    set -gx fish_user_paths $fish_user_paths $HOME/.config/yarn/global/node_modules/.bin
    set -gx fish_user_paths $fish_user_paths $HOME/bin
    set -gx fish_user_paths $fish_user_paths $HOME/.local/bin
    set -gx fish_user_paths $fish_user_paths $HOME/bin/base16-shell
    if type -q /usr/local/opt/libressl/bin/openssl
      set -gx fish_user_paths $fish_user_paths /usr/local/opt/libressl/bin
    end
    if type -q brew
      # set -gx fish_user_paths $fish_user_paths /usr/local/opt/python/libexec/bin
    end
    if type -q /usr/local/bin/go
      set -gx fish_user_paths $fish_user_paths /usr/local/opt/go/libexec/bin
    end
    ###
    # set env vars for git
    ###
    set -gx GPG_TTY (tty)

    if type -q node; and type -q rlwrap;
      # TODO: figure out why this was breaking `tab` completion in node 🤷‍♀️
      # set -gx NODE_NO_READLINE 1
    else
      # DO SOMETHING
      # echo "Your gunna need to do a `brew install rlwrap`"
    end
    

    #########################
    # Add below command / truthy statement to add syntax highlighting for `less`
    ##
    if type -q nvim
      # TODO: don't hard code path to `nvim` search for `nvim` instead
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx MYVIMRC $HOME/.vimrc
      set -gx VIMCONFIG $HOME/.vim/pack/bundle/start
      set -gx VIMDATA $HOME/.vim/undo
      [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
      alias less='/usr/local/share/nvim/runtime/macros/less.sh';
    else
      set -gx EDITOR /usr/bin/vim
      set -gx MYVIMRC $HOME/.vimrc
    end

  case Linux
    ###############################
    # Linux specific env var
    ##
    # set -gx LANGUAGE "en_US.UTF-8"
    # set -gx LANG "en_US"
    # set -gx LC_ALL "en_US.UTF-8"
    
    if test -d /home/linuxbrew
      set -gx fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
      set -gx fish_user_paths /home/linuxbrew/.linuxbrew/sbin $fish_user_paths
      set -gx fish_user_paths /home/linuxbrew/.linuxbrew/opt/python/libexec/bin $fish_user_paths
    end
    set -gx fish_user_paths $fish_user_paths /usr/local/sbin
    set -gx fish_user_paths $fish_user_paths /usr/sbin
    set -gx fish_user_paths $fish_user_paths /sbin

    # set $DISPLAY to allow X11 forwarding through SSH, necessary to get
    # xclip to behave as intended.
    set -gx DISPLAY "127.0.0.1:11.0"
    set -gx XAUTHORITY "$HOME/.Xauthority"

    if type -q nvim
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx MYVIMRC $HOME/.vimrc
      set -gx VIMCONFIG $HOME/.vim/pack/bundle/start
      set -gx VIMDATA $HOME/.vim/undo
      [ -x "/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh" ]; and \
      alias less='/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh';
    else
      set -gx EDITOR /usr/bin/vim
      set -gx VISUAL /usr/bin/vim
      set -gx MYVIMRC $HOME/.vimrc
    end
end

####
# NOTE: don't enable the below functions if using an external theme from omf such as lambda
####

# NOTE: fish suports both a left & right prompt
# function fish_prompt
# end

# function fish_right_prompt
#   # TODO: flesh out the right prompt to display the current
#   #...python, ruby, elixir, etc etc with a pretty glyph
# end
