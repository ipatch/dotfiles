function toggle_hidden_files --description 'toggle hidden files on macOS'
  switch (uname)
    case Darwin
      if test (defaults read com.apple.finder AppleShowAllFiles) = "TRUE"
        defaults write com.apple.finder AppleShowAllFiles FALSE
      else
        defaults write com.apple.finder AppleShowAllFiles TRUE
      end
      killall Finder
    case Linux
      echo 'This command is useless for penguin power 🐧'
    end
end
