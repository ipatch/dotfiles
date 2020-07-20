function brew --description "catch common misspelling"
  switch "$argv[3]"

  case cask outdated --greddy
    # NOVA / NO GO, if contains -- "cask outdated --greddy" $argv
    # NOVA / NO GO, command "brew cask outdated --greedy"
    # NOVA / NO GO, set correct_cmd (/usr/local/bin/brew cask outdated --greedy)
    # NOVA / NO GO,command "$correct_cmd"
    echo "greddy NOT greddy";
    echo "================================="
    command brew cask outdated --greedy

  case "*"
    command brew $argv
  end
end
