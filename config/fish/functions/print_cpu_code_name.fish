function print_cpu_code_name --description "print the code name for a CPU, ie. Haswell"
  
  # NOTE: `os` is a user defined in `001_load_paths.fish` environment variable  that is globally exported, ie. not required to redefine at a fish function level.
  switch $os
  case Darwin
    if type -q clang
      clang -v -xc /dev/null -O3 -march=native -o- -E 2>&1 | grep -o 'target-cpu \w*'
    else
      echo "This fish function requires clang clang when on macOS"
    end
  case Linux
    if type -q gcc 
      gcc -v -xc /dev/null -O3 -march=native -o- -E 2>&1 | grep -o 'arch=\w*'
    else
      echo "This fish function requires gcc when run on GNU+Linux"
    end
  end
end
