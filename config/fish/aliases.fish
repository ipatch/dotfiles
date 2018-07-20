###
# A place to store aliases for making things a tad bit quicker.
###
switch $os
  case Darwin
    #DO NOTHING
  case Linux
    alias ls="ls --color=auto"
    alias l="ls -lah --color=auto"
  case *
    ################
    # preserve the $USER environment when running the sudo command.
    ##
    alias sudo="sudo -E"
end
