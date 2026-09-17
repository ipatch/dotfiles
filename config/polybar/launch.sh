#!/usr/bin/env bash

# Single-instance guard: a concurrent invocation (double-tap of the
# keybinding, i3 reload racing a manual launch) exits instead of queueing.
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/polybar-launch.lock"
flock -n 9 || exit 0

# Terminate already running bar instances using ipc
polybar-msg cmd quit >/dev/null 2>&1 || true
# Otherwise you can use the nuclear option:
# killall -q polybar
# killall -q -s SIGKILL polybar

# Wait until the processes have been shut down (bounded, ~5s)
for _ in $(seq 20); do
  pgrep -u "$UID" -x polybar >/dev/null || break
  sleep 0.25
done

# Nuclear option, if any survived the wait above
pgrep -u "$UID" -x polybar >/dev/null && killall -q -s SIGKILL polybar

# sweep sockets left behind by dead instances
# Must run AFTER the kill so the PIDs checked below are genuinely dead.
for f in /tmp/polybar_mqueue.*; do
  [[ -e $f ]] || continue
  pid=${f##*.}
  kill -0 "$pid" 2>/dev/null || rm -f "$f"
done

for f in "$XDG_RUNTIME_DIR"/polybar/ipc.*.sock; do
  [[ -e $f ]] || continue
  pid=${f#*ipc.}; pid=${pid%.sock}
  kill -0 "$pid" 2>/dev/null || rm -f "$f"
done

# Kill old spotify listener script if running
pkill -f "spotify-listener.sh" || true

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# 9>&- closes the lock fd so the bar doesn't inherit it and hold the lock
# for its entire lifetime, which would make every later launch exit at flock.
polybar mypolybar >/tmp/polybar.log 2>&1 9>&- &
bar_pid=$!
disown

# Wait for the IPC socket before starting anything that talks to it
for _ in $(seq 40); do
  [[ -S "$XDG_RUNTIME_DIR/polybar/ipc.$bar_pid.sock" ]] && break
  sleep 0.1
done

# Launch spotify listener
~/.config/polybar/spotify-listener.sh >/dev/null 2>&1 9>&- & disown

echo "Polybar launched..."
