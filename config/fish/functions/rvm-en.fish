# NOTE: this requires `bass` to be installed
function rvm-en --description 'enable rvm if rvm & bass are found'

  if [ -e "$HOME/.rvm/scripts/rvm" ] #&& [ -x bass ]
    bass source $HOME/.rvm/scripts/rvm
  end
end


# function rvm_toggle --description 'toggle rvm if found'

#   set -l ruby_ver (command -s ruby)
#   # switch ($ruby_ver)
#   if string match -q -- "*.rvm*" $ruby_ver and test -d $HOME/.rvm
#     echo "Now switch back to system ruby"
#     rvm use system
#   else if string match -q --invert "*.rvm*" $ruby_ver and test -d $HOME/.rvm
#     rvm default
#   else
#     echo "rvm not found in \$PATH"
#   end
# end


