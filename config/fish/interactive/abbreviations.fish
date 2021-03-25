##############################
# A place to store abbreviations for making things a tad bit quicker.
# NOTE: abbr's will default to universal scope, ie. conditional logic will not "work" for different systems, ie. macOS and Linux, thus use the `-g` flag with `abbr` to make global scope which is NOT universal thus making conditional logic work.
#
###
# NOTE: when adding a new `abbr` fish requires a reload, ie. `exec fish` for every fish shell instance to pick up on the newly added `abbr`.
#
###
# NOTE: if using double quotes and the abbr contains an env var, ie. `$dots` the env var will be expanded after pressing space, whereas using single quotes will expand the $dots after pressing `enter`
#
###
# NOTE: not entirely sure, but I don't think abbr's support spaces, so can not be used for common misspellings of frequent commands, ie. `brew cask outdated --greddy`


##############################
# Added the below abbreviations because I'm really tired of typing the below commands.
##
abbr -ag fishr 'exec fish'
abbr -ag fr 'exec fish'
#
abbr -ag editfish 'nvim $HOME/.config/fish/config.fish'
abbr -ag editnvim 'nvim $HOME/.config/nvim/init.vim'
abbr -ag editvim  'nvim $HOME/.vimrc'
abbr -ag editdots 'cd $dots; nvim;'
#
abbr -ag edfish "nvim $HOME/.config/fish/config.fish"
abbr -ag ednvim "nvim $HOME/.config/nvim/init.vm"
abbr -ag edvim "nvim $HOME/.vimrc"
abbr -ag eddots "cd $dots; nvim;"

# NOTE: OS specific fish abbreviations are defined below
abbr -ag clearf 'cat /dev/null >' # add name of `file` and alias
abbr -ag clrf 'cat /dev/null >' # add name of `file` and alias

#############################
# shell specific 
##
abbr -ag cd- 'cd -'
abbr -ag cp "cp -iv"
abbr -ag dots "cd $dots"
abbr -ag dotsw "cd $dots/.wiki"
abbr -ag rmd "rm -rf"
abbr -ag rm.all.but "echo 'ls --hide=\*{.EXT,.EXT2,.EXT3} | xargs rm'"
#############################
# /os/archlinux
##
abbr -ag dotsarch "cd $dots/jobs/Linux/arch"
abbr -ag dots.arch "cd $dots/jobs/Linux/arch"

# get weather
abbr -ag get-weather "curl wttr.in"
abbr -ag getweather "curl wttr.in"

# music
abbr -ag kntusong "open https://www.kntu.com/last-7-days-of-music-on-kntu/"
abbr -ag kuntsong "open https://www.kntu.com/last-7-days-of-music-on-kntu/"
abbr -ag ksong "open https://www.kntu.com/last-7-days-of-music-on-kntu/"

#############################
# networking related, ie. wget, curl, etc etc
##
abbr -ag curll 'curl -O -L -C -'
abbr -ag crl 'curl -O -L -C -'
abbr -ag curlget 'curl -O -L -C -'
abbr -ag cget 'curl -O -L -C -'

#############################
# ruby tooling
##
if [ -d "$HOME/.rvm" ]
  abbr -ag be "bundle exec"
end

#############################
# python tooling
##
# NO SPACES in abbr's
# abbr -ag 'pip outdated' 'pip list --outdated'

#############################
# rsync
#
# rysnc -ah --progress [source] [destination]
# -a = preserve file permssions
# -h = human readable output
##
abbr -ag cpv "rsync -a --no-o --no-g -h --info=progress2 -P" # useful for network mnts
abbr -ag cpvr "rsync -a --no-o --no-g -h --info=progress2 --append" # resume transfer
abbr -ag rm "rm -iv"
abbr -ag mv "mv -iv"
abbr -ag df "df -h"
abbr -ag du "du -h"
abbr -ag today "date +'%A, %B %-d, %Y'"
abbr -ag ll "ls -1" # same as below
abbr -ag l1 "ls -1" # only filenames, nothing else, single column
abbr -ag lr "ls -lrth" # show newest file first, ie. last line of output
abbr -ag ljd "ls -d ./*/" # only show directories
abbr -ag ls.count.files "ls -p | /usr/bin/grep -v / | wc -l" # ignores hidden files
abbr -ag ls.count.dirs "ls -p | /usr/bin/grep / | wc -l" # ignores hidden dirs

