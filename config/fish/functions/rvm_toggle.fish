function rvm_toggle --description 'toggle rvm if found'
  set ruby_ver eval (which ruby)
  if string match -q -- "*.rvm*" $ruby_ver
    echo "Now switch back to system ruby"
    rvm use system
  else
    rvm default
  end
end
