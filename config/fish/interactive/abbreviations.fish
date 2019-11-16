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
#
abbr -ag edfish "nvim $HOME/.config/fish/config.fish"
abbr -ag ednvim "nvim $HOME/.config/nvim/init.vm"
abbr -ag edvim "nvim $HOME/.vimrc"
abbr -ag eddots "cd $dots; nvim;"

##
# shell specific abbrs
abbr -ag cd- 'cd -'

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

# NOTE: if using double quotes and the abbr contains an env var, ie. `$dots` the env var will be expanded after pressing space, whereas using single quotes will expand the $dots after pressing `enter`
abbr -ag cp "cp -iv"
abbr -ag dots "cd $dots"
abbr -ag dotsw "cd $dots/.wiki"

# get weather
abbr -ag get-weather "curl wttr.in"
abbr -ag getweather "curl wttr.in"

#############################
# ruby tooling
##
if [ -d "$HOME/.rvm" ]
  abbr -ag be "bundle exec"
end

#############################
# rsync
#
# rysnc -ah --progress [source] [destination]
# -a = preserve file permssions
# -h = human readable output
#
abbr -ag cpv "rsync -ahp --info=progress2"
abbr -ag rm "rm -iv"
abbr -ag mv "mv -iv"
abbr -ag df "df -h"
abbr -ag du "du -h"
abbr -ag today "date +'%A, %B %-d, %Y'"
abbr -ag ll "ls -1"
abbr -ag l1 "ls -1"

################
# funny abbreviations
##
abbr -ag hunh "emoji --hunh"
abbr -ag tf "emoji --table-flip"
abbr -ag woot "emoji --yay"

################
# git abbreviations
##
abbr -ag gs "git status"
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
abbr -ag git-ls-aliases 'git aliases'

################
# abbreviations for my custom fish functions
##
abbr -ag pretty_path 'path_pretty'
abbr -ag pretty-path 'path_pretty'
abbr -ag path-pretty 'path_pretty'
abbr -ag pp 'path_pretty'
abbr -ag ppr "path_pretty_redux"
abbr -ag path-add 'path_add'
abbr -ag path-remove 'path_remove'
abbr -ag path-rm 'path_remove'

################
# alacritty abbrs
##
# NOTE creating al windows on macOS with a retinal screen requires 2x the dimensions
# NOTE it appears alacritty v0.2.5 manages window dimensions differently than v0.2.{0,1}
abbr -ag al-win-retina-irc "alacritty -d 138 39 &; disown"
abbr -ag al-win-retina-split "alacritty -d 56 15 &; disown"
abbr -ag al-win-4k-irc "alacritty -d 93 22 &; disown"
abbr -ag al-win-4k-cast "alacritty -d 60 14 &; disown"
abbr -ag al-win-ipad2-irc "alacritty -d 210 60 &; disown"
abbr -ag al-win-u28e590d-irc "alacritty -d 192 45 &; disown" # ext samsung monitor
abbr -ag al-win-4k-samsung "alacritty -d 192 45 &; disown"
#
abbr -ag alwin4ksam "alacritty -d 192 45 &; disown"

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
if type -q docker
  # abbr -ag dm "docker-machine"
  abbr -ag d "docker"
  abbr -ag dc "docker-compose"
end

#################
# asdf tooling
##
if type -q asdf
  abbr -ag cd-asdf-src "cd $HOME/.asdf"
  abbr -ag cdasdfsrc "cd $HOME/.asdf"
end

#################
# pyenv tooling
##
if type -q pyenv
  abbr -ag cd-pyenv-src "cd (pyenv root)"
  abbr -ag cd-pyenv-src "cd (pyenv root)"
end

#################
# rust tooling
##
abbr -ag rrepl "rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

####################
# VirtualBox tooling
##
if type -q virtualbox
  abbr -ag vboxm "VBoxManage"
end

####################
# email clients
##
if type -q neomutt
  abbr -ag nmutt "neomutt"
end

####################
# video processing > ffmpeg
##
if type -q ffprobe
  abbr -ag ffprobe-how-many-frames \
  "ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
  abbr -ag ffprobe-ls-frames \
  "ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
  abbr -ag ffprobe-ls-tframes \
  "ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
end

switch $os
case Darwin
  ################
  # macOS specific abbreviations
  ##

  ####
  # macOS Debugging
  ##
  abbr -ag sip-status "csrutil status"
  abbr -ag mac-print-sip-status "csrutil status"

  # setup an alias for quicklook from the terminal in macOS
  abbr -ag ql "qlmanage -p"
  # update location DB
  # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
  #...`findutils` which provides the `updatedb` bin.
  abbr -ag mac-updatedb "sudo /usr/libexec/locate.updatedb"
  abbr -ag mac-hide-files "mac_toggle_hidden_files"
  abbr -ag mac-show-files "mac_toggle_hidden_files"
  abbr -ag mac-toggle-hidden-files "mac_toggle_hidden_files"
  abbr -ag mac-toggle-desktop-icons "mac_toggle_desktop_icons.sh"
  abbr -ag mac-print-users "mac_lsusers"

  ################
  # launchd / launchctl
  ##
  abbr -ag lc "launchctl"
  
  ################
  # homebrew specifc abbreviations
  ##
  if type -q brew
    # working with brew src and formula
    abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
    abbr -ag cdbrewsrc "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

    # youtube-dl
    abbr -ag you "youtube-dl"
    abbr -a -g youdl 'youtube-dl --output "%(title)s.%(ext)s"'

    ###
    # brew postgresql
    abbr -ag pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    abbr -ag pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

    ###
    # brew redis
    abbr -ag redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
    abbr -ag redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

    ###
    # brew OpenSSH built with LibreSSL
    abbr -ag ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
    abbr -ag ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"

    ###
    # brew MongoDB
    abbr -ag mongod-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
    abbr -ag mongod-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
end

case Linux
  ###############################
  # sytemd BS 🙄
  abbr -ag sc systemctl

  ###############################
  # make copy / paste a little bit easier for pengiuns 🐧
  abbr -ag pbcopy "xclip -selection clipboard"
  abbr -ag pbpaste "xclip -selection clipboard -o"

  ###############################
  # Linuxbrew
  if type -q brew
    # working with brew src and formula
    abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

    # youtube-dl
    abbr -ag you "youtube-dl"
  end
end

################
# Add special 🚌 aliases if certain binaries are found.
