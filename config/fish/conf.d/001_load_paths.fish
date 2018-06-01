##############################
# ~ 001_load_paths.fish ~
##

##############################
# Global PATH
##
# TODO: figure out a proper way to use `$XDG_CONFIG_HOME`

set -l paths \
/usr/local/opt/ncurses/bin \
/usr/local/opt/python/libexec/bin \
/usr/local/opt/libressl/bin \
/usr/local/opt/gnu-sed/libexec/gnubin \
$XDG_CONFIG_HOME/.config/yarn/global/node_modules/.bin \
$HOME/Library/Android/sdk/platform-tools \
$HOME/.cargo/bin \
$HOME/go/bin \
$HOME/.local/bin \
$HOME/bin \
$HOME/.pyenv/bin \
$HOME/bin/base16-shell \
/usr/local/bin \
/usr/local/sbin \
/home/linuxbrew/.linuxbrew/bin \
/home/linuxbrew/.linuxbrew/sbin \
/home/linuxbrew/.linuxbrew/opt/libressl/bin \
/usr/bin \
/bin \
/sbin \
/usr/games \
/usr/sbin \
/usr/local/opt/llvm/bin 

for p in $paths
  if not contains $p $PATH; and test -d $p
    set -x PATH $p $PATH
  end
end
 
