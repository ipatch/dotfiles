###
# Setup $USER based documentation i.e. man pages
###
function ln_asdf_man_pages --description 'setup asdf man pages'
  # Add man 📚 pages for user installed binaries
  for x in (asdf plugin-list)
    # echo $x/(asdf list $x | tail -n1)
    # set -x ASDF_LATEST_BINS $ASDF_LATEST_BINS (echo $x/(asdf list $x | tail -n1))
    set -x ASDF_LATEST_BINS $ASDF_LATEST_BINS (echo $x/(asdf list $x)[-1])
    # NOTE: to access an individual item of a list
    # echo $PATH[1]
  end

  # MANPATHS
  # 1) elixir = $HOME/.asdf/installs/elixir/1.5.2/man
  # 2) erlang = $HOME/.asdf/installs/erlang/20.0/lib/erlang/man
  # 3) nodejs = $HOME/.asdf/installs/nodejs/8.1.2/share/man
  # 4) python =  $HOME/.asdf/installs/python/3.6.3/share/man
  # 5) ruby = $HOME/.asdf/installs/ruby/2.3.1/share/man
  # 6) rust = $HOME/.asdf/installs/rust/1.22.1/share/man

  # FOR PEACE OF MIND DON'T SET THE MANPATH ENV VAR!!!

  if type -q asdf
    for x in $ASDF_LATEST_BINS
      if string match -qr '^elixir' $x
        ln -sf $HOME/.asdf/installs/$x/man/* /usr/local/share/man/man1/
      end
      if string match -qr '^erlang' $x
        # TODO: setup erlang documentation.

        # set -x MANPATH $MANPATH $HOME/.asdf/installs/$x/lib/erlang/man
        # ln -s $HOME/.asdf/installs/$x/lib/erlang/man/man[1-7] /usr/local/share/man/man
      end
      if string match -qr '^nodejs' $x
        ln -sf $HOME/.asdf/installs/$x/share/man/man1/* /usr/local/share/man/man1/
      end
      if string match -qr '^python' $x
        # no need to link the python man pages because python links man pages
        # when installing python.
      end
      if string match -qr '^ruby' $x
        # don't link ruby man pages because homebrew has local man pages.
      end
      if string match -qr '^rust' $x
        # set -x MANPATH $MANPATH $HOME/.asdf/installs/$x/share/man
        ln -sf $HOME/.asdf/installs/rust/1.22.1/share/man/man1/* /usr/local/share/man/man1/
      end
    end
  end
end
