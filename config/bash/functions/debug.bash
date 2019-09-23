#!/usr/bin/env bash

# Usuage: DEBUG=true ./mr-buggy-bash-script.sh

function debug {
	if [ "$DEBUG" = "true" ] ; then
		if [ "$1" = "on" ] || [ "$1" = "ON" ] ; then
			set -x
		else
			set +x
		fi
	fi
}
