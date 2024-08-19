#!/bin/sh 

# NOTE: ipatch, my de setup doesn't use the traditional `~/.xinitrc` instead this script is run via my i3 config

#ref: https://medium.com/@console.log_hello_uranus/customizing-mouse-settings-with-xinput-a87da33800ba

# sleep 10 # Ensures desktop is fully loaded 
#-------
# MOUSE_ID=$(xinput list --name-only | grep '2.4G Mouse') xinput set-button-map "$MOUSE_ID" 3 2 1 xinput set-prop "$MOUSE_ID" "libinput Accel Speed" 0.5
#-------

mouse_id=$(xinput list --name-only | grep 'bcm5974')

# disable natural scrolling
xinput set-prop $mouse_id "libinput Natural Scrolling Enabled" 0
xinput set-prop $mouse_id "libinput Accel Speed" 0.5
