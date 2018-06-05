# Useful Link: https://geoff.greer.fm/lscolors/

switch (uname)
  case Darwin
    # TODO: setup a more fancy color scheme for `ls`
    set -gx CLICOLOR 1
  case Linux
    # DO NOTHING
    # GNU/Linux manages `ls` colors via `dircolors` provided by Core Utilites `$HOME/.dir_colors`
end
