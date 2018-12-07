# pyenv setup
set -gx PYENV_ROOT $HOME/.pyenv

set -l pyenv_bin $PYENV_ROOT/bin

# for x in $pyenv_bin
#   if begin not contains $x $PATH; and test -d $x; end
#     set -gx PATH $x $PATH
#   end
# end

for p in $pyenv_bin
  if not contains $p $PATH; and test -d $p
    set -gx PATH $p $PATH
  end
end

set -gx PYENV_SHELL fish
source '/Users/capin/.pyenv/libexec/../completions/pyenv.fish'
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
