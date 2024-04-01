#!/bin/bash

if [ -f "$HOME/.tmux_setup_completed" ]; then
  exit
fi

# get the directory of the script
script_dir=$(dirname "$(readlink -f "$0")")

# target dir
target_dir="$HOME/.tmux"

# source dir
source_dir="$script_dir/tmux"

# 1. copy tmux dir within dotfiles/terms/tmux to $HOME/.tmux
if [ ! -e "$target_dir" ]; then
  ln -sf "$source_dir" "$target_dir"
  echo "symlinked link created: $target_dir -> $source_dir"
else
  echo "target directory already exists: $target_dir"
fi

# 2. check if tpm has already been cloned within the $target_dir
# above check is unnecessary

# TODO: add commands for setting up custom term entries in term database for tmux

# last. create an empty to signify the script has finished
touch "$HOME/.tmux_setup_completed"
