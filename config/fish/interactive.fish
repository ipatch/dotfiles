##############################
# fish shell - interactive.fish
##

# NOTE: abbr(s) and aliases set within the interactive fish files require reinitializing fish or else they will not persist when running `exec fish`
if test -d $HOME/.config/fish/interactive
  for f in $HOME/.config/fish/interactive/*.fish
    source $f
  end

  source $HOME/.asdf/asdf.fish

  # set created & updated files & directories to 664 & 775
  umask 002
end
