#!/bin/sh

# the thunderbolt kernel module for kernel 5.10.x is locking my mbp upon waking from sleep
case $1/$2 in
	pre/*)
		echo "Going to $2....."
		rmmod thunderbolt
		;;
	post/*)
		echo "Waking from $2...."
		# referencing `5.10.31-1-lts` will break, use more robust reference LONGTERM
		insmod /lib/modules/`uname -r`/kernel/drivers/thunderbolt/thunderbolt.ko.xz
		;;

esac
