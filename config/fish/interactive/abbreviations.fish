##############################
# A place to store abbreviations for making things a tad bit quicker.
# NOTE: abbr's will default to universal scope, ie. conditional logic will not "work" for different systems, ie. macOS and Linux, thus use the `-g` flag with `abbr` to make global scope which will NOT be universal thus making conditional logic work.
###
# NOTE: when adding new `abbr`'s to this file, fish will need to reload the file, ie. `exec fish` for every fish shell instance to pick up on the newly added `abbr`'s.
##

##############################
# Added the below abbreviations because I'm really tired of typing out the below commands.
##
abbr -ag editfish 'nvim $HOME/.config/fish/config.fish'
abbr -ag editnvim 'nvim $HOME/.config/nvim/init.vim'
abbr -ag editvim  'nvim $HOME/.vimrc'
abbr -ag editdots 'cd $dots; nvim;'

set -gx os (uname)

switch $os
  case Darwin
    # NOTE: removed below abbr, and created an alias for `l`
    # NOTE: aliases don't expand like an abbr does
    # abbr -ag l 'ls -lahF'
  case Linux
    # NOTE: removed below abbr, and created an alias for `l`
    # NOTE: aliases don't expand like an abbr does
    # DO NOTHING -- see aliases.fish
    # abbr -ag l 'ls -lahF'
end
abbr -ag cp 'cp -iv'
abbr -ag dots 'cd $dots'

#############################
# ruby tooling
##
if [ -d "$HOME/.rvm" ]
  abbr -ag be 'bundle exec'
end

#############################
# rsync
#
# rysnc -ah --progress [source] [destination]
# -a = preserve file permssions
# -h = human readable output
#
abbr -ag cpv 'rsync -ah --info=progress2'
abbr -ag rm 'rm -iv'
abbr -ag mv 'mv -iv'
abbr -ag df 'df -h'
abbr -ag du 'du -h'
abbr -ag today 'date +"%A, %B %-d, %Y"'

################
# funny abbreviations
##
abbr -ag hunh 'emoji --hunh'
abbr -ag tf 'emoji --table-flip'
abbr -ag woot 'emoji --yay'

################
# git abbreviations
##
abbr -ag gs 'git status'
abbr -ag gd 'git diff --stat'
abbr -ag ga 'git add --all'
abbr -ag gc 'git commit -m'
abbr -ag gac 'git commit -am'
abbr -ag gqc 'git random'
abbr -ag gp 'git push'
abbr -ag gpl 'git pull'
abbr -ag gru 'git remote -v update'
abbr -ag gco 'git checkout'
abbr -ag gsmru 'git smrupdate'

################
# abbreviations for for custom functions
##
abbr -ag pretty_path 'path_pretty'
abbr -ag pretty-path 'path_pretty'
abbr -ag path-pretty 'path_pretty'
abbr -ag pp 'path_pretty'
abbr -ag path-add 'path_add'
abbr -ag path-remove 'path_remove'
abbr -ag path-rm 'path_remove'
abbr -ag toggle_all_python_paths "toggle_anaconda_pythons; \
toggle_asdf_shims_and_bins; toggle_homebrew_python_paths;"

################
# alacritty abbrs
abbr -ag irc-win-4k "alacritty -d 93 22 &; disown"

################
# useful abbreviations for working with NOC lists 💣
# `openssl aes-256-cbc -d -a -in secrets.txt.enc -out secrets.txt.new`
##
if type -q openssl
  #/path/to/file #/path/to/file.dat
  abbr -ag encrypt "openssl enc -aes-256-cbc -in"

  #/path/to/file.dat -out #/path/to/file
  abbr -ag decrypt "openssl enc -aes-256-cbc -d -in"
end

#################
# node.js repl with reverse search
##
if type -q node; and type -q rlwrap;
  abbr -ag inode "rlwrap node"
else
  # DO SOMETHING
  # echo "Your gunna need to do a `brew install rlwrap`"
end

#################
# docker tooling
##
if type -q docker-machine
  abbr -ag dm "docker-machine"
end

#################
# rust tooling
##
abbr -ag rrepl "rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

switch $os
case Darwin
  ################
  # macOS specific abbreviations
  ##
  # setup an alias for quicklook from the terminal in macOS
  abbr -ag ql 'qlmanage -p'
  # update location DB
  # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
  #...`findutils` which provides the `updatedb` bin.
  abbr -ag mac-updatedb 'sudo /usr/libexec/locate.updatedb'
  abbr -ag mac-hide-files 'mac_toggle_hidden_files'
  abbr -ag mac-show-files 'mac_toggle_hidden_files'

  ################
  # launchd / launchctl
  ##
  abbr -ag lc 'launchctl'
  
  ################
  # homebrew specifc abbreviations
  ##
if type -q brew
  # working with brew src and formula
  abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

  # youtube-dl
  abbr -ag ytl "youtube-dl"
  abbr -ag you "youtube-dl"
  abbr -a -g ydl 'youtube-dl --output "%(title)s.%(ext)s"'

  ###
  # brew postgresql
  abbr -ag pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  abbr -ag pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    
  ###
  # brew redis
  ##
  abbr -ag redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
  abbr -ag redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

  ###
  # brew OpenSSH built with LibreSSL
  ##
  abbr -ag ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
  abbr -ag ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"

  ###
  # brew MongoDB
  ##
  # abbr -ag mongodb-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist; set -gx mongod_pid (pgrep mongod); exec fish"
  # abbr -ag mongodb-stop "kill $mongod_pid; set -e mongod_pid; launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist;"
  # abbr -ag print-mongod-pid "echo $mongod_pid"

  abbr -ag mongod-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
  abbr -ag mongod-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
end

case Linux
  ###############################
  # sytemd BS 🙄
  ##
  abbr -ag sc systemctl

  ###############################
  # make copy / paste a little bit easier for pengiuns 🐧
  ##
  abbr -ag pbcopy "xclip -selection clipboard"
  abbr -ag pbpaste "xclip -selection clipboard -o"

  ###############################
  # Linuxbrew
  ##
  if type -q brew
    # working with brew src and formula
    abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

    # youtube-dl
    abbr -ag ytl "youtube-dl"
    abbr -ag you "youtube-dl"
  end
end

################
# Add special 🚌 aliases if certain binaries are found.
##
