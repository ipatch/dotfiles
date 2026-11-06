#!/usr/bin/env bash
if [ "$1" = tunnel ]; then
  remote_cmd='"$HOME"/homebrew/bin/socat ABSTRACT-LISTEN:/tmp/custom_dbus_name,fork TCP:localhost:7272';

  ssh_args=(
    -t
    -o ExitOnForwardFailure=yes
    -o ConnectTimeout=5
    -R localhost:7272:localhost:7272
    m1linux.local
  )

  until ssh "${ssh_args[@]}" "$remote_cmd"; do
    sleep 5
  done
  exit
fi

S=freecad
W=socat

if ! tmux has-session -t "$S" 2>/dev/null; then
  tmux new-session -d -s "$S" -n "$W"
elif ! tmux list-windows -t "$S" -F '#W' | grep -qx "$W"; then
  tmux new-window -d -t "$S" -n "$W"
fi

# make sure there are two panes (resurrect normally restores both)
if [ "$(tmux display -p -t "$S:$W" '#{window_panes}')" -lt 2 ]; then
  tmux split-window -d -v -t "$S:$W"
fi

tmux send-keys -t "$S:$W.{top}" \
  'socat TCP-LISTEN:7272,reuseaddr,fork UNIX-CONNECT:$XDG_RUNTIME_DIR/bus' C-m

tmux send-keys -t "$S:$W.{bottom}" "$0 tunnel" C-m
