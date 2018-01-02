function toggle_asdf_shims_and_bins --description 'managing asdf bins / shims in a sane way!'
  # check to see if asdf_pythons are in the PATH
  if set -l index (contains -i $HOME/.asdf/shims $PATH)
    set -e PATH[$index]
    echo removed asdf shims from PATH
  else
    set -x PATH $HOME/.asdf/shims $PATH
    echo added asdf shims to PATH
  end
  if set -l index (contains -i $HOME/.asdf/bin $PATH)
    set -e PATH[$index]
    echo removed asdf shims and bins from PATH
  else
    set -x PATH $HOME/.asdf/bin $PATH
    echo added asdf bins to PATH
  end
end
