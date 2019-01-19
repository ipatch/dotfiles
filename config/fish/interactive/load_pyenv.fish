# pyenv setup
set -gx PYENV_ROOT $HOME/.pyenv

set -l pyenv_bin $PYENV_ROOT/bin
set -l pyenv_shims $PYENV_ROOT/shims

# echo $os # returns my local `os` env var

switch $os
  case Darwin
    for p in $pyenv_bin and $pyenv_shims
      if not contains $p $PATH && test -d $p
        set -gx PATH $p $PATH
      end
    end
end

set -gx PYENV_SHELL fish
source $HOME/.pyenv/libexec/../completions/pyenv.fish
# NOTE for reasons I do NOT know the below statement will bolt on ~ 200ms to fish load time
# command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

if type -q virtualenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # disable default virtualenv prompt
end
