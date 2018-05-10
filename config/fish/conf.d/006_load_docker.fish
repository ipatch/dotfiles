switch (uname)
case Darwin
  if type -q docker-machine
  and docker-machine ls | string match -r -q -- '^default-xhyve '
    # eval (docker-machine env default) # <= avoid `eval` too much overhead!

    # perform some check to see if docker is running to avoid the,
    # `Error checking TLS connection: Host is not running`
    # `string match -i` = --ignore-case
    # `string match -r` = Perl-compatible regex
    if docker-machine ls | string match -i -r -q ' running '
      # DO NOTHING
      docker-machine env default-xhyve | source - # setup default env for fish shell.
    else
      docker-machine start default-xhyve
      docker-machine env default-xhyve | source - # `source -` will source the current file
    end
  end
end
