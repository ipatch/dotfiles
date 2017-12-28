# CREDIT: 💳 https://apple.stackexchange.com/a/29877/43460
function lsusers --description 'list users on macOS with a uid begining wth `5`'
  switch (uname)
    case Darwin
      dscacheutil -q user | grep -A 3 -B 2 -e uid:\ 5'[0-9][0-9]'
    case Linux
      echo "`lsusers` will only work on macOS"
  end
end
