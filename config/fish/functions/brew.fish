function brew --description "catch common misspelling & add some goodies"
  # REF: https://stackoverflow.com/a/60607145/708807
  # thank you @faho
  switch "$argv[1]"
    case tap.ls
      echo "list formula of a tap";
      echo "================================="
      # echo "$argv[2]" # DEBUG
      if type -q jq
        command brew tap-info "$argv[2]" --json | jq -r '.[]|(.formula_names[],.cask_tokens[])'
      else
        echo "`jq` is required, install it with `brew install jq`"
        return
      end
      return;
  end

  switch "$argv[3]"

    case cask outdated --greddy
      echo "greedy NOT greddy";
      echo "================================="
      command brew cask outdated --greedy
    case "*"
      command brew $argv
  end #switch

end #function
