function table_flip --description 'add (╯°□°）╯︵ ┻━┻ to the system clipboard'
  if type -q pbcopy
    echo -n "(╯°□°）╯︵ ┻━┻" | pbcopy
  else if type -q xclip
    echo -n "(╯°□°）╯︵ ┻━┻" | xclip
  end
end
