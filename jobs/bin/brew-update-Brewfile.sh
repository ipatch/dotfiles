#!/bin/sh

# NOTE: a bash script updating a list installed homebrew formula on macOS / Linux
# NOTE: thank you 🙏 very much http://launched.zerowidth.com/
# NOTE: called from a launchd service file every Thursday at 11PM

set -e

path_to_brew=$(command -v brew)
if [ -x "$path_to_brew" ]; then
  echo "brew found"
  dots_os="$(/usr/bin/uname)"

  case $dots_os in
    Darwin)
      # setup some env vars for launchd / launchctl
      /bin/launchctl setenv USER "$(whoami)"
      echo "USER env var equals $USER"
      /bin/launchctl setenv HOME "/Users/$USER"
      echo "your on macOS"
      echo "HOME evn var equals $HOME"
      if [ -z ${dots+x} ]; then 
        echo "dots env var has not been set";
        dots="/opt/code/dotfiles";
        echo "set dots env var to '$dots'";
      else
        echo "dots env var has been set to '$dots'";
      fi

      cd $dots/config/brew/macOS/catalina/
      echo "$PATH";
      brew bundle --force dump

      echo "Brewfile updated on '$(date)'"

      # tear down env vars for launchd / launchctl
      /bin/launchctl unsetenv HOME
      /bin/launchctl unsetenv USER
      /bin/launchctl unsetenv PATH
      ;;
    Linux)
      echo "your on Linux"
      if [ -z ${dots+x} ]; then 
        echo "dots env var has not been set";
        dots="/opt/code/dotfiles";
        echo "set dots env var to '$dots'";
      else
        echo "dots env var has been set to '$dots'";
      fi

      cd $dots/config/brew/Debian/stretch
      brew bundle --force dump
      ;;
    *)
      echo "sorry can't help yuh 🤷"
      ;;
  esac
fi


