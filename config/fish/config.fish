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

fundle init

set fish_greeting "" # disable default fish greeting

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

##############################
# git related settings
##
set -gx GIT_RC $XDG_CONFIG_HOME/git

# set -gx PATH # init an empty var first, unless you want dup `PATH` entries
# set -gx LC_CTYPE "en_US.UTF-8" # only set this if you want to overwrite ALL locales!
# set -gx GREP_OPTIONS --color=auto

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

switch (uname)
case Darwin
  #########################
  # macOS specific env vars
  ##
  if echo $TERM_PROGRAM | string match -r -q "iTerm.app"
    set -gx COLORTERM truecolor
  else
    # DO NOTHIGH
  end

  ###############################
  # python env setup
  ##
  if type -q virtualenv
    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # disable default virtualenv prompt
  end
  if type -q pyenv
    # NOTE: https://github.com/pyenv/pyenv/issues/32#issuecomment-75420781
    status --is-interactive; and source (pyenv init - |psub)
  end

  ###############################
  # set env vars for git
  ##
  set -gx GPG_TTY (tty)

  ###############################
  # Node.js env setup
  ##
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

    #########################
    # Add check for syntax highlighting for `less`
    ##
    [ -x "/usr/local/share/nvim/runtime/macros/less.sh" ]; and \
    alias less='/usr/local/share/nvim/runtime/macros/less.sh';
  else
    set -gx EDITOR /usr/bin/vim
    set -gx MYVIMRC $HOME/.vimrc
  end

case Linux
  ###############################
  # Linux specific env vars
  ##
 
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
