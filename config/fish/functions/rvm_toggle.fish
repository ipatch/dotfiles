function rvm_toggle --description 'toggle rvm if found'
  set ruby_ver eval (which ruby)
  # switch ($ruby_ver)
  if string match -q -- "*.rvm*" $ruby_ver #and test -d $HOME/.rvm;
      echo "Now switch back to system ruby"
      rvm use system
  else if string match -q --invert "*.rvm*" $ruby_ver #and test -d $HOME/.rvm;
      rvm default
  else
      echo "rvm not found in \$PATH"
  end
end

# set ruby_ver eval (which ruby)
# if string match -q -- "*.rvm*" $ruby_ver
