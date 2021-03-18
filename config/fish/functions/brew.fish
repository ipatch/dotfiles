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
      set_color -d red; echo "`brew cask outdated --greedy obsolete`"; set_color normal
      printf "use "; set_color -o green; echo "brew outdated --greedy"; set_color normal
      command brew outdated --greedy
      
      set_color -d; printf '\n%s' 'use '; set_color -o green; echo "brew outdated --greedy"; set_color normal
    case "*"
      command brew $argv
  end #switch

end #function
