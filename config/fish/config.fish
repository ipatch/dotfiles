# NOTE: ipatch, current (2023) global config.fish - single file
#--
# NOTE: ipatch, editing this file in neovim is less than ideal
# ie. most vim navigation does not work ie. [[ or ]] and
# indentation doesn't really work, i blame you 😑 tree-sitter
# https://github.com/ram02z/tree-sitter-fish
#--
# old non tree-sitter vim syntax file
# https://github.com/dag/vim-fish
#--
# - [x] TODO: get code folds working for the love of GOD
    # - i think properly setting this ft to fish has helped some
# - [ ] TODO: properly highlight the word `NOTE:`
# - [ ] TODO: look at ruby related tree-sitter files for inspiration
# - [x] TODO: for reasons i dont understand when closing nvim and opening this file again
# ...the filetype defaults to `conf`
    # - not anymore 👍️
# - [ ] TODO: update `pthrm` func to rm path entries based the number index ie.
# ... `pathrm 1,2,3` instead of copypastaing the entire path entries

if status is-interactive

  # NOTE: ipatch, local var for defining OS specific settings
  set -gx os (/usr/bin/uname)  

  # Commands to run in interactive sessions can go here
  alias gs='git status'
  alias l='ls -lah'
  alias ffprobe='ffprobe -hide_banner'
  alias ffmpeg='ffmpeg -hide_banner'
  alias pgrep='pgrep -i'
  alias pthrm='fish.rm.path'

  # homebrew specific aliases
  alias bp311="$bp/opt/python@3.11/bin/python3.11"

  # fish specific env vars
  set -gx fish_greeting ""
  set -gx fish_emoji_width 2 # NOT COMPATIBLE with fish <= 2.7.1

  # NOTE: ipatch, below env var will break fuzzy match for `git add`
  # set -gx fish_complete_path show_matching
  # Load the right prompt state
  # TODO: requires theme-neolambda
  set -gx display_right_prompt (cat ~/.config/fish/right_prompt_state)

  # *nix specific env vars
  set -gx XDG_CONFIG_HOME $HOME/.config
  # GPG key signing
  set -gx GPG_TTY (tty)

  # start ssh agent
  if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null
  end

  # $USER tooling / js / node / nvm
  set -gx NVM_DIR "$HOME/.config/nvm"
  # .. / rust / deno
  set -gx DENO_INSTALL "$HOME/.deno"

  # $USER tooling / python / venv
  # NOTE: ipatch, todo: should only disable this if fish theme is setup to print the prompt
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

  # $USER tooling / ruby / rbenv
  # todo: check if rbenv is installed and load on init of new shell
  if type -q rbenv
    eval "$(rbenv init -)"
  end

  # $USER env vars
  set -gx code "/opt/code"
  set -gx dots "/opt/code/dotfiles"
  set -gx archdots "$dots/jobs/Linux/arch"
  set -gx github "/opt/code/git/github"
  set -gx ghforks "/opt/code/git/github/forks"
  set -gx ltmp "$HOME/ltmp"
  set -gx hb "$HOME/homebrew"
  set -gx hbfc "$HOME/homebrew/Library/Taps/freecad/homebrew-freecad"

  # app env vars / homebrew
  set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
  set -gx HOMEBREW_EDITOR "nvim"
  set -gx HOMEBREW_NO_GITHUB_API 1
  set -gx HOMEBREW_NO_ANALYTICS 1
  set -gx HOMEBREW_NO_AUTO_UPDATE 1
  set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
  set -gx HOMEBREW_DEVELOPER 1
  # NOTE: ipatch, for reasons above my pay grade the /tmp dir was running out of space on m1 mini running asahi
  set -gx HOMEBREW_TEMP "/opt/tmp"

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
  abbr -a --set-cursor='%' -- mpb '/opt/local/bin/%'

  # fish shell abbr / gnu+linux specific
  #
  # NOTE: ipatch, the below cmd will nuke the $DISPLAY env var  🤷‍♂️
  abbr -a -- hlp.group.reload 'echo "exec su -l $USER"'
  # NOTE: ipatch, spread below cmd across multiple lines
  abbr -a -- hlp.mnt.smb.share 'echo "sudo mount -t cifs //192.168.1.666/guest_share -o username=ozzie,password=changes,iocharset=utf8,uid=(whoami),gid=users,dir_mode=0755,file_mode=0644 /some/path/on/local/fs"'
  abbr -a -- hlp.mount.fat32 'echo "sudo mount -t vfat /dev/sdb1 ~/mnt/usb.drv/ -o rw,umask=0000"'

  abbr -a -- clear.journal 'sudo journalctl --rotate; sudo journalctl --vacuum-time=1s'
  abbr -a -- sc.clear.journal 'sudo journalctl --rotate; sudo journalctl --vacuum-time=1s'
  abbr -a -- sc 'sudo systemctl'
  # TODO: ipatch, below abbr probably better served as a function that can take arg for custom msgs
  abbr -a -- alert 'notify-send -t 0 doitlive'

  # NOTE: ipatch, arch linux specifics
  if [ "$os" = Linux ]; and [ -n /usr/bin/pacman ]
    # TODO: only set this on gnu+linux distros
    abbr -a -- pbcopy 'xclip -selection clipboard'
    abbr -a -- pbpaste "xclip -selection clipboard -o"
    abbr -a -- yay.up.zfs 'yay -Sa --nodeps zfs-dkms zfs-utils'
    abbr -a -- ys 'yay -S'
    abbr -a -- yss 'yay -Ss'
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
  #--

  set -l paths \
    # $HOME/homebrew/opt/python/libexec/bin \
    $HOME/homebrew/sbin \
    $HOME/homebrew/bin \
    $HOME/.rvm/bin \
    $HOME/.bun/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $DENO_INSTALL/bin \
    $code/git/local/bin \
    $HOME/.local/bin \
    /usr/local/sbin \
    /usr/local/bin \
    # below entry should NOT be added
    $HOME/wtf/bin \

  for p in $paths
    if not contains $p $PATH; and test -d $p
      # append PATH entries, ie. top entry appears first in PATH
      # set -gx PATH $PATH $p

      # prepend PATH entries, so that `/usr/sbin:/usr/bin:/sbin:/bin` are the last 4 entries in the PATH
      # NOTE: the path entry order can be tested w/ the fish shell abbr `pp` contained within `abbreviations.fish`
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

  function brew --description "catch common misspelling & add some goodies"
    # Check if /usr/local/bin/brew exists and is executable
    if test -x /usr/local/bin/brew
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
        echo "================================="
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
          echo "================================="
          command brew outdated --greedy
          return # required, or else orig misspelling will be passed to brew
          set_color -d; printf '\n%s' 'use '; set_color -o green; echo "brew outdated --greedy"; set_color normal
      end #switch

      switch "$argv[3]"
        case cask outdated --greddy
        echo "greedy NOT greddy";
        echo "================================="
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

    echo "Cleaning up..."
    rm -f "$filename"

    return 0
  end
end
