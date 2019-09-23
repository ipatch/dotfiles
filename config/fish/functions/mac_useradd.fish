function mac_useradd --description 'add a user to macOS via CLI'
  # TODO: fill out function body with proper commands for creating a user.
  # TODO: check for different OSes
  switch (uname)
    case Darwin
      echo "TODO: need flesh out this function."
    case Linux
      echo "`mac_useradd` will only work on macOS"
  end

end

# NOTE: reference
# dscl . -create /Users/joeadmin
# dscl . -create /Users/joeadmin UserShell /bin/bash
# dscl . -create /Users/joeadmin RealName "Joe Admin" 
# dscl . -create /Users/joeadmin UniqueID "510"
# dscl . -create /Users/joeadmin PrimaryGroupID 20
# dscl . -create /Users/joeadmin NFSHomeDirectory /Users/joeadmin
# dscl . -passwd /Users/joeadmin password 

# dscl . -append /Groups/admin GroupMembership joeadmin
