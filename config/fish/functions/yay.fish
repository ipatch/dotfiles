function yay --description 'add ✧*｡٩(ˊᗜˋ*)و✧*｡ to the system clipboard'
  if type -q pbcopy
    echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | pbcopy
  else if type -q xsel
    echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | xsel --clipboard
  end
end
