##############################
# Load / setup pythons 🐍
##

##############################
# fish prompt specifics
##
if type -q virtualenv
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1 # disable default virtualenv prompt
end

##############################
# pyenv - setup
##
if type -q pyenv
  # set mandatory env var for pyenv
  set -gx PYENV_ROOT $HOME/.pyenv

  # NOTE: https://github.com/pyenv/pyenv/issues/32#issuecomment-75420781
  # NOTE: commenting out the below line will remove `pyenv` from managing pythons
  status --is-interactive; and pyenv init - | source
  
  # NOTE: the below path specifics, aren't required because `pyenv init` should manipulate the `$PATH` accordingly.

  # # path shit
  # set -l paths \
  # $HOME/.pyenv/shims \
  

  # for p in $paths
  #   if not contains $p $PATH; and test -d $p
  #     set -x PATH $p $PATH
  #   end
  # end
end


