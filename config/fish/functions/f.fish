function f --description "quickly search for files using find"
  
  # NOTE: `2> /dev/null` do not print STDERR to STDOUT
  find . -name "*$argv*" 2> /dev/null
end
