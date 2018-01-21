function shrug --description 'add ¯\_(ツ)_/¯ to the system clipboard'
  if type -q pbcopy
    echo -n "¯\_(ツ)_/¯" | pbcopy
  end
  else if type -q xclip
    echo -n "¯\_(ツ)_/¯" | pbcopy
  end
end
