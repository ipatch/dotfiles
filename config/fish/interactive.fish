##############################
# fish shell - interactive.fish
##

if test -d $HOME/.config/fish/interactive -a -z "$fish_interactive_sourced"
  for f in $HOME/.config/fish/interactive/*.fish
    source $f
  # echo "interactive fish files sourced"
  end
else
  # echo "interactive fish files already sourced"
end
