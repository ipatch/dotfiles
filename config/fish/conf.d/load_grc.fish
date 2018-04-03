switch (uname)
  case Linux
    if type -q grc
      echo 'we have grc'
      source /usr/local/etc/grc.fish
    else
      echo 'where the hell is grc'
    end
  case Darwin
    if type -q grc
      source /usr/local/etc/grc.fish
    end
end
