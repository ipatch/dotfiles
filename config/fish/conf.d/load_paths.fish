##############################
# ~ load_paths.fish ~
##

##############################
# Global PATH
##
if not contains $HOME/.cargo/bin $PATH; and test -d $HOME/.cargo/bin 
  # Add rust-lang local bin directory to PATH for working with cargo.
  set PATH $HOME/.cargo/bin $PATH
end

switch (uname)
  case Darwin
    #########################
    # Setup OS specific PATH variable for macOS
    # NOTE: added /usr/local/sbin above of /sbin in `/etc/paths`
    #
    #########################
    # Add below path to get react-native CLI working.
    ##
    if not contains $HOME/Library/Android/sdk/platform-tools $PATH
    and test -d $HOME/Library/Android/sdk/platform-tools
      set PATH $HOME/Library/Android/sdk/platform-tools $PATH # will prepend (begin) to `$PATH`
    end 
    if type -q brew # `-q` suppresses all output
      if not contains /usr/local/opt/ncurses/bin $PATH
      and test -d /usr/local/opt/ncurses
        set PATH /usr/local/opt/ncurses/bin $PATH
      end
      # prepend gnu-sed to beginning of PATH, so macOS `sed` won't be used.
      if not contains /usr/local/opt/gnu-sed/libexec/gnubin $PATH
      and test -d /usr/local/opt/gnu-sed
       set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
      end
      if not contains /usr/local/opt/libressl/bin $PATH
      and test -d /usr/local/opt/libressl
       set PATH /usr/local/opt/libressl/bin $PATH
      end
      if not contains /usr/local/opt/python/libexec/bin $PATH
      and test -d /usr/local/opt/python
       set PATH /usr/local/opt/python/libexec/bin $PATH
      end
    end

    if not contains $HOME/.config/yarn/global/node_modules/.bin $PATH
    and test -d $HOME/.config/yarn/global/node_modules/.bin
      set PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
    end
    if not contains $HOME/bin $PATH
    and test -d $HOME/bin
      set PATH $PATH $HOME/bin 
    end
    if not contains $HOME/.local/bin $PATH
    and test -d $HOME/.local/bin
      set PATH $PATH $HOME/.local/bin
    end
    if not contains $HOME/bin/base16-shell $PATH
    and test -d $HOME/bin/base16-shell
      set PATH $PATH $HOME/bin/base16-shell
    end
    if not contains $HOME/anaconda2/bin $PATH
    and test -d $HOME/anaconda2/bin
      set PATH $PATH $HOME/anaconda2/bin # will append (end) to `$PATH`
    end
  # END - macOS case
  
  case Linux
  ###############################
  # PATH 💩
  ##
  if not contains /usr/local/sbin $PATH
  and test -d /usr/local/sbin
    set PATH /usr/local/sbin $PATH
  end
  if not contains /usr/sbin $PATH
  and test -d /usr/sbin
    set PATH /usr/sbin $PATH
  end
  if not contains /sbin $PATH
  and test -d /sbin
    set PATH /sbin $PATH
  end
  if not contains /home/linuxbrew/.linuxbrew/bin $PATH
  and test -d /home/linuxbrew/.linuxbrew/bin
      set PATH /home/linuxbrew/.linuxbrew/{bin,sbin} $PATH # put at top of `PATH`
  end
  if not contains /home/linuxbrew/.linuxbrew/opt/python/libexec/bin $PATH
  and test -d /home/linuxbrew/.linuxbrew/opt/python/libexec/bin
    set PATH /home/linuxbrew/.linuxbrew/opt/python/libexec/bin $PATH
  end
end
