function brew --description "catch common misspelling"
  switch "$argv[1]"

  # TODO: come up with sane way to check for misspelling of `brew cask outdated --greddy`

  #   case cask outdated --greddy
  #     # command brew cask outdated --greedy
  #     # if contains -- "cask outdated --greddy" $argv
  #     # command "brew cask outdated --greedy"
  #     echo "greddy NOT greddy";
  #     set correct_cmd (/usr/local/bin/brew cask outdated --greedy)
  #     command "$correct_cmd"

  #   case $argv
  #     # command $argv
  #     echo "blah"

    case "*"
      command brew $argv
    end
  end
