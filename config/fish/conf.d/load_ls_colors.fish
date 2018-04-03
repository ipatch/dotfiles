switch (uname)
  case Darwin
    # TODO: setup a more fancy color scheme for `ls`
    set -gx CLICOLOR yes
  case Linux
    if not set -q LS_COLORS
      if command -s dircolors >/dev/null
        set -l colorfile
        for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
          if test -f $file
            set colorfile $file
            break
          end
        end
        # Here we rely on the legacy behavior of `dircolors -c` producing output suitable for
        # csh in order to extract just the data we're interested in.
        set -gx LS_COLORS (dircolors -c $colorfile | string split ' ')[3]
      end
    end
end
