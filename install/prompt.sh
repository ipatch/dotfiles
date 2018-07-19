#!/bin/sh
set -e

# echo "Is this a good question (y/n)? "
# old_stty_cfg=$(stty -g)
# stty raw -echo; answer=$(head -c 1) ; stty "$old_stty_cfg"
# if echo "$answer" | grep -iq "^y"; then
#   echo Yes
# else
#   echo No
# fi

# echo "Is this a good question (y/n)? "
# old_stty_cfg=$(stty -g)
# stty raw -echo
# answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
# stty "$old_stty_cfg"
# if echo "$answer" | grep -iq "^y" ;then
#     echo Yes
# else
#     echo No
# fi

# [[ -t 0 ]] &&
# read -n 1 -p $'\e[1;32m
# Do xxxx? (Y/n)\e[0m ' do_xxxx
# if [[ $do_xxxx =~ ^(y|Y|)$ ]]
# then
#   xxxx
# fi

# while true; do
#   read -rp "Ask question" yn
#   case $yn in 
#     [Yn]* ) okay; break;;
#     [Nn]* ) exit;;
#     * ) echo "Yes or No.";;
#   esac
# done

echo Would you like to proceed? "(Y or N)"

#read x

##now check if $x is "y"
#if [ "$x" = "y" ]; then
#  echo "yup"
#else
#  echo "nope"
#fi

# read -r input

# case $input in
#   "Y") echo "yay"
#   ;;
#   "N") echo "nay"
#   ;;
# esac

# exit

echo "Prompting for yes or no"
read yesno < /dev/tty

if [ "$yesno" = "xy" ]; then
  echo "yup"
else
  echo "nay"
fi
