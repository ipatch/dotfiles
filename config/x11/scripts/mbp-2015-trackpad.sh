#!/bin/sh 

# NOTE: ipatch, my DE setup doesn't use the traditional `~/.xinitrc` instead this script is run via my i3 config
# QUESTION: is it possible to reload this script to update mouse settings without fully restarting X11 server?

# NOTE: the default x11 right on mbp with function keys set to media keys
# `fn+shift+f10`

# NOTE: set 2 finger click as RMB
# xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Click Method Enabled' 0 1

#ref: https://medium.com/@console.log_hello_uranus/customizing-mouse-settings-with-xinput-a87da33800ba

# sleep 10 # Ensures desktop is fully loaded 
#-------
# MOUSE_ID=$(xinput list --name-only | grep '2.4G Mouse') xinput set-button-map "$MOUSE_ID" 3 2 1 xinput set-prop "$MOUSE_ID" "libinput Accel Speed" 0.5
#-------

mouse_id=$(xinput list --name-only | grep 'bcm5974')

# disable natural scrolling
xinput set-prop $mouse_id "libinput Natural Scrolling Enabled" 0
xinput set-prop $mouse_id "libinput Accel Speed" 0.5
# set 2 finger click as RMB
xinput set-prop $mouse_id "libinput Click Method Enabled" 0 1
