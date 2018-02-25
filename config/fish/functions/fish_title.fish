function fish_title
  if [ $_ = 'fish' ]
    echo (prompt_pwd) $COLUMNS x $LINES
  else
    echo $_
  end
end
