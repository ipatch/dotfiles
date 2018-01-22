function dbus_launch --description 'start dbus daemon'
  if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    # if $DBUS_... string returns zero
    eval 'dbus-launch --auto-syntax --exit-with-session'
    echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
  end
end

# https://linux.die.net/man/1/dbus-launch
