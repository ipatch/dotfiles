if type -q docker-machine
  # eval (docker-machine env default) # <= avoid `eval` too much overhead!
  docker-machine env default | source -
end
