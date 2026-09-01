#!/bin/sh

# exec /usr/bin/dbus-launch --exit-with-session /usr/bin/startxfce4

case "$XRDP_ALTERNATE_SHELL" in
  fluxbox) WM=startfluxbox ;;
  xfce|xfce4) WM=startxfce4 ;;
  *) WM=startfluxbox ;;
esac

xsetroot -solid '#1c1c1c'
[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"

exec dbus-run-session -- "$WM"
