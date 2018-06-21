##############################
# ~ 001_load_paths.fish ~
##

##############################
# Global PATH
##
# SEE: `config/OS/macOS/10.13/etc/profile` within this repo 

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
$XDG_CONFIG_HOME/.config/yarn/global/node_modules/.bin \
/opt/X11/bin \
$brew_prefix/bin \
$brew_prefix/sbin \
$brew_prefix/opt/llvm/bin \
$brew_prefix/opt/gnu-sed/libexec/gnubin \
$brew_prefix/opt/libressl/bin \
$brew_prefix/opt/python/libexec/bin \
$brew_prefix/opt/coreutils/libexec/gnubin \
$brew_prefix/opt/ncurses/bin \
$HOME/.local/bin \
$HOME/.pyenv/bin \
# The below PATH entries are inherited from the `/usr/bin/env` on macOS, Linux is another story
# /usr/sbin \
# /usr/bin \
# /sbin \
# /bin \

for p in $paths
  if not contains $p $PATH; and test -d $p
    # append above PATH entries, ie. top entry appears first in PATH
    # set -gx PATH $PATH $p

    # prepend above PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
    # NOTE: the path entry order can be tested w/ `pp` abbr in fish
    set -gx PATH $p $PATH
  end
end
 
