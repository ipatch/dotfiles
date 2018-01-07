function toggle_homebrew_ruby --description 'toggle homebrew ruby@2.3'
  switch (uname)
    case Darwin
      if set -l index (contains -i /usr/local/opt/ruby@2.3/bin $PATH)
        set --erase fish_user_paths[$index]
        echo removed homebrew ruby@2.3 form \$fish_user_paths
      else
        set -gx fish_user_paths "/usr/local/opt/ruby@2.3/bin"
        echo "added /usr/local/opt/ruby@2.3/bin to the \$fish_user_paths"
      end
      # for i in /usr/local/opt/ruby@2.3/bin
      #   if not contains $i $fish_user_paths
      #     set -U fish_user_paths $fish_user_paths $i
      #     echo "added /usr/local/opt/ruby@2.3/bin to \$fish_user_paths"
      #   else
      #     set -e fish_user_paths\[i\]
      #     echo "removed /usr/local/opt/ruby@2.3/bin from \$fish_user_paths"
      #   end
      # end
      # if set -l index (contains -i /usr/local/opt/ruby@2.3/bin:$fish_user_paths)
      #   set -e fish_user_paths[$index]
      #   echo removed homebrew ruby@2.3.x form fish_user_paths
      # else
      #   set -gx fish_user_paths /usr/local/opt/ruby@2.3/bin
      #   echo /usr/local/opt/ruby@2.3/bin added to fish_user_paths
      # end

      # if set -l index (contains)
    case Linux
      if set -l index (contains -i /home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH)
        # export PATH="/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH"
        set -e PATH[$index]
        echo removed homebrew python from PATH
      else
        set -x PATH $PATH /home/linuxbrew/.linuxbrew/opt/python/libexec/bin
        echo added /home/linuxbrew/.linuxbrew/opt/python/libexec/bin to PATH
      end
  end
end

###
# NOTES
###
# By default, binaries installed by gem will be placed into:
#   /usr/local/lib/ruby/gems/2.3.0/bin
#
# You may want to add this to your PATH.
#
# This formula is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.
#
# If you need to have this software first in your PATH run:
#   echo 'set -g fish_user_paths "/usr/local/opt/ruby@2.3/bin" $fish_user_paths' >> ~/.config/fish/config.fish
#
# For compilers to find this software you may need to set:
#     LDFLAGS:  -L/usr/local/opt/ruby@2.3/lib
#     CPPFLAGS: -I/usr/local/opt/ruby@2.3/include
# For pkg-config to find this software you may need to set:
#     PKG_CONFIG_PATH: /usr/local/opt/ruby@2.3/lib/pkgconfig
#
# ==> Summary
# 🍺  /usr/local/Cellar/ruby@2.3/2.3.6_1: 3,121 files, 19.9MB

###
# MORE NOTES - straight from the `contains` man page
###
# Example
#       for i in ~/bin /usr/local/bin
#           if not contains $i $PATH
#               set PATH $PATH $i
#           end
#       end
