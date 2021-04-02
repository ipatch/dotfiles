# text to be inserted at EOF /etc/bash.bashrc
# ..because I've edited this freaking file too many times


# load user specific BASH configuration files
if [ -f "$HOME/.bash_profile" ]; then
  # SC1090
  . "$HOME/.bash_profile"
fi
