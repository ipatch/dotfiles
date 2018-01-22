# =============================================================================
# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth chris.r.jones.1983@gmail.com
# =============================================================================

# disable default fish greeting
set fish_greeting ""

if status --is-interactive
  source $HOME/.config/fish/interactive.fish
  # Base16 Shell - a sane colorscheme for better shell colors 🌈
  eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

###
# USER defined environment variables
###
set -gx HOSTNAME (hostname -s)
set -gx DOTFILES /opt/Code/dotfiles

if type -q rustc
  # Add rust-lang local bin directory to PATH for working with cargo.
  set -gx fish_user_paths $fish_user_paths $HOME/.cargo/bin
end

switch (uname)
  case Darwin
    ###
    # Setup OS specific PATH variables for macOS
    ###
    # NOTE: added /usr/local/sbin ahead of /sbin in `/etc/paths`
    # the below PATH var is no longer required.
    ###
    # set -x PATH $PATH /usr/local/sbin
    ###
    # NOTE: when installing GNU versions of such programs as `sed`
    # using homebrew they are prepended with a `g`
    ###
    # NOTE: prepend gnu-sed to the beginning of the $PATH
    ###
    set -gx fish_user_paths $fish_user_paths /usr/local/opt/gnu-sed/libexec/gnubin
    # PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    ###
    # Add the below path in order to get react-native CLI working.
    ###
    set -gx fish_user_paths $fish_user_paths $HOME/Library/Android/sdk/platform-tools
    set -gx fish_user_paths $fish_user_paths $HOME/anaconda2/bin
    set -gx fish_user_paths $fish_user_paths $HOME/.config/yarn/global/node_modules/.bin
    set -gx fish_user_paths $fish_user_paths $HOME/bin
    set -gx fish_user_paths $fish_user_paths $HOME/bin/base16-shell
    if type -q /usr/local/opt/libressl/bin/openssl
      set -gx fish_user_paths $fish_user_paths /usr/local/opt/libressl/bin
    end
    if type -q brew
      set -gx fish_user_paths $fish_user_paths /usr/local/opt/python/libexec/bin
    end

    ###
    # Add below command / truthy statement to add syntax highlighting for `less`
    ###
    if type -q nvim
      set -x EDITOR /usr/local/bin/nvim
      [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
      alias less='/usr/local/share/nvim/runtime/macros/less.sh';
    else
      set -x EDITOR /usr/bin/vim
    end

  case Linux
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
    set -gx DISPLAY "127.0.0.1:10.0"
    set -gx XAUTHORITY "$HOME/.Xauthority"

    if type -q nvim
      set -x EDITOR /home/linuxbrew/.linuxbrew/bin/nvim
      [ -x "/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh" ]; and \
      alias less='/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh';
    else
      set -x EDITOR /usr/bin/vim
    end
end
