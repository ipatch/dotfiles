#!/bin/bash

# NOTE: a simple bash script to update a list of formula installed via homebrew on macOS / Linux
# NOTE: thank you 🙏 very much http://launched.zerowidth.com/
# NOTE: this script should be called via a launchd service file that runs every Thursday at 11PM

set -e

if [ "$(type -a brew)" ]; then
  # echo "brew found"
  dots_os="$(/usr/bin/uname)"

  case $dots_os in
    Darwin)
      echo "your on macOS"
      if [ -z ${dots+x} ]; then 
        echo "dots env var has not been set";
        dots="/opt/Code/dotfiles";
        echo "set dots env var to '$dots'";
      else
        echo "dots env var has been set to '$dots'";
      fi

      cd $dots/config/brew/macOS/10.13/
      brew bundle --force dump
      ;;
    Linux)
      echo "your on Linux"
      if [ -z ${dots+x} ]; then 
        echo "dots env var has not been set";
        dots="/opt/Code/dotfiles";
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
