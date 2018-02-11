function hunh --description 'add ಠ_ಠ to the system clipboard'
  if type -q pbcopy
    echo -n "ಠ_ಠ" | pbcopy
  else if type -q xsel
    echo -n "ಠ_ಠ" | xsel --clipboard
  end
end