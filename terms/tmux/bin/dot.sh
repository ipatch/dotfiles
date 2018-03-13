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
