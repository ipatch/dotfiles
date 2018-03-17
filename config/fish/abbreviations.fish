##############################
# A place to store abbreviations for making things a tad bit quicker.
##

##############################
# Added the below abbreviations because I'm really tired of typing out the below commands.
##
abbr -a editfish 'nvim $HOME/.config/fish/config.fish'
abbr -a editnvim 'nvim $HOME/.config/nvim/init.vim'
abbr -a editdots 'cd $dot; nvim .;'
abbr -a l 'ls -lah'
abbr -a cp 'cp -iv'
abbr -a cddots 'cd $dot'
abbr -a dots 'cd $dot'
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
# NOTE: `vman` has trackpad support.
##
if type -q vman
  abbr -a man 'vman'
else
  # DO NOTHING
end

################
# macOS specific abbreviations
##
abbr -a fs 'toggle_hidden_files'
abbr -a fh 'toggle_hidden_files'

################
# useful abbreviations for working NOC lists
##
if type -q openssl
  abbr -a encrypt "openssl enc -aes-256-cbc -in" #/path/to/file #/path/to/file.dat
  abbr -a decrypt "openssl enc -aes-256-cbc -d -in" #/path/to/file.dat
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

switch (uname)
  case Darwin
    ################
    #
    # homebrew specifc abbreviations
    #
    # postgresql
    abbr -a pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    abbr -a pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    #
    # redis
    abbr -a redis-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
    abbr -a redis-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
    #
    # setup an alias for quicklook from the terminal in macOS
    abbr -a ql 'qlmanage -p'
    # update location DB
    # NOTE: changed abbr to `mac-updatedb` because of homebrew installed
    #...`findutils` which provides the `updatedb` bin.
    abbr -a mac-updatedb '/usr/libexec/locate.updatedb'
end
################
#
# Add special 🚌 aliases if certain binaries are found.
#
if type -q pycp
  abbr -a cp 'pycp -i'
end

if type -q ccat
  abbr -a cat 'ccat'
end

if type -q nvim
  abbr -a vim 'nvim'
end
