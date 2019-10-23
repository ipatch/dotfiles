# text to be inserted at the end of /etc/bash.bashrc
# ..because I've edited this freaking file too many times


# load user specific BASH configuration files
if [ -f "$HOME/.bash_profile" ]; then
  . $HOME/.bash_profile
fi
