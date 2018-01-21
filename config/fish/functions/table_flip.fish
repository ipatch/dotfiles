function table_flip --description 'add (╯°□°）╯︵ ┻━┻ to the system clipboard'
  if type -q pbcopy
    echo -n "(╯°□°）╯︵ ┻━┻" | pbcopy
  else if type -q xsel
    echo -n "(╯°□°）╯︵ ┻━┻" | xsel --clipboard
  end
end
