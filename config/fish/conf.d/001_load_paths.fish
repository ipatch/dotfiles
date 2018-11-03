##############################
# ~ 001_load_paths.fish ~
##

##############################
# Global PATH
##
# SEE: `jobs/macOS/etc/profile` within this repo for a list of default paths for macOS, ie. paths defined for every user on the system.

#############################
# OS check
##
# NOTE: be sure to symlink `/bin/uname` to `/usr/bin/uname` on Debian
# NOTE: macOS = `Darwin` GNU/Linux = `Linux`
set -gx os (/usr/bin/uname)  
# echo $os <= useful for debugging
set -gx XDG_CONFIG_HOME $HOME/.config

if [ "$os" = Darwin ]; and [ -n /usr/local/bin/brew ]
    set -gx brew_prefix /usr/local
else if [ "$os" = Linux ]; and [ -n /home/linuxbrew/.linuxbrew/bin/brew ]
  set -gx brew_prefix /home/linuxbrew/.linuxbrew
end

set -l paths \
/bin \
/sbin \
/usr/bin \
/usr/sbin \
/usr/games \
/usr/libexec \
/usr/local/bin \
/usr/local/sbin \
$HOME/.cargo/bin \
$HOME/go/bin \
$HOME/Library/Android/sdk/platform-tools \
/opt/Code/github/PUBLIC/chromium/depot_tools \
/opt/X11/bin \
$brew_prefix/bin \
$brew_prefix/sbin \
$brew_prefix/opt/ccache/libexec \
$brew_prefix/opt/llvm/bin \
$brew_prefix/opt/libressl/bin \
$brew_prefix/opt/python/libexec/bin \
$brew_prefix/opt/go/libexec/bin \
$brew_prefix/opt/coreutils/libexec/bin \
$HOME/.local/bin \
$HOME/.pyenv/bin \
$HOME/.config/yarn/bin \
/Applications/microchip/xc16/v1.35/bin \
# The below PATH entries are inherited from the `/usr/bin/env` on macOS, Linux is another story
# /usr/sbin \
# /usr/bin \
# /sbin \
# /bin \

for p in $paths
  if not contains $p $PATH; and test -d $p
    # append PATH entries, ie. top entry appears first in PATH
    # set -gx PATH $PATH $p

    # prepend PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
    # NOTE: the path entry order can be tested w/ `pp` abbr in fish
    set -gx PATH $p $PATH
  end
end
