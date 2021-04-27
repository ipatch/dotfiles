# #ipatch, source&load file if found
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# set monitor resolution within the `$HOME/.xprofile` using xrandr

# #ipatch load my user defined key-bindings
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# setup hot corners using lead
# NOVA, not hotdog, was not starting lead
#[[ -f ~/.config/lead/lead.conf ]] && lead
#lead &
