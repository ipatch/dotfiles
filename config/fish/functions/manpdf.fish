function manpdf --description "view man pages in Preview.app"

  man -t "$argv[1]" | open -f -a /Applications/Preview.app

end

# CREDIT: https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789
