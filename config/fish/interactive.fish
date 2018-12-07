##############################
# fish shell - interactive.fish
##

if test -d $HOME/.config/fish/interactive -a -z "$fish_interactive_sourced"
  source $HOME/.config/fish/interactive/*.fish && set fish_interactive_sourced 1
  # echo "interactive fish files source"
else
  # echo "interactive fish files already sourced"
end
