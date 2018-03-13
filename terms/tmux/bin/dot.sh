#############################
#
# A tmux session for working with dotfiles
#

# init a new tmux session and name it `dot` and name the initial window `editor`
tmux new-session -s dot -n editor -d

# change to dotfiles directory
tmux send-keys -t dot 'nvim' C-m

# split window
tmux split-window -v -t dot

# create a new tmux console window
tmux new-window -n console -t dot

# `cwd` to `$dotfiles`
tmux send-keys -t dot:2 'cd $dotfiles'C-m

# make `editor` the active window
tmux select-window -t dot:1

# attach to this newly built tmux session
tmux attach -t dot


