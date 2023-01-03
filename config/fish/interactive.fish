#-----------------------------
# fish shell - interactive.fish
#-

# NOTE: abbr(s) & aliases require fish reinit or will not persist, `exec fish`
if test -d $HOME/.config/fish/interactive
  for f in $HOME/.config/fish/interactive/*.fish
    source $f
  end

  # check if file exists, if so, then load it
  if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
  end

  # set created & updated files & directories to 664 & 775
  umask 002
end
