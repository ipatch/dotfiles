##############################
# User defined configuration file for the fish shell.
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

set fish_greeting "" # disable default fish greeting ⋊>

if status --is-interactive
  source $HOME/.config/fish/interactive.fish # source files within `~/.config/fish/interactive/`

  # Base16 Shell - a sane colorscheme for better shell colors 🌈
  set BASE16_SHELL "$HOME/.config/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
end

#############################
# USER defined environment variables
##
# set -gx TERM xterm-256color # <= ❗️ DON'T explicitly set this env var!
set -gx HOSTNAME (hostname -s)
set -gx dotfiles /opt/code/dotfiles
set -gx dots /opt/code/dotfiles
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_DATA $HOME/.local/share
set -gx code /opt/code
set -gx github /opt/code/github
set -gx gh /opt/code/github
set -gx forks /opt/code/github/public/forks
set -gx forksgh /opt/code/github/public/forks
set -gx githubforks /opt/code/github/public/forks
set -gx ghforks /opt/code/github/public/forks
set -gx private /opt/code/github/private
set -gx gitlab /opt/code/gitlab
set -gx public /opt/code/public
set -gx publicgh /opt/code/public/github
set -gx mygitreps /opt/code/git/github/my.github.repos
set -gx mybtap /opt/code/git/github/public/homebrew-us-05
set -gx mytap /opt/code/git/github/public/homebrew-us-05


set -gx fish_emoji_width 2 # NOT COMPATIBLE with fish <= 2.7.1
set -gx docker /opt/docker
set -gx ltmp $HOME/ltmp

# TODO: exp neovim + python 3.8 issue
set -gx LANG "en_US.UTF-8"


# set -gx vbox-shared $HOME/vm/vbox-shared # NO GO!
# set -gx vbox.shared $HOME/vm/vbox.shared # periods in identifiers are a no go!
set -gx vboxshared $HOME/vm/vbox-shared

set -gx lbin $HOME/.local/bin

if type -q brew
	set -gx brew_logs (brew --prefix)/var/log/
  set -gx brewcache $HOME/Library/Caches/Homebrew
  set -gx HOMEBREW_NO_AUTO_UPDATE 1
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
# r2 tooling
##
if [ -x /usr/local/bin/r2 ]
  set -gx RHOMEDIR ~/.config/radare2
  set -gx RCFILE ~/.config/radare2/radare2rc
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
  # NOTE: `rg` stands for ripgrep and can be installed via brew or cargo (use cargo)
  # --files: List files that would be searched but do not search
  # --no-ignore: Do not respect .gitignore, etc...
  # --hidden: Search hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

  # TODO: exp

  # if type -q rg
  #   set -gx FZF_DEFAULT_COMMAND 'rg \
  #   --files --no-ignore --hidden --follow --glob "!.git/*"'
  # else
  # # DO SOMETHING!
  # end

  # set -gx FZF_DEFAULT_OPTS '--preview="head -n50 {}"'
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

  set -gx picsrc $HOME/Pictures/source
  set -gx picss $HOME/Pictures/source
  set -gx psrc $HOME/Pictures/source

  #########################
  # `ls` colorscheme for BSD and Darwin
  ##
  # ls colors are defined within $HOME/.dir_colors, ie. ls colors database
  set -gx LSCOLORS Exfxcxdxcxegedabagacad

  if test -d (brew --prefix)/opt/coreutils
    # TODO: device a check for either {g,d}ircolors
    gdircolors -c $HOME/.dir_colors | source
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
  # macOS > Docker tooling
  ##
  set -gx ETC_LOCALTIME (realpath /etc/localtime)
  set -gx TZ (readlink /etc/localtime | sed 's#/var/db/timezone/zoneinfo/##');

  if type -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx MYVIMRC $HOME/.vimrc
    set -gx VIMDATA $HOME/.vim
    set -gx vimsnips $HOME/.vim/snips
    set -gx vsnips $HOME/.vim/snips
    set -gx vimsesh $HOME/.vim/tmp/sessions
    set -gx vimses $HOME/.vim/tmp/sessions
    set -gx vses $HOME/.vim/tmp/sessions

    #########################
    # check for `less` cmd syntax highlighting
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
  # fisher | fish shell > plugin manager
  ##
  set -gx fisher_path "$XDG_CONFIG_HOME/fish/fisher"
  set fish_function_path $fish_function_path $fisher_path/functions
  set fish_complete_path $fish_complete_path $fisher_path/completions

  for file in "$HOME/.config/fisher/conf.d/*.fish"
    builtin source $file 2> /dev/null
  end

  ###############################
  # personal macOS things to help solve first world problems
  ##
  set -gx streams "$HOME/Movies/my-recordings/streams"

case Linux
  ###############################
  # GNU+Linux specific env vars
  ##
  dircolors -c $HOME/.dir_colors | source

  # `$DISPLAY` should be set by SSH configs and ❗️ NOT shell config files 
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
# NOTE: fish shell suports both left & right prompts
# NOTE: don't enable the below functions if using an external theme from omf ie, neolambda
##

## Example func
#
# function fish_prompt
#   echo "The left prompt"
# end

## Example func
#
# function fish_right_prompt
#   echo "TODO: flesh out the right prompt to display the current\n
#   ...python, ruby, elixir, etc etc with a pretty glyph"
# end

# set -g fish_user_paths "/usr/local/opt/postgresql@10/bin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/capin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

