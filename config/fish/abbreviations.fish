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
abbr -a hmmm 'echo "¯\_(ツ)_/¯"'
# preserve the $USER environment when running the sudo command.
abbr -a sudo 'sudo -E'
###
# git abbreviations
###
abbr -a gs 'git status'
abbr -a gd 'git diff --stat'
abbr -a ga 'git add --all'
abbr -a gc 'git commit -m'
# NOTE: see the functions dir for how to issue quick commits, ie. `gqc`
abbr -a gqc 'git random'
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gru 'git remote -v update'
abbr -a gco 'git checkout'

switch (uname)
  case Darwin
    abbr -a pg-start "launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    abbr -a pg-stop "launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
    # setup an alias to quick look from the terminal in macOS
    abbr -a ql 'qlmanage -p'
end

# Add special 🚌 aliases if certain binaries are found.
if type -q pycp
  abbr -a cp 'pycp -i'
end

if type -q ccat
  abbr -a cat 'ccat'
end
