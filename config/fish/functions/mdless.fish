function mdless --description "Attempt to read formatted markdown documents in a terminal" --argument-names "filename"
  if test -n "$filename"
    command pandoc -s -f markdown -t man "$filename" | groff -T utf8 -man | /usr/bin/less
  else
    echo "need a filename bro"
    echo "mdless [FILE.md]"
  end
end
