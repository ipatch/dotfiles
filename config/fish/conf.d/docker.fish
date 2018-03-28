if type -q docker-machine
  and docker-machine ls | string match -r -q -- '^default '
  # eval (docker-machine env default) # <= avoid `eval` too much overhead!
  docker-machine env default | source - # `source -` will source the current file
end
