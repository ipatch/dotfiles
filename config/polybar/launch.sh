#!/usr/bin/env sh

# Terminate already running bar instances
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
# killall -q -s SIGKILL polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# TODO: clear / rotate log when restarting i3 in place
polybar mypolybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
