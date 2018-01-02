function toggle_anaconda_pythons --description 'a sane approach for mananging 🐍'
  # perform a check to see if anaconda2 is in PATH
  # 💳 https://github.com/JorgeBucaran/fish-shell-cookbook/blob/master/README.md#how-to-remove-a-path-from-the-path-in-fish
  if set -l index (contains -i $HOME/anaconda2/bin $PATH)
    set -e PATH[$index]
    echo removed $HOME/anaconda2/bin from PATH
  else
    set -x PATH $PATH $HOME/anaconda2/bin
    echo $HOME/anaconda2/bin added to PATH
  end
end
