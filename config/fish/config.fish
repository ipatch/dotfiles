##############################
# User specified file for configuring fish shell.
# Author: Chris Jones
# Contact: @truckmonth <- twitter
# Contact: @ipatch <- github 
# Email: chris.r.jones.1983 [at] gmail [dot] com
##

##############################
# NOTE: fish load order
# https://fishshell.com/docs/current/index.html#initialization
##
# DONT edit files within `$__fish_datadir/config.fish` ie. /usr/share/fish/config.fish
# System-wide config `/etc/fish/config.fish` if installed with homebrew `(brew --prefix)/etc/fish/`
##
# NOTE: if a directory has been added to the $PATH but no longer is in this file but is still listed in the $PATH env var then manually remove the directory from the $PATH using the `path_remove` function contained with the `functions` dir

##############################
# fundle setup BYE, BYE
##


set fish_greeting "" # disable default fish greeting

if status --is-interactive
  source $HOME/.config/fish/interactive.fish

  # Base16 Shell - a sane colorscheme for better shell colors 🌈
  # eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
  set BASE16_SHELL "$HOME/.config/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
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
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_DATA $HOME/.local/share
set -gx CODE /opt/code
set -gx code /opt/code
set -gx github /opt/code/github
set -gx private /opt/code/github/PRIVATE
set -gx public /opt/code/github/PUBLIC
set -gx fish_emoji_width 2 # NOT COMPATIBLE with fish <= 2.7.1

if type -q brew
	set -gx brew_logs (brew --prefix)/var/log/
end
	
if type -q python
  set -gx PYTHONSTARTUP $HOME/.pystartup
end

##############################
# Crypto
##
if type -q gpg-agent
  set -gx GPG_TTY (tty)
end

##############################
# OCaml tooling
##

#########################
# Go language tooling
##
if test -x (brew --prefix)/bin/go
  set -gx GOPATH $HOME/go
  # DO NOT set `GOROOT` permanently
  # set -gx GOROOT (brew --prefix)/opt/go
else
  # DO NOT PASS GO, DO NOT COLLECT $200
end

##############################
# dotnet tooling
##
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
# To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only). 

##############################
# Erlang & Elixir tooling
##
if [ -x $HOME/.asdf/shims/erl ] || [ -x $HOME/.asdf/shims/iex ]
  set -gx ERL_AFLAGS "-kernel shell_history enabled"
end

##############################
# git related settings
##
set -gx GIT_RC $XDG_CONFIG_HOME/git
# set -gx GIT_DIR $XDG_CONFIG_HOME/git

##############################
# locale settings
##
# set -gx LC_ALL "en_US.UTF-8" # only set this if you want to overwrite ALL locales!

##############################
# fzf
##
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

switch $os 
case Darwin
  #########################
  # macOS specific env vars, boo
  ##
  if [ "$TERM_PROGRAM" = iTerm.app ]
    set -gx COLORTERM truecolor
  else
    # DO NOTHIGH
  end

  #########################
  # `ls` colorscheme for BSD / Darwin
  ##
  set -gx LSCOLORS Exfxcxdxcxegedabagacad

  if test -d (brew --prefix)/opt/coreutils
	
    eval (dircolors -c $HOME/.dir_colors)
    alias ls="/usr/local/opt/coreutils/libexec/gnubin/ls --color=auto"
  end

  ###############################
  # Node.js env setup
  ##
  if type -q node; and type -q rlwrap;
    # TODO: figure out why this was breaking `tab` completion in node 🤷
    # set -gx NODE_NO_READLINE 1
  else
    # echo "Your gunna need to do a `brew install rlwrap`"
  end

  if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim

    #########################
    # Add check for syntax highlighting for `less`
    ##
    [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
    alias less='/usr/local/share/nvim/runtime/macros/less.sh';
  else if type -q vim
    set -gx EDITOR /usr/local/bin/vim
    set -gx VISUAL /usr/local/binvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim
  else
    set -gx EDITOR /usr/bin/vim
    set -gx VISUAL /usr/bin/vim
    set -gx MYVIMRC $HOME/.vimrc
  end

  if [ -d $HOME/Library/Android/sdk ]
    set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
    set -gx ANDROID_AVD_HOME "$HOME/.android/avd"
    # TODO: figure out how to properly set the below env var
    # SEE: https://stackoverflow.com/a/47346176/708807
    # set -gx DEFAULT_JVM_OPTS "-Dcom.android.sdklib.toolsdir=$APP_HOME --add-modules java.xml.bind"
  end

case Linux
  ###############################
  # Linux specific env vars
  ##
  eval (dircolors -c $HOME/.dir_colors)

 
  # `$DISPLAY` should be set by SSH configs and NOT shell config files 
  if [ -d $HOME/.terminfo ]
    set -gx TERMINFO "$HOME/.terminfo"
    # set -gx TERM xterm
  else
    # DO NOTHING!
  end

  if type -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim
  else if nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim
    [ -x "/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh" ]; and \
    alias less='/home/linuxbrew/.linuxbrew/share/nvim/runtime/macros/less.sh';
  else
    set -gx EDITOR /usr/bin/vim
    set -gx VISUAL /usr/bin/vim
    set -gx MYVIMRC $HOME/.vimrc
  end
end

##############################
# NOTE: fish suports both left & right prompts
# NOTE: don't enable the below functions if using an external theme from omf ie, neolambda
##

# function fish_prompt
# The left prompt
# end

# function fish_right_prompt
# TODO: flesh out the right prompt to display the current
#...python, ruby, elixir, etc etc with a pretty glyph
# end

