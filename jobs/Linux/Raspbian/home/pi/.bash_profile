# ipatch checker for sh script

alias l='ls -lah'

PATH=$HOME/.local/bin:$PATH
alias ..='cd ..'

# echo "~/.bash_profile loaded"

if [ -f ~/.bashrc ]; then
	. $HOME/.bashrc
#	echo "~/.bashrc loaded"
fi
