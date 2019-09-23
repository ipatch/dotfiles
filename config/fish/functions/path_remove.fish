function path_remove --description 'remove a PATH from \$PATH'
  if set -l index (contains -i $argv[1] $PATH)
    set --erase PATH[$index]
    echo "Updated PATH: $PATH"
  else
    echo "$argv[1] not found in PATH: $PATH"
  end
end

# 💳 https://superuser.com/a/1212305/148584
