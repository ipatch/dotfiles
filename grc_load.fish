switch (uname)
  case Darwin
    #DO NOTHING
  case Linux
    if type -q grc
      source /home/linuxbrew/.linuxbrew/etc/grc.fish
    end
end
