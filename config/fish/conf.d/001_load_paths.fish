##############################
# ~ 001_load_paths.fish ~
##

##############################
# Global PATH
##
# SEE: `jobs/macOS/etc/profile` within this repo for a list of default paths for macOS, ie. paths defined for every user on the system.
##
# NOTE: to update order, or remove old crusty path entries from the $PATH env var
# `set -e PATH`, then reload shell
##

#############################
# OS check
##
# NOTE: be sure to symlink `/bin/uname` to `/usr/bin/uname` on Debian
# NOTE: macOS == `Darwin` GNU/Linux == `Linux`
set -gx os (/usr/bin/uname)  
# DEBUG
# echo $os
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

if [ "$os" = Darwin ]; and [ -n /usr/local/bin/brew ]
    set -gx brew_prefix /usr/local
else if [ "$os" = Linux ]; and [ -n /home/linuxbrew/.linuxbrew/bin/brew ]
  set -gx brew_prefix /home/linuxbrew/.linuxbrew
end

# NOTE: reverse order, ie. `/bin` should be last entry within `$PATH`
set -l paths \
/bin \
/sbin \
/usr/bin \
/usr/sbin \
/usr/games \
/usr/libexec \
/opt/beta/bin \
/usr/local/bin \
/usr/local/sbin \
# use GNU coreutils with default names on macOS
# /usr/local/opt/coreutils/libexec/gnubin \
# NOTE: the below entry is not required on macOS because X11.app adds `40-XQuartz` file within `/etc/paths.d`
# /opt/X11/bin \ 
$brew_prefix/bin \
$brew_prefix/sbin \
$brew_prefix/opt/python/libexec/bin \
$brew_prefix/opt/libressl/bin \
$brew_prefix/opt/go/libexec/bin \
$brew_prefix/opt/coreutils/libexec/bin \
$brew_prefix/opt/postgresql@10/bin \
$HOME/miniconda3/bin \
$HOME/go/bin \
$HOME/.cargo/bin \
$HOME/Library/Android/sdk/platform-tools \
# $HOME/.rvm/bin \
/Applications/microchip/xc16/v1.35/bin \
$HOME/.config/yarn/bin \
$HOME/.local/bin \

# EXP # NOTE probably not needed, manually load rvm rubies if required
# $HOME/.rvm/bin \

# NOTE: the below entry is causing more issues than solutions
# (pwd)
# The below PATH entries are inherited from the `/usr/bin/env` on macOS, Linux is another story
# /usr/sbin \
# /usr/bin \
# /sbin \
# /bin \

# TODO remove entries from $PATH if their not in the above list
for p in $paths
  if not contains $p $PATH; and test -d $p
    # append PATH entries, ie. top entry appears first in PATH
    # set -gx PATH $PATH $p

    # prepend PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
    # NOTE: the path entry order can be tested w/ the fish shell abbr `ppr` contained within `abbreviations.fish`
    set -gx PATH $p $PATH
  end
end
