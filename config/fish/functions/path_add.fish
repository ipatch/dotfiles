function path_add --description 'add a PATH to \$fish_user_paths'
  contains -- $argv $fish_user_paths
    or set -gx fish_user_paths $fish_user_paths $argv
  echo "Upated PATH: $PATH"
end

# 💳 https://superuser.com/a/1212305/148584
