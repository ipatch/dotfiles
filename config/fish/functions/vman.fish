function vman --description 'use vim / nvim to read man pages'

  # col `-b` flag = don't output any backspaces
  # col `-p` flag = force uknown control sequences
  # ===
  # iconv `-c` flag = characters that can't be converter are
  # ...silently discarded
  # ===
  # nvim `-c` flag = run argument / command after executing nvim
  # nvim `-R` flag = open "file" in read-only mode
  # ===
  man $argv | col -bp | iconv -c | nvim -c 'set ft=man nomod nolist' -;
end
