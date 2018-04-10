# Useful Link: https://geoff.greer.fm/lscolors/

switch (uname)
  case Darwin
    # TODO: setup a more fancy color scheme for `ls`
    set -gx CLICOLOR yes
  case Linux
    # DO NOTHING
    # *nix manages `ls` colors via `$HOME/.dir_colors`
end
