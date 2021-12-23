function brew --description "catch common misspelling & add some goodies"
  # NOTE: ipatch, `$bp` is an env var defined when setting up `$PATH`
  if test -f "$bp/bin/brew"
    # REF: https://stackoverflow.com/a/60607145/708807
    # thank you @faho
    switch "$argv[1]"
      case tap.ls
        echo "the $argv[2] tap provides the following formula";
        echo "================================="
        # echo "$argv[2]" # DEBUG
        if type -q jq
          # TODO: split line across multiple lines more gracefully
          command brew tap-info "$argv[2]" --json | jq -r '.[]|(.formula_names[],.cask_tokens[])'
        else
          echo "`jq` is required to output the list of formula provided the tap, install it with `brew install jq`"
          return
        end
      return;
    end

    switch "$argv[2]"
    #   # TODO: could be implemented better, the 2nd arg `--greddy` seems to still issue an error with brew
      case outdated --greddy
      echo "greedy NOT greddy";
      echo "================================="
        command brew outdated --greedy
        return # required, or else orig misspelling will be passed to brew
      set_color -d; printf '\n%s' 'use '; set_color -o green; echo "brew outdated --greedy"; set_color normal
      # case "*"
      #   command brew $argv
      # return;
    end #switch

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

    switch "$argv"
      case "*"
        command brew $argv
    end
   
  else
    echo "brew not found"
  end # if  test /usr/local/bin/brew
end #function
