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

# TODO: add commands for setting up custom term entries in term database for tmux

# last. create an empty to signify the script has finished
touch "$HOME/.tmux_setup_completed"
