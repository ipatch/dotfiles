function toggle_homebrew_python_path --description 'toggle homebrew python 🐍'
  if set -l index (contains -i /usr/local/opt/python/libexec/bin:$PATH)
    set -e PATH[$index]
    echo removed homebrew python form PATH
  else
    set -x PATH $PATH /usr/local/opt/python/libexec/bin
    echo /usr/local/opt/python/libexec/bin added to PATH
  end
end

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
