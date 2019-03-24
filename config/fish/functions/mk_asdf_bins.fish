function mk_asdf_bins --description 'build `.tool-versions`, then ln in $HOME'
  # Check if the asdf binary exists
  if type -q asdf
    rm -f $DOTFILES/asdf/.tool-versions.$HOSTNAME.$USER > /dev/null
    # 1) List installed plugins & version numbers via asdf version manager
    # 2) put the above output into a file.
    for x in (asdf plugin-list)
      # echo $x (asdf list $x | tail -n1) >> /opt/code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER
      # CREDIT 💳: @Thom via Gitter
      echo $x (asdf list $x)[-1] >> $DOTFILES/asdf/.tool-versions.$HOSTNAME.$USER
    end
    ln -sf $DOTFILES/asdf/.tool-versions.$HOSTNAME.$USER $HOME/.tool-versions;
    # echo -e "Successfully generated your .tool-versions file in $HOME"\n"\
    # and it is linked to /opt/code/dotfiles/asdf/.tool-versions.$HOSTNAME.$USER"

    # List the latest version of Python installed in the $HOME directory via asdf
    # set -x PYTHON_LATEST (ls ~/.asdf/installs/python/ | tail -n1)
    set -x PYTHON_LATEST (ls ~/.asdf/installs/python/)[-1]
    # Add the latest version of Python to the PATH
    set -x PATH $PATH ~/.asdf/installs/python/$PYTHON_LATEST/bin

  else
    # echo asdf is not installed on this system.
  end
end
