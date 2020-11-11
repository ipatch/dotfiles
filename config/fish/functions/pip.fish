function pip --description "catch common misspelling"
  switch "$argv[1]"

  case outdated
    echo "USE pip list --outdated";
    echo "================================="
    command pip list --outdated
  case "*"
    command pip $argv
  end
end
