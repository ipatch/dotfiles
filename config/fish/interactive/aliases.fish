###
# A place to store aliases for making things a tad bit quicker.
###
switch $os
  case Darwin
    #DO NOTHING
    alias l="ls -lahF --group-directories-first"
    alias grep="echo 'You should be using `rg` instead ...just saying'"
    alias rg="rg -S"
    if test -d /Applications/Arduino.app
      alias arduino="/Applications/Arduino.app/Contents/MacOS/Arduino"
    end
    # not perfect, but i don't like lynx keybindings or the bottom menu bar
    # alias mdless (pandoc -s -f markdown -t man | $psub) (groff -T utf8 -man $psub) /usr/bin/less
    # alias mdless "$argv | pandoc -s -f markdown -t man | groff -T utf8 -man | /usr/bin/less"
    # moved the above alias to function for the time being.
    alias ffprobe="ffprobe -hide_banner"
    alias ffmpeg="ffmpeg -hide_banner"
    # DEPRECATION: setup mpv socket within the `mpv.conf` file instead
    # alias mpv="mpv --input-ipc-server=/tmp/mpvsocket"
    #
    alias htp="/usr/local/bin/http" # apparently there is a `http` bin within `~/.cargo/bin` as well

    # NO GO!!!, created simple brew fish function to handle misspelling
    # alias brew cask outdated --greddy="brew cask outdated --greddy"
    alias rsync="/usr/local/bin/rsync --exclude-from=$HOME/.config/rsync/rsync-excludes"

  case Linux
    alias ls="ls --color=auto"
    # alias l="ls -lah --color=auto"
    alias l="ls -lahF --group-directories-first"
  case *
    ################
    # preserve the $USER environment when running the sudo command.
    ##
    alias sudo="sudo -E"
end
