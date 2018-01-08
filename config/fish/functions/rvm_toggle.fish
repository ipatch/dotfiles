function rvm_toggle --description 'toggle rvm if found'
  # check if `.rvm` exists in $HOME
  if test -d $HOME/.rvm
    if string match -qir '\.rvm' "$PATH"
      echo "rvm is already in the \$PATH"
    else
      rvm default
    end
  else
    if set -l index (string match -qir '\.rvm' $PATH)
      set --erase PATH[$index]
      echo "removed all instances of rvm from the \$PATH"
    else
      echo ".rvm dir was not found in $HOME"
    end
  end
end
