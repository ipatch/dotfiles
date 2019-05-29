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
# NOTE: if a directory has been added to the $PATH but no longer is in ./conf.d/001_load_paths.fish but is still listed in the $PATH env var then manually remove the directory from the $PATH using the `path_remove` function contained with the `functions` dir

set fish_greeting "" # disable default fish greeting

if status --is-interactive
  source $HOME/.config/fish/interactive.fish # interactive.fish sources files contained within `~/.config/fish/interactive/`

  # Base16 Shell - a sane colorscheme for better shell colors 🌈
  set BASE16_SHELL "$HOME/.config/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
end

#############################
# USER defined environment variables
##
# set -gx TERM xterm-256color # <= DON'T explicitly set this env var!
set -gx HOSTNAME (hostname -s)
set -gx dotfiles /opt/code/dotfiles
set -gx dots /opt/code/dotfiles
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_DATA $HOME/.local/share
set -gx code /opt/code
set -gx github /opt/code/github
set -gx gh /opt/code/github
set -gx forks /opt/code/github/public/forks
set -gx private /opt/code/github/private
set -gx gitlab /opt/code/gitlab
set -gx public /opt/code/public
set -gx fish_emoji_width 2 # NOT COMPATIBLE with fish <= 2.7.1

if type -q brew
	set -gx brew_logs (brew --prefix)/var/log/
end
	
if type -q python
  set -gx PYTHONSTARTUP $HOME/.pystartup
end

##############################
# Cryptography
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

##############################
# locale settings
##
# set -gx LC_ALL "en_US.UTF-8" # only set this if you want to overwrite ALL locales!

##############################
# fzf
##
if type -q fzf
  # NOTE: `rg` stands for ripgrep and can be installed via brew
  # --files: List files that would be searched but do not search
  # --no-ignore: Do not respect .gitignore, etc...
  # --hidden: Search hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  if type -q rg
    set -gx FZF_DEFAULT_COMMAND 'rg \
    --files --no-ignore --hidden --follow --glob "!.git/*"'
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
  # `ls` colorscheme for BSD and Darwin
  ##
  set -gx LSCOLORS Exfxcxdxcxegedabagacad

  if test -d (brew --prefix)/opt/coreutils
    dircolors -c $HOME/.dir_colors | source
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

  ###############################
  # Docker tooling
  ##
  set -gx ETC_LOCALTIME (realpath /etc/localtime)

  if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim

    #########################
    # Add check for syntax highlighting for `less`
    ##
    if not test -x "/usr/local/share/nvim/runtime/macros/less.sh" \
    -a -L "$HOME/.local/bin/less"
      alias less='$brew_prefix/share/nvim/runtime/macros/less.sh';
      # TODO: echo "less ln made"
    end
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

  ###############################
  # fisher | fish shell plugin manager
  ##
  set -gx fisher_path "$XDG_CONFIG_HOME/fish/fisher"
  set fish_function_path $fish_function_path $fisher_path/functions
  set fish_complete_path $fish_complete_path $fisher_path/completions

  for file in "$HOME/.config/fisher/conf.d/*.fish"
    builtin source $file 2> /dev/null
  end

case Linux
  ###############################
  # Linux specific env vars
  ##
  dircolors -c $HOME/.dir_colors | source

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

