function path_pretty_redux --description 'print a pretty listing of the $PATH'
  # https://github.com/fish-shell/fish-shell/issues/2639#issuecomment-301896209
  # NOTE: the below cmd will split path entries on a ␣ `space` char thus falsely reporting the number of path entries 
  #
  # echo $PATH | tr " " "\n" | nl
  # NOTE: see above note
  ###

  set -l p (echo $PATH[1..-1])

  # DEBUG
  # echo "$p"

  set -l p_colon (echo "$p" | sed s'/\ \//:\//g; s/\ ~/:~/g; s/\ .:/:.:/g')

  # NOTE: the above `sed` expression uses 3 seek and replace queries to place a `:` entires in the `p_colon` env var.

  # DEBUG
  # echo "================================================"

  # DEBUG
  # echo "$p_colon"

  # DEBUG
  # echo "================================================"

  echo "$p_colon"  | string split ":" | nl
  echo "The above list are the ordered entries in the \$PATH"

  echo "$fish_user_paths"
  echo "The above list are the ordered entries in the \$fish_user_paths"

  # NOTE: the above cmd will split the entries contained with the `p_colon` env var at the `:` char

  ####
  # NOTE: removing entries from $PATH
  ##
  # PATH entries can be removed with the below commands
  # set --erase -g PATH[1]
  # set -eg PATH[4]
end
