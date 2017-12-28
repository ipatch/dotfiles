# Load abbreviations.
if test -f $HOME/.config/fish/abbreviations.fish
  source $HOME/.config/fish/abbreviations.fish
end

if test -f $HOME/.asdf/asdf.fish
  # Get asdf package manager working with fish shell.
  source $HOME/.asdf/asdf.fish
end
