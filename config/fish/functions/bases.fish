function bases --description 'convert between hex binary & decimal'
  switch "$argv[1 ]"
    case -h --help help
      return 0

    case -h2d
      echo "ibase=16; $argv"|bc

    case -d2h

    case -d2b

    case -b2d
    
    case "*"
      printf "Unknown option: '%s'\n" $argv[1]
      return 1
  end
end


# Convert hex to decimal, decimal 2 binary, binary 2 decimal 
#h2d(){ echo "ibase=16; $@"|bc } 
# d2h(){ echo "obase=16; $@"|bc } 
# d2b(){ echo "obase=2; $@"|bc } 
# b2d(){ echo "ibase=2; $@"|bc }
