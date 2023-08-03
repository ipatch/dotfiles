#!/usr/bin/env sh

# Terminate already running bar instances
killall -q -s SIGKILL polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# NOTE: ipatch, requires a bar named `mybar`
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
