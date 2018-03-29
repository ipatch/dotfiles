##############################
# User specified file for configuring the fish shell.
# Author: Chris Jones
# Contact: @truckmonth <- twitter
# Contact: @ipatch <- github 
# Email: chris.r.jones.1983@gmail.com
##

##############################
# fundle setup
##
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-ssh-agent'

fundle init

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
# set -gx TERM xterm-256color # <= DON'T explicitly set this env var!
set -gx HOSTNAME (hostname -s)
set -gx DOTFILES /opt/Code/dotfiles
set -gx dotfiles /opt/Code/dotfiles
set -gx dot /opt/Code/dotfiles
set -gx dots /opt/Code/dotfiles
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx CODE /opt/code
set -gx code /opt/code
# set -gx PATH # init an empty var first, unless you want dup `PATH` entries
# set -gx LC_CTYPE "en_US.UTF-8" # only set this if you want to overwrite ALL locales!
# set -gx GREP_OPTIONS --color=auto

##############################
# tmux 💩
##
if not contains $HOME/.cargo/bin $PATH; and test -d $HOME/.cargo/bin 
  # Add rust-lang local bin directory to PATH for working with cargo.
  set PATH $HOME/.cargo/bin $PATH
end

if type -q fzf
  # NOTE: the below `rg` is short for ripgrep and can be installed via homebrew
  # --files: List files that would be searched but do not search
  # --no-ignore: Do not respect .gitignore, etc...
  # --hidden: Search hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  if type -q rg
    set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
else
  # DO SOMETHING!
end
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
  #########################
  # Setup OS specific PATH variable for macOS
  # NOTE: added /usr/local/sbin above of /sbin in `/etc/paths`
  #
  #########################
  # Add below path to get react-native CLI working.
  ##
  if not contains $HOME/Library/Android/sdk/platform-tools $PATH
  and test -d $HOME/Library/Android/sdk/platform-tools
    set PATH $HOME/Library/Android/sdk/platform-tools $PATH # will prepend (begin) to `$PATH`
  end
  if not contains $HOME/anaconda2/bin $PATH
  and test -d $HOME/anaconda2/bin
    set PATH $PATH $HOME/anaconda2/bin # will append (end) to `$PATH`
  end
  if not contains $HOME/.config/yarn/global/node_modules/.bin $PATH
  and test -d $HOME/.config/yarn/global/node_modules/.bin
    set PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
  end
  if not contains $HOME/bin $PATH
  and test -d $HOME/bin
    set PATH $PATH $HOME/bin 
  end
  if not contains $HOME/.local/bin $PATH
  and test -d $HOME/.local/bin
    set PATH $PATH $HOME/.local/bin
  end
  if not contains $HOME/bin/base16-shell $PATH
  and test -d $HOME/bin/base16-shell
    set PATH $PATH $HOME/bin/base16-shell
  end
  if type -q brew # `-q` suppresses all output
    # prepend gnu-sed to beginning of PATH, so macOS `sed` won't be used.
    if not contains /usr/local/opt/gnu-sed/libexec/gnubin $PATH
    and test -d /usr/local/opt/gnu-sed
      set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
    end
    if not contains /usr/local/opt/libressl/bin $PATH
    and test -d /usr/local/opt/libressl
      set PATH /usr/local/opt/libressl/bin $PATH
    end
    if not contains /usr/local/opt/python/libexec/bin $PATH
    and test -d /usr/local/opt/python
      set PATH /usr/local/opt/python/libexec/bin $PATH
    end
  end
  ###############################
  # set env vars for git
  ##
  set -gx GPG_TTY (tty)

  if type -q node; and type -q rlwrap;
    # TODO: figure out why this was breaking `tab` completion in node 🤷‍♀️
    # set -gx NODE_NO_READLINE 1
  else
    # DO SOMETHING
    # echo "Your gunna need to do a `brew install rlwrap`"
  end


  if type -q nvim
    # TODO: don't hard code path to `nvim` search for `nvim` instead
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMCONFIG $HOME/.vim/pack/bundle/start
    set -gx VIMDATA $HOME/.vim/undo
    # set -gx MANPAGER /usr/local/share/nvim/runtime/macros/less.sh
    # set -gx MANPAGER nvim -c 'set ft=man' -
    # set -x MANPAGER "/bin/sh -c \"unset MANPAGER;col -b -x | \
    # nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    # -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    # -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
    # set -gx MANPAGER "/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

    #########################
    # Add check for syntax highlighting for `less`
    ##
    [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
    alias less='/usr/local/share/nvim/runtime/macros/less.sh';
    set -x MANPAGER 'less -R'
  else
    set -gx EDITOR /usr/bin/vim
    set -gx MYVIMRC $HOME/.vimrc
  end

case Linux
  ###############################
  # Linux specific env vars
  ##
  ###############################
  # PATH 💩
  ##
  if not contains /usr/local/sbin $PATH
  and test -d /usr/local/sbin
    set PATH /usr/local/sbin $PATH
  end
  if not contains /usr/sbin $PATH
  and test -d /usr/sbin
    set PATH /usr/sbin $PATH
  end
  if not contains /sbin $PATH
  and test -d /sbin
    set PATH /sbin $PATH
  end
  if not contains /home/linuxbrew/.linuxbrew/bin/ $PATH
  and test -d /home/linuxbrew/.linuxbrew/{s}bin
      set PATH /home/linuxbrew/.linuxbrew/sbin $PATH
      set PATH /home/linuxbrew/.linuxbrew/bin $PATH # put at beginning of `PATH`
  end
  if not contains /home/linuxbrew/.linuxbrew/opt/python/libexec/bin $PATH
  and test -d /home/linuxbrew/.linuxbrew/opt/python/libexec/bin
    set PATH /home/linuxbrew/.linuxbrew/opt/python/libexec/bin $PATH
  end

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

##############################
# NOTE: don't enable the below functions if using an external theme from omf such as lambda
##

##############################
# NOTE: fish suports both a left & right prompt
# function fish_prompt
# end
##

# function fish_right_prompt
#   # TODO: flesh out the right prompt to display the current
#   #...python, ruby, elixir, etc etc with a pretty glyph
# end
