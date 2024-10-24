# NOTE: ipatch, current (2024) global config.fish - single file
#--
# NOTE: ipatch, editing this file in neovim is less than ideal
# ie. most vim navigation does not work ie. [[ or ]]
# i blame you 😑 tree-sitter
# https://github.com/ram02z/tree-sitter-fish
#--
# old non tree-sitter vim syntax file
# https://github.com/dag/vim-fish
#--
# - [ ] TODO: attempt to group all homebrew related entries
# - [x] TODO: get code folds working for the love of GOD
    # - i think properly setting this ft to fish has helped some
# - [x] TODO: properly highlight the word `NOTE:`
    # - installed a ts parser designed for keywords such as NOTE: and TODO:
# - [ ] TODO: look at ruby related tree-sitter files for inspiration
# - [ ] TODO: update `pthrm` func to rm path entries based the number index ie.
# ... `pathrm 1,2,3` instead of copypastaing the entire path entries

if status is-interactive

  # NOTE: ipatch, local var for defining OS specific settings
  set -gx os (/usr/bin/uname)  

  # interactive commands can go here
  alias gs='git status'
  alias l='ls -lah'
  alias ffprobe='ffprobe -hide_banner'
  alias ffmpeg='ffmpeg -hide_banner'
  alias pgrep='pgrep -i'
  alias pthrm='fish.rm.path'

  # $USER tooling / homebrew / set local env var `bp`
  if test -d $HOME/homebrew
    set -gx bp "$HOME/homebrew"
    eval ($bp/bin/brew shellenv)
  end

  ## $USER tooling / homebrew / homebrew specific aliases
  alias bp310="$bp/opt/python@3.10/bin/python3.10"
  alias bp311="$bp/opt/python@3.11/bin/python3.11"
  alias bp312="$bp/opt/python@3.12/bin/python3.12"
  alias bp310pip="$bp/opt/python@3.10/bin/pip3.10"

  abbr -a -- bp310sp "cd $bp/lib/python3.10/site-packages"

  # fish specific env vars
  set -gx fish_greeting ""
  set -gx fish_emoji_width 2 # NOT COMPATIBLE with fish <= 2.7.1

  # NOTE: ipatch, below env var will break fuzzy match for `git add`
  # set -gx fish_complete_path show_matching

  #------------------------------------------------------------
  # Load the right prompt state
  # TODO: requires theme-neolambda
  # TODO: conditionally set var if fish theme is neolambda
  set -gx display_right_prompt (cat ~/.config/fish/right_prompt_state)

  # *nix & macos env vars
  set -gx XDG_CONFIG_HOME $HOME/.config
  # GPG key signing
  set -gx GPG_TTY (tty)
  # start ssh agent
  if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
  end

  # $USER tooling / sre / ghidra
  # TO BAD! https://github.com/NationalSecurityAgency/ghidra/pull/2529
  # /opt/ghidra/support/launch.properties
  # set -gx GHIDRA_ROOT "$XDG_CONFIG_HOME/.ghidra"

  # $USER tooling / gnu-coreutils / ls colors, set after XDG_CONFIG_HOME
  if test -f $XDG_CONFIG_HOME/dir_colors/.dir_colors
    eval (dircolors $XDG_CONFIG_HOME/dir_colors/.dir_colors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')
  end

  # $USER tooling / js / node / nvm
  set -gx NVM_DIR "$HOME/.config/nvm"
  # .. / rust / deno
  set -gx DENO_INSTALL "$HOME/.deno"

  # $USER tooling / python / venv / fish shell related
  # NOTE: ipatch, todo: should only disable this if fish theme is setup to print the prompt
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

  # $USER tooling / ruby / rbenv
  # i manually add $HOME/.rbenv/{shims,bin} to my local $paths var below
  # JUST SAY NO!
  #----------------------------
  # rbenv init -
  # eval "$(rbenv init -)"

  # $USER env vars
  # TODO: ipatch, set vars based different system setups
  if test -w /opt/code
    set -gx code "/opt/code"
    set -gx dots "/opt/code/dotfiles"
  else
    set -gx code "$HOME/code"
    # TODO: ipatch, this dir differs on various systems
    set -gx dots "$HOME/code/dotfiles-ipatch"
  end

  set -gx archdots "$dots/jobs/Linux/arch"
  set -gx github "$code/git/github"
  set -gx ghforks "$code/git/github/forks"
  set -gx ltmp "$HOME/ltmp"
  set -gx hb "$HOME/homebrew"
  set -gx hbfc "$HOME/homebrew/Library/Taps/freecad/homebrew-freecad"
  set -gx us05 "$HOME/homebrew/Library/Taps/ipatch/homebrew-us-05"

  set -gx nvims "$HOME/.config/nvim/sessions"
  set -gx nsesh "$HOME/.config/nvim/sessions"
  set -gx nses  "$HOME/.config/nvim/sessions"

  # app env vars / homebrew
  set -gx HOMEBREW_EDITOR "nvim"
  set -gx HOMEBREW_DEVELOPER 1
  set -gx HOMEBREW_NO_ANALYTICS 1
  set -gx HOMEBREW_NO_AUTO_UPDATE 1
  set -gx HOMEBREW_NO_AUTOREMOVE 1
  set -gx HOMEBREW_NO_GITHUB_API 1
  # set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 0
  set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
  set -gx HOMEBREW_NO_INSTALL_FROM_API 1
  # NOTE: the below var will be overwritten in certain cases
  set -gx HOMEBREW_CACHE "$bp/cache"
  # HOMEBREW_NO_VERIFY_ATTESTATIONS=1
  set -gx hbc "$bp/cache"

  # TODO: possibly getting a false positive
  # Warning: Homebrew's share was not found in your XDG_DATA_DIRS but you have
  # this variable set to include other locations.
  # Some programs like `vapigen` may not work correctly.
  # Consider adding Homebrew's share directory to XDG_DATA_DIRS like so:
  # echo 'export XDG_DATA_DIRS="/home/capin/homebrew/share:$XDG_DATA_DIRS"' >> ~/.config/fish/config.fish

  # below is required to run `brew update`
  if uname -a | grep -q "asahi"
    set -gx HOMEBREW_USE_RUBY_FROM_PATH 1
    export DBUS_SESSION_BUS_ADDRESS='unix:abstract=/tmp/custom_dbus_name,guid=5fe0907d81e722390f1ce02d6033ad76'
  end

  # NOTE: ipatch, for reasons above my pay grade the /tmp dir was running out of space on m1 mini running asahi
  #---
  # Check if /opt/tmp is writable
  if test -w /opt/tmp
    # If /opt/tmp is writable, set to /opt/tmp
    set -gx HOMEBREW_TEMP "/opt/tmp/homebrew"
  else if test -w /Volumes/STORAGE/ipatch/
    # NOTE: ipatch, will run out of space on cfarm104, ie. mac mini m1 ue large storage path
    set -gx HOMEBREW_TEMP "/Volumes/STORAGE/ipatch/tmp"
    # NOTE: it seems setting the cache env var will overwrite/update the prev value
    set -gx HOMEBREW_CACHE "/Volumes/STORAGE/ipatch/homebrew/cache"
    set -gx code "/Volumes/STORAGE/ipatch/code"
    set -gx dots "$code/dotfiles-ipatch"
    set -gx archdots "$dots/jobs/Linux/arch"
    set -gx github "$code/git/github"
    set -gx ghforks "$code/git/github/forks"
    set -gx ltmp "$HOME/ltmp"
    set -gx hb "$HOME/homebrew"
    set -gx hbfc "$HOME/homebrew/Library/Taps/freecad/homebrew-freecad"
  else
    # If /opt/tmp is not writable, set to $HOME/tmp
    set -gx HOMEBREW_TEMP "$HOME/tmp/homebrew"
  end

  # $USER fish abbreviations
  abbr -a -- sr 'exec fish'
  abbr -a -- pp 'string join \n $PATH | nl  '
  abbr -a -- lr 'ls -lrth'
  abbr -a -- dots 'cd $dots'
  abbr -a -- gitc 'git commit -m'
  abbr -a -- gp 'git push -q'
  abbr -a -- cpv 'rsync -at --no-o --no-g -h --info=progress2 -P'
  abbr -a -- mkdir 'mkdir -p'
  abbr -a -- d 'docker'
  abbr -a -- dkc 'docker-compose'
  abbr -a -- rmd 'rm -rf'
  abbr -a -- youdl 'yt-dlp'
  abbr -a -- ydl 'yt-dlp'
  abbr -a -- ksong 'open https://www.kntu.com/last-7-days-of-music-on-kntu/'
  abbr -a -- the.ticket  'mpv --no-video --volume=30 --no-resume-playback "https://13693.live.streamtheworld.com/KTCKAMAAC.aac"'
  abbr -a -- e 'echo'
  abbr -a -- df 'df -h'

  abbr -a -- be 'bundle exec'
  abbr -a -- sh2 'sha256sum'

  # $USER / macos vm tooling / helpful
  # Split version string into major, minor, and patch components
  set fish_major (echo $FISH_VERSION | cut -d. -f1)
  set fish_minor (echo $FISH_VERSION | cut -d. -f2)
  set fish_patch (echo $FISH_VERSION | cut -d. -f3)

  # Check if Fish shell version is 3.7.0 or greater
  if test $fish_major -ge 3; and test $fish_minor -ge 7; and test $fish_patch -ge 0
    abbr -a --set-cursor='%' -- mpb '/opt/local/bin/%'
  end  

  # fish shell abbr / gnu+linux specific
  # NOTE: ipatch, the below cmd will nuke the $DISPLAY env var  🤷‍♂️
  #--------
  # TODO: do not load abbrs on macos systems, thinking it may be related to the below warn/err msgs
  # sudo: gid=4294967295: invalid value
  # sudo: error initializing audit plugin sudoers_audit
  #--------
  if test $os = Linux
    abbr -a -- hlp.group.reload 'echo "exec su -l $USER"'
    # NOTE: ipatch, spread below cmd across multiple lines
    abbr -a -- hlp.mnt.smb.share 'echo "sudo mount -t cifs //192.168.1.666/guest_share -o username=ozzie,password=changes,iocharset=utf8,uid=(whoami),gid=users,dir_mode=0755,file_mode=0644 /some/path/on/local/fs"'
    abbr -a -- hlp.mount.fat32 'echo "sudo mount -t vfat /dev/sdb1 ~/mnt/usb.drv/ -o rw,umask=0000"'
    abbr -a -- hlp.clear.journal 'sudo journalctl --rotate; sudo journalctl --vacuum-time=1s'

    abbr -a -- scu 'systemctl --user'
    abbr -a -- sc 'sudo systemctl'
    abbr -a -- sc.clear.journal 'sudo journalctl --rotate; sudo journalctl --vacuum-time=1s'
    abbr -a -- clear.journal 'sudo journalctl --rotate; sudo journalctl --vacuum-time=1s'
    # TODO: ipatch, below abbr probably better served as a function that can take arg for custom msgs
    abbr -a -- alert 'notify-send -t 0 doitlive'
  end

  # NOTE: ipatch, arch linux specifics
  if [ "$os" = Linux ]; and [ -n /usr/bin/pacman ]
    # TODO: only set this on gnu+linux distros
    abbr -a -- pbcopy 'xclip -selection clipboard'
    abbr -a -- pbpaste "xclip -selection clipboard -o"
    abbr -a -- yay.up.zfs 'yay -Sa --nodeps zfs-dkms zfs-utils'
    abbr -a -- ys 'yay -S'
    abbr -a -- yss 'yay -Ss'

    # TODO: needs to be set more robustly
    # possible fix could be to test if the dir exists
    set -gx bp "$HOME/homebrew"

    abbr -a --set-cursor='%' -- nrd 'npm run dev%'
    abbr -a --set-cursor='%' -- rnd 'npm run dev%'
    abbr -a -- nrdh 'npm run dev:hot'
    abbr -a -- nr 'npm run'
  end

  abbr -a -- nmc 'nmcli'
  abbr -a -- htp 'http'

  # nice things
  if which zoxide >/dev/null
    zoxide init fish | source
  end

  # NOTE: ipatch, yay on archlinux failed to install solvespace with hb_bins first in PATH
  #--
  # REF: https://github.com/fish-shell/fish-shell/issues/2090#issuecomment-149990142
  #--
  # NOTE: ipatch, fish does not play nice with `~` use $HOME env var instead
  # NOTE: ipatch, $USER lang tooling $PATHs
  # NOTE: path entries will persist and require manual removal!!!
  #--

  set -l paths \
    $HOME/homebrew/bin \
    $HOME/homebrew/sbin \
    /opt/cross/apl/bin \
    $HOME/.local/bin \
    $HOME/.rvm/bin \
    $HOME/.rbenv/bin \
    $HOME/.rbenv/shims \
    $HOME/.bun/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $DENO_INSTALL/bin \
    $HOME/.rvm/gems/default/wrappers \
    $code/git/local/bin \
    $HOME/.docker/bin \
    # /usr/local/sbin \
    # /usr/local/bin \
    # below entry should NOT be added
    $HOME/wtf/bin \

    # nowork solargraph
    # $HOME/.gem/ruby/3.0.0/bin \

  if [ (whoami) != "brewmaster" ]
    set paths $paths /usr/local/sbin /usr/local/bin
  end

  # add below path entry if $USER is not capin
  if [ (whoami) != "capin" ]
    set paths $paths $HOME/homebrew/Library/Homebrew/vendor/portable-ruby/current/bin
  end

  for p in $paths
    if not contains $p $PATH; and test -d $p
      # append PATH entries, ie. top entry appears first in PATH
      # set -gx PATH $PATH $p

      # prepend PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
      # NOTE: the path entry order can be tested w/ the fish shell abbr `pp`
      set -gx PATH $p $PATH
    end
  end
  
  # set created & updated files & directories to 664 & 775
  umask 002

  # if file exists, then load it
  if test -f $dots/config/fish/private-env-vars.fish
    source $dots/config/fish/private-env-vars.fish
  end

  # $USER functions
  function fish.rm.path --description 'remove PATH entries from $PATH'
    for arg in $argv
      if set -l index (contains -i $arg $PATH)
        set --erase PATH[$index]
      else
        echo "$arg not found in PATH:"
      end
    end
    echo "Updated PATH:"; string join \n $PATH | nl 
  end

  # TOOD: ipatch, fix, this func breaks homebrew functionality for brewmaster @ vmmojave
  function brew --description "catch common misspelling & add some goodies"
    # Check if /usr/local/bin/brew exists and is executable
    if test -x /usr/local/bin/brew && test "$USER" != "brewmaster"
      /usr/local/bin/brew $argv
      return
    end
    # NOTE: ipatch, `$bp` is an env var defined when setting up `$PATH`
    if test -f "$bp/bin/brew"
      # REF: https://stackoverflow.com/a/60607145/708807
      # thank you @faho
      switch "$argv[1]"
        case tap.ls
          echo "the $argv[2] tap provides the following formula";
          echo "---------------------------------"
          # echo "$argv[2]" # DEBUG
          if type -q jq
            # TODO: split line across multiple lines more gracefully
            command brew tap-info "$argv[2]" --json | jq -r '.[]|(.formula_names[],.cask_tokens[])'
          else
            echo "`jq` is required to output the list of formula provided the tap, install it with `brew install jq`"
            return
          end
          return;
      end

      switch "$argv[2]"
        # TODO: could be implemented better, the 2nd arg `--greddy` seems to still issue an error with brew
      case outdated --greddy
        echo "greedy NOT greddy";
        echo "---------------------------------"
        command brew outdated --greedy
        return # required, or else orig misspelling will be passed to brew
        set_color -d; printf '\n%s' 'use '; set_color -o green; echo "brew outdated --greedy"; set_color normal
      end #switch

      switch "$argv[3]"
        case cask outdated --greddy
          echo "greedy NOT greddy";
          echo "---------------------------------"
          set_color -d red; echo "`brew cask outdated --greedy obsolete`"; set_color normal
          printf "use "; set_color -o green; echo "brew outdated --greedy"; set_color normal
          command brew outdated --greedy
          set_color -d; printf '\n%s' 'use '; set_color -o green; echo "brew outdated --greedy"; set_color normal
        case "*"
          command brew $argv
      end #switch
    else
      echo "brew not found"
    end # if  test /usr/local/bin/brew
  end #function

  # TODO: function should be isolated to systems where yay is installed
  function yay --description "add a `remove` arg for yay and possibly some other goodies"
    if test "$argv[1]" = "remove"
      set -l args $argv[2..-1]
      command yay -Rns $args
    else
      command yay $argv
    end
  end

  function mkcd --description '`mkdir` then `cd` into it'
    mkdir -p $argv; and cd $argv
  end

  function vman --wraps man --description 'use vim / nvim for reading man pages'
    # col `-b` flag = don't output any backspaces
    # col `-p` flag = force uknown control sequences
    # ---
    # iconv -convert between character encodings
    # --
    # iconv `-c` flag = characters that can't be converter are
    # ...silently discarded
    # ---
    # nvim `-c` flag = run argument / command after executing nvim
    # nvim `-R` flag = open "file" in read-only mode
    # ---
    # NOTE: not loading `.vimrc` won't work because i want some bells and whistles provided by my `.vimrc`, ie. syntax highlighting.
    man $argv | col -bp | iconv -c | nvim -c 'set ft=man nomod nolist' -;
  end

  function run_posix_func
    bash -c '
      function posix_func() {
        if [ $(whoami) == 'capin' ]; then
          echo "hello capin";
        else
          echo "nope";
        fi
      }
      posix_func
      '
  end

  # func to calc sha256sum of remote file via curl
  function sharm
    if test -z "$argv[1]"
      echo "Usage: download_and_verify <url>"
      return 1
    end

    set url $argv[1]
    set filename (basename $url)
    set sha256sum_file "$filename.sha256"

    echo "Downloading file from $url..."
    curl -sSL "$url" -o "$filename"

    if test $status -ne 0
      echo "Failed to download file."
      return 1
    end

    echo "Calculating SHA256 checksum..."
    set calculated_sha256sum (shasum -a 256 "$filename" | awk '{print $1}')

    echo "SHA256 checksum: $calculated_sha256sum"

    # TODO: autocopy shasum to clipboard based on environment, ie. xclip or pbcopy

    echo "Cleaning up..."
    rm -f "$filename"

    return 0
  end

  #----------------------------------------------------------------------
  # exp setup dynamic env var for working with git branches
  #-------------
  # Function to update the current branch variable
  function update_current_branch
    if test -d .git
      set -g gcb (git rev-parse --abbrev-ref HEAD)
    else
      set -e gcb
    end
  end

  # Trigger the update when changing directories
  function on_cd --on-variable PWD
    update_current_branch
  end

  # Set up event listeners for Git commands
  function git_checkout_event --on-event fish_preexecd
    set -l cmd (commandline -opc)
    if test $cmd[1] = "git"; and test $cmd[2] = "checkout"
      update_current_branch
    end
  end

  function git_pull_event --on-event fish_preexecd
    set -l cmd (commandline -opc)
    if test $cmd[1] = "git"; and test $cmd[2] = "pull"
      update_current_branch
    end
  end

  function git_branch_event --on-event fish_preexecd
    set -l cmd (commandline -opc)
    if test $cmd[1] = "git"; and test $cmd[2] = "branch"
      update_current_branch
    end
  end
end
