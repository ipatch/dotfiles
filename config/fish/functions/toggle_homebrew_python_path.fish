function toggle_homebrew_python_path --description 'toggle homebrew python 🐍'
  switch (uname)
    case Darwin
      if set -l index (contains -i /usr/local/opt/python/libexec/bin:$PATH)
        set -e PATH[$index]
        echo removed homebrew python form PATH
      else
        set -x PATH $PATH /usr/local/opt/python/libexec/bin
        echo /usr/local/opt/python/libexec/bin added to PATH
      end
    case Linux
      if set -l index (contains -i /home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH)
        # export PATH="/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH"
        set -e PATH[$index]
        echo removed homebrew python from PATH
      else
        set -x PATH $PATH /home/linuxbrew/.linuxbrew/opt/python/libexec/bin
        echo added to PATH
      end
  end
end

###
# macOS
###

# This formula installs a python2 executable to /usr/local/bin.
# If you wish to have this formula's python executable in your PATH then add
# the following to ~/.config/fish/config.fish:
#   export PATH="/usr/local/opt/python/libexec/bin:$PATH"
#
# Pip and setuptools have been installed. To update them
#   pip2 install --upgrade pip setuptools
#
# You can install Python packages with
#   pip2 install <package>
#
# They will install into the site-package directory
#   /usr/local/lib/python2.7/site-packages
#
# See: https://docs.brew.sh/Homebrew-and-Python.html

###
# Linux
###

# This formula installs a python2 executable to /home/linuxbrew/.linuxbrew/bin.
# If you wish to have this formula's python executable in your PATH then add
# the following to ~/.config/fish/config.fish:
#   export PATH="/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH"
#
# Pip and setuptools have been installed. To update them
#   pip2 install --upgrade pip setuptools
#
# You can install Python packages with
#   pip2 install <package>
#
# They will install into the site-package directory
#   /home/linuxbrew/.linuxbrew/lib/python2.7/site-packages
#
# See: https://docs.brew.sh/Homebrew-and-Python.html
#
# Python modules have been installed and Homebrew's site-packages is not
# in your Python sys.path, so you will not be able to import the modules
# this formula installed. If you plan to develop with these modules,
# please run:
#   mkdir -p /home/capin/.local/lib/python2.7/site-packages
#   echo 'import site; site.addsitedir("/home/linuxbrew/.linuxbrew/lib/python2.7/site-packages")' >> /home/capin/.local/lib/python2.7/site-packages/homebrew.pth
# ==> Summary
# 🍺  /home/linuxbrew/.linuxbrew/Cellar/python/2.7.14: 2,946 files, 71.5MB
