switch (uname)
  case Linux
    if type -q grc
      source /usr/local/etc/grc.fish
    end
  case Darwin
    if type -q grc
      source /usr/local/etc/grc.fish
    end
end
