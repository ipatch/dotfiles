function path_add --description 'add a PATH to "$"PATH'
  contains -- $argv $PATH
    or set -gx PATH $PATH $argv
  echo "Upated PATH: $PATH"
end

# 💳 https://superuser.com/a/1212305/148584
