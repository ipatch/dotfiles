#!/bin/bash

if [ -f "$HOME/.tmux_setup_completed" ]; then
  exit
fi

# Get the absolute path of the script directory
script_dir=$(cd "$(dirname "$0")" && pwd -P)

# Target directory
target_dir="$HOME/.tmux"

# Source directory
source_dir="$script_dir/tmux"

# Print the resolved paths for debugging
echo "Resolved source directory: $source_dir"
echo "Resolved target directory: $target_dir"

# 1. copy tmux dir within dotfiles/terms/tmux to $HOME/.tmux
if [ ! -e "$target_dir" ]; then
  ln -sfn "$source_dir" "$target_dir"
  echo "symlinked link created: $target_dir -> $source_dir"
else
  echo "target directory already exists: $target_dir"
fi

tpm_dir="$target_dir/plugins/tpm"

# 2. check if tpm has already been cloned within the $target_dir
if [ ! -e "$tpm_dir" ]; then
 git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
else
  echo "tpm already exists"
fi

# 3. setup custom terminal info entries for tmux
setup_terminfos() {
  echo "setting up terminal info entries for tmux..."
  if command -v tic >/dev/null 2>&1; then
    # NOTE: ipatch uncomment to debug
    # echo $(pwd)
    if infocmp xterm-256color-italic >/dev/null 2>&1; then
      echo "xterm-256color-italic term info entry found, NO need to install"
    else
      echo "xterm-256color-italic term info entry NOT found, attempting to install terminfo entry"
      tic -x term.infos/xterm-256color-italic.terminfo
      echo "terminfo installed"
    fi
    if infocmp tmux-256color >/dev/null 2>&1; then
      echo "tmux-256color term info entry found, NO need to install"
    else
      # NOTE: os and bp vars defined within config.fish
      if [ $os = "Darwin" ]; then
        echo "you are on macos, ie. "$os" and need to use tic provided by homebrew"
        echo "$bp"
        # enable verbose execution
        set -x
        "$bp/opt/ncurses/bin/tic" -x -v -o ~/.terminfo term.infos/tmux-256color.terminfo
        exit_code=$?
        set +x
        if [ $exit_code -eq 0 ]; then
          echo "✓ tic command executed successfully"
        else
          echo "✗ tic command failed with exit code $exit_code"
        fi
      else
        echo "tmux-256colorterm info entry NOT found, attempting to install terminfo entry"
        tic -x term.infos/tmux-256color.terminfo
      fi
      echo "terminfo installed"
    fi
  else
    echo "tic command not found"
  fi
}

setup_terminfos

# last. create an empty to signify the script has finished
touch "$HOME/.tmux_setup_completed"
