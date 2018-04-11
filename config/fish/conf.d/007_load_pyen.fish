# Load / setup pyenv

###############################
# python env setup
##
if type -q virtualenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # disable default virtualenv prompt
end
if type -q pyenv
  # NOTE: https://github.com/pyenv/pyenv/issues/32#issuecomment-75420781
  status --is-interactive; and source (pyenv init - |psub)

  # set env var for pyenv
  set -gx PYENV_ROOT $HOME/.pyenv

  # path shit
  set -l paths \
  $HOME/.pyenv/shims \
  

  for p in $paths
    if not contains $p $PATH; and test -d $p
      set -x PATH $p $PATH
    end
  end
end


