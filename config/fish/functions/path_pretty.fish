function path_pretty --description 'print a pretty listing of the $PATH'
  # 💳 https://github.com/fish-shell/fish-shell/issues/2639#issuecomment-301896209
  echo \$PATH
  echo $PATH | tr " " "\n" | nl

  echo \$fish_user_paths
  echo $fish_user_paths | tr " " "\n" | nl

  # PATH entries can be removed with the below commands
  # set --erase PATH[1]
  # set -e PATH[4]
end
