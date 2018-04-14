#############################
# fish shell - interactive.fish
##
#
# TODO: repeating the below expression `if test -f $HOME` seems like a code 👃

# Load abbreviations.
if test -f $HOME/.config/fish/abbreviations.fish
  source $HOME/.config/fish/abbreviations.fish
end

if test -f $HOME/.config/fish/aliases.fish
  source $HOME/.config/fish/aliases.fish
end

if test -f $HOME/.asdf/asdf.fish
  # Get asdf package manager working with fish shell.
  source $HOME/.asdf/asdf.fish
end
