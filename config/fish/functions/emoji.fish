# TODO: figure out a more accurate name for function.
function emoji --description 'little funny expressions'
  for option in $argv
    switch "$option"
      case -h --help
        printf "`emoji` puts various funny expressions in the system clipboard"
      case --hunh
        if type -q pbcopy
          echo -n "ಠ_ಠ" | pbcopy
        else if type -q xsel
          echo -n "ಠ_ಠ" | xsel --clipboard
        end
      case -s --shrug
        if type -q pbcopy
          echo -n "¯\_(ツ)_/¯" | pbcopy
        else if type -q xsel
          echo -n "¯\_(ツ)_/¯" | xsel --clipboard
        end
      case -tf --table-flip
        if type -q pbcopy
          echo -n "(╯°□°）╯︵ ┻━┻" | pbcopy
        else if type -q xsel
          echo -n "(╯°□°）╯︵ ┻━┻" | xsel --clipboard
        end
      case -y --yay
        if type -q pbcopy
          echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | pbcopy
        else if type -q xsel
          echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | xsel --clipboard
        end
      case \*
        printf " --hunh for ಠ_ಠ " \n
        printf " --shrug -s for ¯\_(ツ)_/¯" \n
        printf " --table-flip -tf for (╯°□°）╯︵ ┻━┻"\n
        printf " --yay -y for ✧*｡٩(ˊᗜˋ*)و✧*｡"\n
    end
  end
end
