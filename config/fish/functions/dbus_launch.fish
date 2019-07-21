function dbus_launch --description 'start dbus daemon'
  #!/usr/bin/env bash
  ## test for an existing bus daemon, just to be safe
  # if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  #     ## if not found, launch a new one
  #     eval `dbus-launch --sh-syntax --exit-with-session`
  #     echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
  # fi
  echo "dbus is automagically started with systemd"
end
# https://linux.die.net/man/1/dbus-launch

# if test -z "$DBUS_SESSION_BUS_ADDRESS"
#   # if $DBUS_... string returns zero
#   eval 'dbus-launch --auto-syntax --exit-with-session'
#   echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
# else
#   echo "\$DBUS... already set, and is: \n $DBUS_SESSION_BUS_ADDRESS"
# end


###
# Useful snippet for working with BASH syntax env vars
# in fish shell
###
# for line in (dbus-launch | string match '*=*')
#     set -l kv (string split -m 1 = -- $line )
#     set -gx $kv[1] (string trim -c '\'"' -- $kv[2])
# end
