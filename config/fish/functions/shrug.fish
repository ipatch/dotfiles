function shrug --description 'add ¯\_(ツ)_/¯ to the system clipboard'
  if type -q pbcopy
    echo -n "¯\_(ツ)_/¯" | pbcopy
  else if type -q xsel
    echo -n "¯\_(ツ)_/¯" | xsel --clipboard
  end
end
