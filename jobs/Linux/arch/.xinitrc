# NOTE: ipatch, source&load file if found
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# set monitor resolution within the `$HOME/.xprofile` using xrandr

# NOTE: ipatch, load my user defined key-bindings
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# NOTE: ipatch, setup trackpad settings for 2015 macbook pro
[[ -f ~/.config/x11/scripts/mbp-2015-trackpad.sh ]] && ~/.config/x11/scripts/mbp-2015-trackpad.sh

echo "Testing .xinitrc execution" > ~/xinitrc_test.log

# setup hot corners using lead
# NOVA, not hotdog, was not starting lead
# [[ -f ~/.config/lead/lead.conf ]] && lead
#lead &
