###
# A place to store abbreviations for making things a tad bit quicker.
###

###
# Added the below abbreviations because I'm really tired of typing out the below
# command.
###
abbr -a editfish 'nvim $HOME/.config/fish/config.fish'
abbr -a editnvim 'nvim $HOME/.config/nvim/init.vim'
abbr -a l 'ls -lah'
abbr -a cp 'cp -iv'
abbr -a rm 'rm -iv'
abbr -a mv 'mv -iv'
abbr -a df 'df -h'
abbr -a du 'du -h'
abbr -a dotfiles 'cd /opt/Code/dotfiles'
###
# funny abbreviations
###
abbr -a hmmm 'shrug'
abbr -a tf 'table_flip'

# preserve the $USER environment when running the sudo command.
abbr -a sudo 'sudo -E'
###
# git abbreviations
###
abbr -a gs 'git status'
abbr -a gd 'git diff --stat'
abbr -a ga 'git add --all'
abbr -a gc 'git commit -m'
abbr -a gqc 'git random'
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gru 'git remote -v update'
abbr -a gco 'git checkout'
###
# abbreviations for for custom functions
###
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
###
# useful abbreviations for working NOC lists
###
if type -q openssl
  abbr -a encrypt "openssl enc -aes-256-cbc -in" #/path/to/file #/path/to/file.dat
  abbr -a decrypt "openssl enc -aes-256-cbc -d -in" #/path/to/file.dat
end

switch (uname)
  case Darwin
    abbr -a pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    abbr -a pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    # setup an alias to quick look from the terminal in macOS
    abbr -a ql 'qlmanage -p'
    # update location DB
    abbr -a updatedb '/usr/libexec/locate.updatedb'
end

# Add special 🚌 aliases if certain binaries are found.
if type -q pycp
  abbr -a cp 'pycp -i'
end

if type -q ccat
  abbr -a cat 'ccat'
end

if type -q nvim
  abbr -a vim 'nvim'
end