################
# funny abbreviations
##
abbr -ag hunh "emoji --hunh"
abbr -ag tf "emoji --table-flip"
abbr -ag woot "emoji --yay"

################
# git abbreviations
##
# NOTE: i don't think it's possible to define a `gs` alias / abbr in `~/.gitconfig`
abbr -ag gs "git status"
abbr -ag gd 'git diff --stat'
abbr -ag ga 'git add --all'
abbr -ag gitc 'git commit -m'
abbr -ag gac 'git commit -am'
abbr -ag gqc 'git random'
abbr -ag gp 'git push --quiet'
abbr -ag gpl 'git pull'
abbr -ag gru 'git remote -v update'
abbr -ag gco 'git checkout'
abbr -ag gsmru 'git smrupdate'
abbr -ag git-ls-aliases 'git aliases'
abbr -ag gf 'git fresh'
abbr -ag git.is.shallow 'git rev-parse --is-shallow-repository'
abbr -ag git.shallow\? 'git rev-parse --is-shallow-repository'
abbr -ag git.ls.commits 'git rev-list --count HEAD'
abbr -ag git.count.commits 'git rev-list --count HEAD'

################
# personal fish functions
##
abbr -ag pretty_path 'path_pretty' # `path_pretty` is a fish function
abbr -ag pretty-path 'path_pretty'
abbr -ag path-pretty 'path_pretty'
abbr -ag pp 'path_pretty'
abbr -ag ppr "path_pretty_redux"
abbr -ag path-add 'path_add' # fish func
abbr -ag path-remove 'path_remove' # fish func
abbr -ag path-rm 'path_remove'
abbr -ag pthrm 'path_remove'
abbr -ag prm 'path_remove'

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
# SSL encryption: useful abbreviations for working with NOC lists 💣
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
abbr -ag nrd "npm run dev"
abbr -ag nr "npm run"

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
  abbr -ag dta "docker-tags"
  abbr -ag di "docker images"
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
  abbr -ag cdpyenvsrc "cd (pyenv root)"
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
  abbr -ag vbm "VBoxManage"
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
  abbr -ag ffmpeg.rotate \
  "echo 'ffmpeg -i input.mp4 -c copy -metadata:s:v:0 rotaate=0 output=0 output.mp4'"
  abbr -ag ffprobe.howManyFrames \
  "ffprobe -v error -select_streams v:0 -show_entries stream=nb_frames -of default=nokey=1:noprint_wrappers=1"
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

    ## unsorted
    abbr -ag dll "diskutil list"
    abbr -ag dle "diskutil eject"
    abbr -ag dle2 "diskutil eject /dev/disk2"

    # ffmpeg
    abbr -ag mac-ffmpeg-ls-devs "ffmpeg -f avfoundation -list_devices true -i \"\""
    abbr -ag ffmpeglsdevs "ffmpeg -f avfoundation -list_devices true -i \"\""
    abbr -ag ffmpeg.convert.mk4 "echo 'ffmpeg -i [INPUT.MKV] -map 0 -c copy -c:a aac [OUTPUT.MP4]'"

    ##
    # mounting network disks, ie. time capsule on LAN
    # NOTE: the below abbr uses parameter expansion
    # LINK: https://fishshell.com/docs/current/index.html#expand
    #
    # NOTE: added `-o -d=755,-f=644` per the man page set unix octal bits for files
    abbr -ag tcm 'mount -t smbfs -o -d=755,-f=644 //capin:"$TC_PASSWORD"@10.0.1.1/Data /mnt/tc'
    abbr -ag mtc 'mount -t smbfs -o -d=755,-f=644 //capin:"$TC_PASSWORD"@10.0.1.1/Data /mnt/tc'
    abbr -ag utc "umount /mnt/tc"

    abbr -ag df "gdf -h"

    abbr -ag tcmafp 'mount -t afp afp://capin:"$TC_PASSWORD"@10.0.1.1/Data /mnt/tc'
    abbr -ag afptcm 'mount -t afp afp://capin:"$TC_PASSWORD"@10.0.1.1/Data /mnt/tc'

    ####
    # macOS Debugging
    ##
    abbr -ag sip-status "csrutil status"
    abbr -ag mac-sip-status "csrutil status"
    abbr -ag mac-print-sip-status "csrutil status"

    # TODO: migrate all `mac, mac-` related abbrs, alias, shell scripts to use `apl` prefix
    abbr -ag apl.sip.status "csrutil status"

    # setup an alias for quicklook from the terminal in macOS
    abbr -ag ql "qlmanage -p"
    # update location DB
    # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
    #...`findutils` which provides the `updatedb` bin.
    abbr -ag mac-updatedb "sudo /usr/libexec/locate.updatedb"
    abbr -ag mac-hide-files "mac-toggle-hidden-files"
    abbr -ag mac-show-files "mac-toggle-hidden-files"
    abbr -ag mac-toggle-hidden-files "mac-toggle-hidden-files"
    abbr -ag mac-toggle-desktop-icons "mac-toggle-desktop-icons.sh"
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
      abbr -ag brews "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
      abbr -ag cdbrewcache "cd $HOME/Library/Caches/Homebrew"
      abbr -ag cdmytap "cd $code/git/github/public/homebrew-us-05"
      # brew python shit
      abbr -ag cdbrewpysitep "cd (brew --prefix)/opt/python/Frameworks/Python.framework/Versions/Current/lib/python3.9/site-packages"
      abbr -ag cdbrewpysp "cd (brew --prefix)/opt/python/Frameworks/Python.framework/Versions/Current/lib/python3.9/site-packages"
      abbr -ag cdbrewtaps "/usr/local/Homebrew/Library/Taps"

      # NOPE! NOT ALLOWED, ie. fish abbreviations do not support spaces
      # abbr -ag "brew cask outdated --greddy" "brew cask outdated --greedy"

      # logs
      abbr -ag cdbrewlogs "cd (brew --prefix)/var/log"

      # python
      abbr -ag pythonb "$brew_prefix/opt/python/bin/python3"
      abbr -ag bpython  "$brew_prefix/opt/python/bin/python3"
      abbr -ag pipb "$brew_prefix/opt/python/bin/pip3"

      # TODO: why is `bpip` sometimes a func
      #
      # `bpip` sometimes a fish shell function, see. `funced bpip`

      # youtube-dl
      abbr -ag you "youtube-dl"
      abbr -a -g youdl 'youtube-dl --output "%(title)s.%(ext)s"'

      ###
      # brew postgresql
      # NOTE: i modified the below .plist file to point to postgres@10 directory
      abbr -ag brew-pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
      abbr -ag brew-pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

      ###
      # brew redis
      abbr -ag brew-redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
      abbr -ag brew-redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

      ###
      # brew OpenSSH built with LibreSSL
      abbr -ag brew-ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
      abbr -ag brew-ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
      abbr -ag ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
      abbr -ag ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"

      ###
      # brew MongoDB
      abbr -ag brew-mongod-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
      abbr -ag brew-mongod-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
    end

  case Linux
    ###############################
    # sytemd BS 🙄
    abbr -ag sc systemctl

    ###############################
    # make copy / paste a little bit easier for pengiuns 🐧
    abbr -ag pbcopy "xclip -selection clipboard"
    abbr -ag pbpaste "xclip -selection clipboard -o"

    ##############################
    # os/linux/arch
    ##
    if type -q pacman
	abbr -ag pm "sudo pacman"

    end

    ###############################
    # Linuxbrew
    if type -q brew
      # working with brew src and formula
      abbr -ag cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
      abbr -ag cdbrewsrc "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
      abbr -ag rews "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"

      # youtube-dl
      abbr -ag you "youtube-dl"
    end
  end

