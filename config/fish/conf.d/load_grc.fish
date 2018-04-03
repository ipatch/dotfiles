switch (uname)
  case Linux
    if test -e /home/linuxbrew/.linuxbrew/bin/grc
      # echo 'we have grc'
      source /home/linuxbrew/.linuxbrew/etc/grc.fish
    else
      echo 'where the hell is grc'
    end
  case Darwin
    if type -q grc
      source /usr/local/etc/grc.fish
    end
end
