##############################
# A place to store abbreviations for making things a tad bit quicker.
##

##############################
# Added the below abbreviations because I'm really tired of typing out the below commands.
##
abbr -a editfish 'nvim $HOME/.config/fish/config.fish'
abbr -a editnvim 'nvim $HOME/.config/nvim/init.vim'
abbr -a editvim  'nvim $HOME/.vimrc'
abbr -a editdots 'cd $dot; nvim;'

set -gx os (uname)

switch $os
  case Darwin
    abbr -a l 'ls -lahF'
  case Linux
    # DO NOTHING -- see aliases.fish
    abbr -a l 'ls -lahF'
end
abbr -a cp 'cp -iv'
abbr -a cddots 'cd $dot'
abbr -a dots 'cd $dot'

#############################
# ruby tooling
##
if [ -d "$HOME/.rvm" ]
  abbr -a be 'bundle exec'
end

#############################
# rsync
#
# rysnc -ah --progress [source] [destination]
# -a = preserve file permssions
# -h = human readable output
#
abbr -a cpv 'rsync -ah --info=progress2'
abbr -a rm 'rm -iv'
abbr -a mv 'mv -iv'
abbr -a df 'df -h'
abbr -a du 'du -h'
abbr -a today 'date +"%A, %B %-d, %Y"'
abbr -a dotfiles 'cd $DOTFILES'
abbr -a cddotfiles 'cd $DOTFILES'

################
# funny abbreviations
##
abbr -a hunh 'emoji --hunh'
abbr -a tf 'emoji --table-flip'
abbr -a woot 'emoji --yay'

################
# preserve the $USER environment when running the sudo command.
##
abbr -a sudo 'sudo -E'

################
# git abbreviations
##
abbr -a gs 'git status'
abbr -a gd 'git diff --stat'
abbr -a ga 'git add --all'
abbr -a gc 'git commit -m'
abbr -a gac 'git commit -am'
abbr -a gqc 'git random'
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gru 'git remote -v update'
abbr -a gco 'git checkout'
abbr -a gsmru 'git smrupdate'

################
# abbreviations for for custom functions
##
abbr -a pretty_path 'path_pretty'
abbr -a pretty-path 'path_pretty'
abbr -a path-pretty 'path_pretty'
abbr -a pp 'path_pretty'
abbr -a path-add 'path_add'
abbr -a path-remove 'path_remove'
abbr -a path-rm 'path_remove'
abbr -a toggle_all_python_paths "toggle_anaconda_pythons; \
toggle_asdf_shims_and_bins; toggle_homebrew_python_paths;"
abbr -a toggle_rvm 'rvm_toggle'
abbr -a toggle-rvm 'rvm_toggle'
abbr -a rvm-toggle 'rvm_toggle'

################
# Conditionally set `man` to `vman` fish function
# NOTE: `vman` has mouse support.
##
if type -q vman
  abbr -a man 'vman'
else
  # DO NOTHING
end

################
# useful abbreviations for working with NOC lists 💣
# `openssl aes-256-cbc -d -a -in secrets.txt.enc -out secrets.txt.new`
##
if type -q openssl
  abbr -a encrypt "openssl enc -aes-256-cbc -in" #/path/to/file #/path/to/file.dat
  abbr -a decrypt "openssl enc -aes-256-cbc -d -in" #/path/to/file.dat -out #/path/to/file
end

#################
# node.js repl with reverse search
##
if type -q node; and type -q rlwrap;
  abbr -a inode "rlwrap node"
else
  # DO SOMETHING
  # echo "Your gunna need to do a `brew install rlwrap`"
end

#################
# docker tooling
##
if type -q docker-machine
  abbr -a dm "docker-machine"
end

#################
# rust tooling
##
abbr -a rrepl "rustup run nightly-2016-08-01 ~/.cargo/bin/rusti"

switch $os
case Darwin
    ################
    # macOS specific abbreviations
    ##
# setup an alias for quicklook from the terminal in macOS
    abbr -a ql 'qlmanage -p'
    # update location DB
    # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
    #...`findutils` which provides the `updatedb` bin.
    abbr -a mac-updatedb 'sudo /usr/libexec/locate.updatedb'
    abbr -a fs 'mac_toggle_hidden_files'
    abbr -a fh 'mac_toggle_hidden_files'

    ################
    # launchd / launchctl
    ##
    abbr -a lc 'launchctl'
  
    ################
    # homebrew specifc abbreviations
    ##
if type -q brew
# working with brew src and formula
  abbr -a cd-brew-src "cd (brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"
    ###
    # postgresql
  abbr -a pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
  abbr -a pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    
  ###
  # redis
  abbr -a redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
  abbr -a redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"

  ###
  # brew OpenSSH built with LibreSSL
  ##
  abbr -a ssh-start "sudo launchctl load /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
  abbr -a ssh-stop "sudo launchctl unload /Library/LaunchDaemons/com.chrisrjones.sshd.plist"
 
end

case Linux
  ###############################
  # sytemd BS 🙄
  ##
  abbr -a sc systemctl

  ###############################
  # make copy / paste a little bit easier for pengiuns 🐧
  ##
  abbr -a pbcopy 'xclip -selection clipboard'
  abbr -a pbpaste 'xclip -selection clipboard -o'
end
################
# Add special 🚌 aliases if certain binaries are found.
##
if type -q pycp
  # abbr -a cp 'pycp -i'
end

if type -q ccat
  # abbr -a cat 'ccat'
end
