#!/usr/bin/env bash
# Save and restore the state of tmux sessions and windows.
# TODO: persist and restore the state & position of panes.
# Straight up boosted from https://github.com/mislav/dotfiles
# TODO: persist and restore more than one tmux session


set -e

dump() {
  local d=$'\t'
  # NOTE: `'\t' has to deal with "tabs", ie. puts a `tab` between printed output
  # NOTE: `-a` lists all windows on a tmux server
  tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}"

}

dump_truck() {

  # tmux >= 1.7 required
  local d=$'\t'
  tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}"
  tmux display-message -p "#{window_layout}"

  # tmux < 1.7
  # Save the dimensions of tmux, ie. windows and panes layout and size 
  # local dt=$'\t'
  # tmux list-windows -a | sed -e 's/^.*\[layout \(\S*\)].*$/\1/'

}

save() {
  # dump > ~/.tmux-session
  dump_truck > ~/.tmux-session
}

terminal_size() {
  stty size 2>/dev/null | awk '{ printf "-x%d -y%d", $2, $1 }'
}

session_exists() {
  tmux has-session -t "$1" 2>/dev/null
  # `-t` selects the "target-window"
}

add_window() {
  tmux new-window -d -t "$1:" -n "$2" -c "$3"
}

add_layout() {
  tmux select-layout -t "$1" 2>/dev/null
}

new_session() {
  cd "$3" &&
  tmux new-session -d -s "$1" -n "$2" $4
}

restore() {
  tmux start-server
  local count=0
  local dimensions="$(terminal_size)"
  # local layout="$(dump_truck)"

  # NOTE: `IFS` refers to "internal field separator"
  while IFS=$'\t' read session_name window_name dir; do
    if [[ -d "$dir" && $window_name != "log" && $window_name != "man" ]]; then
      if session_exists "$session_name"; then
        add_window "$session_name" "$window_name" "$dir"
        # add_layout "$pane_layout" 
      else
        new_session "$session_name" "$window_name" "$dir" "$dimensions"
        count=$(( count + 1 ))
      fi
    fi
  done < ~/.tmux-session

  echo "restored $count sessions"
}

case "$1" in
save | restore )
  $1
  ;;
* )
  echo "valid commands: save, restore" >&2
  exit 1
esac

