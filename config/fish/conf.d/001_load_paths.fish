##############################
# ~ 001_load_paths.fish ~
##

##############################
# Global PATH
##
# NOTE: on macOS, `/etc/paths`, `/etc/paths.d`, `/etc/profile` will need to be modified, ie. renamed.

#############################
# check OS
##
# NOTE: be sure to symlink `/bin/uname` to `/usr/bin/uname` on Debian
set -gx os (/usr/bin/uname)  #macOS = `Darwin` GNU/Linux = `Linux`

# echo $os <= use for debugging
set -gx XDG_CONFIG_HOME $HOME/.config

if [ "$os" = Darwin ]; and [ -n /usr/local/bin/brew ]
    set -gx brew_prefix /usr/local
else if [ "$os" = Linux ]; and [ -n /home/linuxbrew/.linuxbrew/bin/brew ]
  set -gx brew_prefix /home/linuxbrew/.linuxbrew
end


set -l paths \
/usr/games \
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
# The below PATH entries are inherited from the `/usr/bin/env`
# /usr/sbin \
# /usr/bin \
# /sbin \
# /bin \

for p in $paths
  if not contains $p $PATH; and test -d $p
    # append above PATH entries, ie. top entry appears first in PATH
    # set -gx PATH $PATH $p

    # prepend above PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
    set -gx PATH $p $PATH
  end
end
 
