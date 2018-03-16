#!/usr/bin/env sh
#############################
#
# A tmux session for working with dotfiles
#

# check if session has been created
tmux has-session -t dots
if [ $? !=0 ]
then
  # init a new tmux session and name it `dot` and name the initial window `editor`
  tmux new-session -s dots -n editor -d

  # change to dotfiles directory
  tmux send-keys -t dots 'nvim' C-m

  # split window
  tmux split-window -v -t dots

  # create a new tmux console window
  tmux new-window -n console -t dots

  # `cwd` to `$dotfiles`
  tmux send-keys -t dots:2 'cd $dotfiles'C-m

  # make `editor` the active window
  tmux select-window -t dots:1
fi
# attach to this newly built tmux session
tmux attach -t dots


