switch (uname)
  case Linux
    if type -q grc
      source /home/linuxbrew/.linuxbrew/etc/grc.fish
    end
  case Darwin
    # DO NOTHING
end
