# TODO: figure out a more accurate name for function.
# TODO: print out what exactly is being copied to the clipboard.
# INSPIRATION: https://github.com/dysfunc/ascii-emoji
function emoji --description 'little funny expressions'
  switch "$argv[1]"
    case -h --help help
      printf "`emoji` puts various funny expressions in the system clipboard"\n\n
      printf " --hunh for ಠ_ಠ"\n\n
      printf " --shrug -s for ¯\_(ツ)_/¯"\n\n
      printf " --table-flip -tf for (╯°□°）╯︵ ┻━┻"\n\n
      printf " --trolling for ༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽"\n\n
      printf " --yay -y for ✧*｡٩(ˊᗜˋ*)و✧*｡"\n\n
      return 0
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

    case --trolling
      if type -q pbcopy
        echo -n "༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽" | pbcopy
      else if type -q xsel
        echo -n "༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽" | xsel --clipboard
      end

    case -y --yay
      if type -q pbcopy
        echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | pbcopy
      else if type -q xsel
        echo -n "✧*｡٩(ˊᗜˋ*)و✧*｡" | xsel --clipboard
      end
    case "*"
      printf "Unknown option: '%s'\n" $argv[1]
      printf ""\n
      printf " --hunh for ಠ_ಠ %s"\n\n
      printf " --shrug -s for ¯\_(ツ)_/¯"\n\n
      printf " --table-flip -tf for (╯°□°）╯︵ ┻━┻"\n\n
      printf " --trolling for ༼∵༽ ༼⍨༽ ༼⍢༽ ༼⍤༽"\n\n
      printf " --yay -y for ✧*｡٩(ˊᗜˋ*)و✧*｡"\n\n
      return 1
  end
end
