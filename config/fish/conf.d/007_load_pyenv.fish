##############################
# Load / setup pyenv pythons 🐍
##

##############################
# fish prompt specifics
##
if type -q virtualenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # disable default virtualenv prompt
end

if type -q pyenv; and status --is-interactive
  # set mandatory env var for pyenv
  set -gx PYENV_ROOT $HOME/.pyenv
  # set -gx PATH '/Users/capin/.pyenv/shims' $PATH
  set -l paths \
  $PYENV_ROOT/bin \
  $PYENV_ROOT/shims
  
  for p in $patsh
    if not contains $p $PATH; and test -d $p
      set -gx PATH $p $PATH
    end
  end
  set -gx PYENV_SHELL fish
  function pyenv
    set command $argv[1]
    set -e argv[1]
    source '/Users/capin/.pyenv/libexec/../completions/pyenv.fish'
    # command pyenv rehash 2>/dev/null
    switch "$command"
    case activate deactivate rehash shell
    # source (pyenv "sh-$command" $argv|psub)
    pyenv "sh-$command" $argv | source
    case '*'
    command pyenv "$command" $argv
    end # case
  end # func
end
