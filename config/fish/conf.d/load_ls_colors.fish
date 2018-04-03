switch (uname)
  case Darwin
    # TODO: setup a more fancy color scheme for `ls`
    set -gx CLICOLOR yes
  case Linux
    set -gx LS_COLORS yes
end
