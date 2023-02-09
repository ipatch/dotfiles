#!/bin/sh
# shell script to prepend i3status with more stuff

i3status -c /home/capin/.config/i3/i3status.conf | while :
do
	read line
	fan1_speed=$(cat /sys/devices/platform/applesmc.768/fan1_output)
	fan2_speed=$(cat /sys/devices/platform/applesmc.768/fan2_output)
	echo "L$fan1_speed R$fan2_speed $line"|| exit 1

done

