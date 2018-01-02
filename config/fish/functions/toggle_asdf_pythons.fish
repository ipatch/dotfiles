function toggle_asdf_pythons --description 'managing pythons 🐍🐍 in a sane way!'
  # check to see if asdf_pythons are in the PATH

  if grep /anaconda2/bin $PATH
    echo found anaconda2/bin \in \$PATH
  end

  # for x in $PATH
  #   # /anaconda2/bin
  #   if string match -qr '^/anaconda2/bin' $x
  #     set -e PATH $PATH $HOME/anaconda2/bin
  #   else
  #
  # end

end
