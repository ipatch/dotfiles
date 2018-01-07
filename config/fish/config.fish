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
  set -x PATH $PATH $HOME/.cargo/bin
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
    set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
    # PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    ###
    # Add the below path in order to get react-native CLI working.
    ###
    set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
    set -x PATH $PATH $HOME/anaconda2/bin
    set -x PATH $PATH $HOME/.config/yarn/global/node_modules/.bin
    set -x PATH $PATH $HOME/bin

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
        set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
        set -x PATH /home/linuxbrew/.linuxbrew/sbin $PATH
      end
      set -x PATH $PATH /usr/local/sbin
      set -x PATH $PATH /usr/sbin
      set -x PATH $PATH /sbin

      if type -q nvim
        set -x EDITOR /home/linuxbrew/.linuxbrew/bin/nvim
        [ -x "/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh" ]; and \
        alias less='/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh';
      else
        set -x EDITOR /usr/bin/vim
      end
      rvm default

end
