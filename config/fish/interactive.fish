##############################
# fish shell - interactive.fish
##

# NOTE abbr(s) and aliases set within the interactive fish files will need to reset everytime fish is reinitialized or else the will no persist when running `exec fish`
if test -d $HOME/.config/fish/interactive
  for f in $HOME/.config/fish/interactive/*.fish
    source $f
  end
  source $HOME/.asdf/asdf.fish

  # set created & updated files to 664 & 775
  umask 002
end
