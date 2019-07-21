function epcheck --description 'return HTTP status code'
  echo "output of `curl -Is $argv | head -n 1`" 
  command curl -Is $argv | head -n 1
end
