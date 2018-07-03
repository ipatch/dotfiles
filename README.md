<h2 align="center">dotfiles for Chris Jones</h2>

> Give me six hours to chop down a tree and I will spend the first four sharpening the axe.

![abe](https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/abe.circle.png)

<h3 align="center">Drink Responsibly™ 🥃 while configuring dot files.</h3>

<h6 align="center"><em>These dotfiles have been known to stop working at a moments notice, so buyer beware.</em></h6>

## Table of Contents

- [the dotfiles wiki](https://github.com/ipatch/dotfiles/wiki)

> A collection of useful pages that complements 👏 these dotfiles.

- [Installation](#installation)
  - [Fish shell setup](#fish-shell-setup)
  - [Neovim setup](https://github.com/ipatch/dotfiles/tree/master/editors/vim)
- [File Structure](#file-structure)
- [Useful Links](#useful-links)
- [TODOs](#todos)
- [Contact](#contact)

<a href="installation"></a>

## Installation

```sh
git clone --recursive git@github.com:ipatch/dotfiles.git
```

> The above shell command will clone this repo and all submodule related repos.  🤙.  To find out more about git submodules, click [here](https://github.com/ipatch/dotfiles/wiki/git-Notes#git-submodules)

<a href="fish-shell-setup"></a>

### [🐟🐚 _Fish Shell_](https://github.com/fish-shell/fish-shell)

> To symlink the fish-shell configuration directory with supporting files.

```sh
ln -sf $dots/config/fish $HOME/.config/fish
```

<a href="file-structure"></a>

## File Structure

<details>
<summary>File Structure</summary>
<pre>
.
├── LICENSE
├── README.md
├── asdf
├── config
│   ├── OS
│   │   ├── Debian
│   │   │   └── etc
│   │   │       └── profile
│   │   └── macOS
│   │       └── 10.13
│   │           └── etc
│   │               └── profile
│   ├── atom
│   │   └── packages.list
│   ├── base16-shell -> /opt/code/github/base16-shell/
│   ├── bash
│   │   ├── bash_profile
│   │   ├── bashrc
│   │   └── functions
│   │       ├── README.md
│   │       ├── debug.bash
│   │       └── foobar.bash
│   ├── bitbar
│   │   ├── cpu-temperature.5s.sh
│   │   ├── fan-speed.5s.sh
│   │   └── spotify.10s.sh
│   ├── brew
│   │   ├── Debian
│   │   │   └── stretch
│   │   │       ├── Brewfile
│   │   │       └── dir_colors -> /opt/Code/dotfiles/config/brew/macOS/10.13/gnu-coreutils/dir_colors
│   │   ├── grc
│   │   │   └── grc.conf
│   │   └── macOS
│   │       ├── 10.12 -> Sierra/
│   │       ├── 10.13 -> High\ Sierra/
│   │       ├── High\ Sierra
│   │       │   ├── Brewfile
│   │       │   ├── Library -> /opt/Code/dotfiles/config/brew/macOS/Sierra/Library
│   │       │   ├── config
│   │       │   │   └── karabiner -> /opt/Code/dotfiles/config/karabiner
│   │       │   ├── etc -> /opt/Code/dotfiles/config/brew/macOS/Sierra/etc
│   │       │   └── gnu-coreutils
│   │       │       └── dir_colors
│   │       └── Sierra
│   │           ├── Brewfile
│   │           ├── Library
│   │           │   ├── LaunchAgents
│   │           │   │   └── com.chrisrjones.ssh-agent.plist
│   │           │   └── LaunchDaemons
│   │           │       └── com.chrisrjones.sshd.plist
│   │           └── etc
│   │               └── ssh
│   │                   ├── ssh_config
│   │                   └── sshd_config
│   ├── code -> vscode
│   ├── firefox
│   │   └── chrome
│   │       └── userChrome.css
│   ├── fish
│   │   ├── abbreviations.fish
│   │   ├── aliases.fish
│   │   ├── completions
│   │   │   ├── alacritty.fish
│   │   │   ├── asdf.fish
│   │   │   └── docker.fish
│   │   ├── conf.d
│   │   │   ├── 001_load_paths.fish
│   │   │   ├── 002_load_ls_colors.fish
│   │   │   ├── 005_omf.fish
│   │   │   └── 007_load_pyen.fish
│   │   ├── config.fish
│   │   ├── config.fish.bkup
│   │   ├── fish_universal_variables
│   │   ├── fishd.b8e85636f766
│   │   ├── frameworks
│   │   │   └── omf
│   │   │       ├── bundle
│   │   │       ├── channel
│   │   │       ├── theme
│   │   │       └── themes
│   │   │           └── theme-neolambda
│   │   │               ├── LICENSE
│   │   │               ├── README.md
│   │   │               ├── fish_prompt.fish
│   │   │               ├── fish_right_prompt.fish
│   │   │               ├── lib
│   │   │               │   ├── fish-shell-lambda-theme.png
│   │   │               │   ├── virtualenv-double-prompt.png
│   │   │               │   └── virtualenv.png
│   │   │               └── tags
│   │   ├── functions
│   │   │   ├── bases.fish
│   │   │   ├── brew_find_pkg.fish
│   │   │   ├── color.fish
│   │   │   ├── dbus_launch.fish
│   │   │   ├── editfish.fish
│   │   │   ├── emoji.fish
│   │   │   ├── erl_cmd_his.fish
│   │   │   ├── fish_prompt.fish -> /Users/capin/.local/share/omf/themes/neolambda/fish_prompt.fish
│   │   │   ├── fish_term_wrap.fish
│   │   │   ├── fish_title.fish
│   │   │   ├── fish_user_key_bindings.fish
│   │   │   ├── foobar.fish
│   │   │   ├── fundle.fish
│   │   │   ├── git_submodule_add_commit.fish
│   │   │   ├── gittree.fish
│   │   │   ├── h.fish
│   │   │   ├── key-bindings.fish -> /usr/local/opt/fzf/shell/key-bindings.fish
│   │   │   ├── ln_asdf_man_pages.fish
│   │   │   ├── ln_dotfiles.fish
│   │   │   ├── mac_lsusers.fish
│   │   │   ├── mac_toggle_hidden_files.fish
│   │   │   ├── mac_useradd.fish
│   │   │   ├── manpdf.fish
│   │   │   ├── mk_asdf_bins.fish
│   │   │   ├── mkcd.fish
│   │   │   ├── path_add.fish
│   │   │   ├── path_pretty.fish
│   │   │   ├── path_remove.fish
│   │   │   ├── perl_print_emoji.fish
│   │   │   ├── print_fish.fish
│   │   │   ├── print_wan_ip.fish
│   │   │   ├── rtail.fish
│   │   │   ├── rvm.fish
│   │   │   ├── rvm_toggle.fish
│   │   │   ├── shell_color_palette.fish
│   │   │   ├── test_256_color.fish
│   │   │   ├── test_italic.fish
│   │   │   ├── test_true_color.fish
│   │   │   ├── toggle_anaconda_pythons.fish
│   │   │   ├── toggle_asdf_shims_and_bins.fish
│   │   │   ├── toggle_homebrew_python_path.fish
│   │   │   ├── toggle_homebrew_ruby.fish
│   │   │   └── vman.fish
│   │   ├── fundle
│   │   │   └── edc
│   │   │       └── bass
│   │   │           ├── LICENSE
│   │   │           ├── Makefile
│   │   │           ├── README.md
│   │   │           ├── functions
│   │   │           │   ├── __bass.py
│   │   │           │   └── bass.fish
│   │   │           └── test
│   │   │               ├── fixtures
│   │   │               │   └── dollar_output.sh
│   │   │               ├── test_bass.fish
│   │   │               └── test_dollar_on_output.fish
│   │   └── interactive.fish
│   ├── git
│   │   ├── gitattributes
│   │   ├── gitconfig
│   │   └── gitexcludes
│   ├── inputrc
│   ├── irc-clients
│   │   └── weechat
│   │       ├── alias.conf
│   │       ├── aspell.conf
│   │       ├── buffers.conf
│   │       ├── buflist.conf
│   │       ├── charset.conf
│   │       ├── colorize_nicks.conf
│   │       ├── exec.conf
│   │       ├── fifo.conf
│   │       ├── fset.conf
│   │       ├── irc.conf
│   │       ├── iset.conf
│   │       ├── logger.conf
│   │       ├── logs
│   │       │   ├── core.weechat.weechatlog
│   │       │   ├── irc.efnet.#netbsd.weechatlog
│   │       │   ├── irc.freenode.##homebrew.weechatlog
│   │       │   ├── irc.freenode.##sed.weechatlog
│   │       │   ├── irc.freenode.#applescript.weechatlog
│   │       │   ├── irc.freenode.#atom.weechatlog
│   │       │   ├── irc.freenode.#blahblah.weechatlog
│   │       │   ├── irc.freenode.#chromium-support.weechatlog
│   │       │   ├── irc.freenode.#chromium.weechatlog
│   │       │   ├── irc.freenode.#cmake.weechatlog
│   │       │   ├── irc.freenode.#debian.weechatlog
│   │       │   ├── irc.freenode.#facetimehd.weechatlog
│   │       │   ├── irc.freenode.#filmsbykris.weechatlog
│   │       │   ├── irc.freenode.#firefox-unregistered.weechatlog
│   │       │   ├── irc.freenode.#fish.weechatlog
│   │       │   ├── irc.freenode.#freenode.weechatlog
│   │       │   ├── irc.freenode.#gcc.weechatlog
│   │       │   ├── irc.freenode.#gdb.weechatlog
│   │       │   ├── irc.freenode.#git.weechatlog
│   │       │   ├── irc.freenode.#github.weechatlog
│   │       │   ├── irc.freenode.#iterm2.weechatlog
│   │       │   ├── irc.freenode.#kegbot.weechatlog
│   │       │   ├── irc.freenode.#lfs-support.weechatlog
│   │       │   ├── irc.freenode.#machomebrew.weechatlog
│   │       │   ├── irc.freenode.#mipslinux.weechatlog
│   │       │   ├── irc.freenode.#mpv.weechatlog
│   │       │   ├── irc.freenode.#my-super-fancy-test-channel.weechatlog
│   │       │   ├── irc.freenode.#my_super_fancy_test_channel.weechatlog
│   │       │   ├── irc.freenode.#neomutt.weechatlog
│   │       │   ├── irc.freenode.#netbsd.weechatlog
│   │       │   ├── irc.freenode.#openjtag.weechatlog
│   │       │   ├── irc.freenode.#openocd.weechatlog
│   │       │   ├── irc.freenode.#openwrt.weechatlog
│   │       │   ├── irc.freenode.#osxre.weechatlog
│   │       │   ├── irc.freenode.#python-unregistered.weechatlog
│   │       │   ├── irc.freenode.#radare.weechatlog
│   │       │   ├── irc.freenode.#rsync.weechatlog
│   │       │   ├── irc.freenode.#ruby.weechatlog
│   │       │   ├── irc.freenode.#test-channel.weechatlog
│   │       │   ├── irc.freenode.#theairportwiki.weechatlog
│   │       │   ├── irc.freenode.#tmux.weechatlog
│   │       │   ├── irc.freenode.#weechat.weechatlog
│   │       │   ├── irc.freenode.#xorg.weechatlog
│   │       │   ├── irc.freenode.capin.weechatlog
│   │       │   ├── irc.freenode.capin1.weechatlog
│   │       │   ├── irc.oftc.#fish.weechatlog
│   │       │   ├── irc.oftc.#qemu.weechatlog
│   │       │   ├── irc.server.efnet.weechatlog
│   │       │   ├── irc.server.freenode.weechatlog
│   │       │   └── irc.server.oftc.weechatlog
│   │       ├── lua
│   │       │   └── autoload
│   │       ├── perl
│   │       │   ├── autoload
│   │       │   │   ├── iset.pl -> ../iset.pl
│   │       │   │   ├── multiline.pl -> ../multiline.pl
│   │       │   │   └── nickregain.pl -> ../nickregain.pl
│   │       │   ├── iset.pl
│   │       │   ├── multiline.pl
│   │       │   └── nickregain.pl
│   │       ├── perl.conf
│   │       ├── plugins.conf
│   │       ├── python
│   │       │   ├── autojoin.py
│   │       │   ├── autoload
│   │       │   │   ├── autojoin.py -> ../autojoin.py
│   │       │   │   ├── colorize_nicks.py -> ../colorize_nicks.py
│   │       │   │   ├── histsearch.py -> ../histsearch.py
│   │       │   │   └── pyrnotify.py -> ../pyrnotify.py
│   │       │   ├── colorize_nicks.py
│   │       │   ├── histsearch.py
│   │       │   └── pyrnotify.py
│   │       ├── python.conf
│   │       ├── relay.conf
│   │       ├── ruby
│   │       │   └── autoload
│   │       ├── ruby.conf
│   │       ├── script
│   │       │   └── plugins.xml.gz
│   │       ├── script.conf
│   │       ├── sec.conf
│   │       ├── tcl
│   │       │   └── autoload
│   │       ├── trigger.conf
│   │       ├── weechat.conf
│   │       ├── weechat.log
│   │       ├── weechat.png
│   │       ├── xfer
│   │       └── xfer.conf
│   ├── karabiner
│   │   ├── assets
│   │   │   └── complex_modifications
│   │   └── karabiner.json
│   ├── mpv
│   │   ├── input.conf
│   │   ├── mpv.conf
│   │   └── watch_later
│   ├── nvim
│   │   ├── autoload
│   │   ├── init.vim
│   │   └── pack
│   │       └── minpac
│   │           ├── opt
│   │           └── start
│   ├── pt
│   │   └── config.toml
│   ├── vscode
│   │   ├── keybindings.json
│   │   └── settings.json
│   └── zsh
│       ├── functions
│       ├── zlogin
│       ├── zshenv
│       └── zshrc
├── editors
│   ├── atom -> /opt/Code/dotfiles/config/atom
│   ├── code -> /opt/Code/dotfiles/config/code
│   ├── ctags
│   ├── nvim -> /opt/Code/dotfiles/config/nvim
│   └── vim
│       ├── editorconfig
│       ├── init.vim -> /opt/Code/dotfiles/config/nvim/init.vim
│       ├── vim
│       │   ├── after
│       │   │   ├── ftplugin
│       │   │   │   ├── html.vim
│       │   │   │   ├── javascript
│       │   │   │   │   └── folding.vim
│       │   │   │   ├── markdown
│       │   │   │   │   └── folding.vim
│       │   │   │   ├── markdown.vim
│       │   │   │   ├── python.vim
│       │   │   │   └── vim
│       │   │   │       ├── folding.vim
│       │   │   │       └── vim.vim
│       │   │   └── plugin
│       │   │       └── indentLine.vim
│       │   ├── autoload
│       │   │   └── wincent
│       │   │       ├── autocmds.vim
│       │   │       ├── mappings
│       │   │       │   └── visual.vim
│       │   │       └── settings.vim
│       │   ├── colors
│       │   ├── pack
│       │   │   └── minpac
│       │   │       ├── opt
│       │   │       │   └── minpac
│       │   │       │       ├── README.md
│       │   │       │       ├── appveyor.yml
│       │   │       │       ├── autoload
│       │   │       │       │   └── minpac
│       │   │       │       │       ├── LICENSE.async-vim.txt
│       │   │       │       │       ├── impl.vim
│       │   │       │       │       └── job.vim
│       │   │       │       ├── doc
│       │   │       │       │   ├── minpac.txt
│       │   │       │       │   └── tags
│       │   │       │       ├── plugin
│       │   │       │       │   └── minpac.vim
│       │   │       │       ├── test
│       │   │       │       │   ├── Make_all.mak
│       │   │       │       │   ├── Make_win.mak
│       │   │       │       │   ├── Makefile
│       │   │       │       │   ├── README
│       │   │       │       │   ├── runtest.vim
│       │   │       │       │   ├── setup.vim
│       │   │       │       │   ├── small.vim
│       │   │       │       │   └── test_minpac.vim
│       │   │       │       └── tools
│       │   │       │           ├── appveyor-dl.bat
│       │   │       │           ├── dl-kaoriya-vim.py
│       │   │       │           └── pull-async-vim.sh
│       │   │       └── start
│       │   │           ├── ale
│       │   │           │   ├── CODE_OF_CONDUCT.md
│       │   │           │   ├── CONTRIBUTING.md
│       │   │           │   ├── Dockerfile
│       │   │           │   ├── ISSUE_TEMPLATE.md
│       │   │           │   ├── LICENSE
│       │   │           │   ├── PULL_REQUEST_TEMPLATE.md
│       │   │           │   ├── README.md
│       │   │           │   ├── ale_linters
│       │   │           │   │   ├── ansible
│       │   │           │   │   │   └── ansible_lint.vim
│       │   │           │   │   ├── apiblueprint
│       │   │           │   │   │   └── drafter.vim
│       │   │           │   │   ├── asciidoc
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── redpen.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── asm
│       │   │           │   │   │   └── gcc.vim
│       │   │           │   │   ├── awk
│       │   │           │   │   │   └── gawk.vim
│       │   │           │   │   ├── c
│       │   │           │   │   │   ├── clang.vim
│       │   │           │   │   │   ├── clangtidy.vim
│       │   │           │   │   │   ├── cppcheck.vim
│       │   │           │   │   │   ├── flawfinder.vim
│       │   │           │   │   │   └── gcc.vim
│       │   │           │   │   ├── chef
│       │   │           │   │   │   └── foodcritic.vim
│       │   │           │   │   ├── clojure
│       │   │           │   │   │   └── joker.vim
│       │   │           │   │   ├── cmake
│       │   │           │   │   │   └── cmakelint.vim
│       │   │           │   │   ├── coffee
│       │   │           │   │   │   ├── coffee.vim
│       │   │           │   │   │   └── coffeelint.vim
│       │   │           │   │   ├── cpp
│       │   │           │   │   │   ├── clang.vim
│       │   │           │   │   │   ├── clangcheck.vim
│       │   │           │   │   │   ├── clangtidy.vim
│       │   │           │   │   │   ├── cppcheck.vim
│       │   │           │   │   │   ├── cpplint.vim
│       │   │           │   │   │   ├── cquery.vim
│       │   │           │   │   │   ├── flawfinder.vim
│       │   │           │   │   │   └── gcc.vim
│       │   │           │   │   ├── crystal
│       │   │           │   │   │   └── crystal.vim
│       │   │           │   │   ├── cs
│       │   │           │   │   │   ├── mcs.vim
│       │   │           │   │   │   └── mcsc.vim
│       │   │           │   │   ├── css
│       │   │           │   │   │   ├── csslint.vim
│       │   │           │   │   │   └── stylelint.vim
│       │   │           │   │   ├── cucumber
│       │   │           │   │   │   └── cucumber.vim
│       │   │           │   │   ├── cuda
│       │   │           │   │   │   └── nvcc.vim
│       │   │           │   │   ├── d
│       │   │           │   │   │   └── dmd.vim
│       │   │           │   │   ├── dafny
│       │   │           │   │   │   └── dafny.vim
│       │   │           │   │   ├── dart
│       │   │           │   │   │   ├── dartanalyzer.vim
│       │   │           │   │   │   └── language_server.vim
│       │   │           │   │   ├── dockerfile
│       │   │           │   │   │   └── hadolint.vim
│       │   │           │   │   ├── elixir
│       │   │           │   │   │   ├── credo.vim
│       │   │           │   │   │   ├── dialyxir.vim
│       │   │           │   │   │   └── dogma.vim
│       │   │           │   │   ├── elm
│       │   │           │   │   │   └── make.vim
│       │   │           │   │   ├── erlang
│       │   │           │   │   │   ├── erlc.vim
│       │   │           │   │   │   └── syntaxerl.vim
│       │   │           │   │   ├── eruby
│       │   │           │   │   │   ├── erb.vim
│       │   │           │   │   │   ├── erubi.vim
│       │   │           │   │   │   └── erubis.vim
│       │   │           │   │   ├── fish
│       │   │           │   │   │   └── fish.vim
│       │   │           │   │   ├── fortran
│       │   │           │   │   │   └── gcc.vim
│       │   │           │   │   ├── fountain
│       │   │           │   │   │   └── proselint.vim
│       │   │           │   │   ├── fuse
│       │   │           │   │   │   └── fusionlint.vim
│       │   │           │   │   ├── gitcommit
│       │   │           │   │   │   └── gitlint.vim
│       │   │           │   │   ├── glsl
│       │   │           │   │   │   ├── glslang.vim
│       │   │           │   │   │   └── glslls.vim
│       │   │           │   │   ├── go
│       │   │           │   │   │   ├── gobuild.vim
│       │   │           │   │   │   ├── gofmt.vim
│       │   │           │   │   │   ├── golint.vim
│       │   │           │   │   │   ├── gometalinter.vim
│       │   │           │   │   │   ├── gosimple.vim
│       │   │           │   │   │   ├── gotype.vim
│       │   │           │   │   │   ├── govet.vim
│       │   │           │   │   │   └── staticcheck.vim
│       │   │           │   │   ├── graphql
│       │   │           │   │   │   ├── eslint.vim
│       │   │           │   │   │   └── gqlint.vim
│       │   │           │   │   ├── haml
│       │   │           │   │   │   └── hamllint.vim
│       │   │           │   │   ├── handlebars
│       │   │           │   │   │   └── embertemplatelint.vim
│       │   │           │   │   ├── haskell
│       │   │           │   │   │   ├── ghc-mod.vim
│       │   │           │   │   │   ├── ghc.vim
│       │   │           │   │   │   ├── hdevtools.vim
│       │   │           │   │   │   ├── hlint.vim
│       │   │           │   │   │   ├── stack_build.vim
│       │   │           │   │   │   └── stack_ghc.vim
│       │   │           │   │   ├── help
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── html
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── htmlhint.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── tidy.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── idris
│       │   │           │   │   │   └── idris.vim
│       │   │           │   │   ├── java
│       │   │           │   │   │   ├── checkstyle.vim
│       │   │           │   │   │   ├── javac.vim
│       │   │           │   │   │   └── pmd.vim
│       │   │           │   │   ├── javascript
│       │   │           │   │   │   ├── eslint.vim
│       │   │           │   │   │   ├── flow.vim
│       │   │           │   │   │   ├── jscs.vim
│       │   │           │   │   │   ├── jshint.vim
│       │   │           │   │   │   ├── standard.vim
│       │   │           │   │   │   └── xo.vim
│       │   │           │   │   ├── json
│       │   │           │   │   │   └── jsonlint.vim
│       │   │           │   │   ├── kotlin
│       │   │           │   │   │   ├── kotlinc.vim
│       │   │           │   │   │   └── ktlint.vim
│       │   │           │   │   ├── less
│       │   │           │   │   │   ├── lessc.vim
│       │   │           │   │   │   └── stylelint.vim
│       │   │           │   │   ├── llvm
│       │   │           │   │   │   └── llc.vim
│       │   │           │   │   ├── lua
│       │   │           │   │   │   ├── luac.vim
│       │   │           │   │   │   └── luacheck.vim
│       │   │           │   │   ├── mail
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── vale.vim
│       │   │           │   │   ├── make
│       │   │           │   │   │   └── checkmake.vim
│       │   │           │   │   ├── markdown
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── markdownlint.vim
│       │   │           │   │   │   ├── mdl.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── redpen.vim
│       │   │           │   │   │   ├── remark_lint.vim
│       │   │           │   │   │   ├── textlint.vim
│       │   │           │   │   │   ├── vale.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── matlab
│       │   │           │   │   │   └── mlint.vim
│       │   │           │   │   ├── mercury
│       │   │           │   │   │   └── mmc.vim
│       │   │           │   │   ├── nasm
│       │   │           │   │   │   └── nasm.vim
│       │   │           │   │   ├── nim
│       │   │           │   │   │   └── nimcheck.vim
│       │   │           │   │   ├── nix
│       │   │           │   │   │   └── nix.vim
│       │   │           │   │   ├── nroff
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── objc
│       │   │           │   │   │   └── clang.vim
│       │   │           │   │   ├── objcpp
│       │   │           │   │   │   └── clang.vim
│       │   │           │   │   ├── ocaml
│       │   │           │   │   │   ├── merlin.vim
│       │   │           │   │   │   └── ols.vim
│       │   │           │   │   ├── perl
│       │   │           │   │   │   ├── perl.vim
│       │   │           │   │   │   └── perlcritic.vim
│       │   │           │   │   ├── php
│       │   │           │   │   │   ├── hack.vim
│       │   │           │   │   │   ├── langserver.vim
│       │   │           │   │   │   ├── phan.vim
│       │   │           │   │   │   ├── php.vim
│       │   │           │   │   │   ├── phpcs.vim
│       │   │           │   │   │   ├── phpmd.vim
│       │   │           │   │   │   └── phpstan.vim
│       │   │           │   │   ├── po
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── msgfmt.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── pod
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── pony
│       │   │           │   │   │   └── ponyc.vim
│       │   │           │   │   ├── proto
│       │   │           │   │   │   └── protoc_gen_lint.vim
│       │   │           │   │   ├── pug
│       │   │           │   │   │   └── puglint.vim
│       │   │           │   │   ├── puppet
│       │   │           │   │   │   ├── puppet.vim
│       │   │           │   │   │   └── puppetlint.vim
│       │   │           │   │   ├── pyrex
│       │   │           │   │   │   └── cython.vim
│       │   │           │   │   ├── python
│       │   │           │   │   │   ├── flake8.vim
│       │   │           │   │   │   ├── mypy.vim
│       │   │           │   │   │   ├── prospector.vim
│       │   │           │   │   │   ├── pycodestyle.vim
│       │   │           │   │   │   ├── pyflakes.vim
│       │   │           │   │   │   ├── pylint.vim
│       │   │           │   │   │   └── pyls.vim
│       │   │           │   │   ├── qml
│       │   │           │   │   │   ├── qmlfmt.vim
│       │   │           │   │   │   └── qmllint.vim
│       │   │           │   │   ├── r
│       │   │           │   │   │   └── lintr.vim
│       │   │           │   │   ├── reason
│       │   │           │   │   │   ├── merlin.vim
│       │   │           │   │   │   └── ols.vim
│       │   │           │   │   ├── review
│       │   │           │   │   │   └── redpen.vim
│       │   │           │   │   ├── rst
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── redpen.vim
│       │   │           │   │   │   ├── rstcheck.vim
│       │   │           │   │   │   ├── vale.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── ruby
│       │   │           │   │   │   ├── brakeman.vim
│       │   │           │   │   │   ├── rails_best_practices.vim
│       │   │           │   │   │   ├── reek.vim
│       │   │           │   │   │   ├── rubocop.vim
│       │   │           │   │   │   └── ruby.vim
│       │   │           │   │   ├── rust
│       │   │           │   │   │   ├── cargo.vim
│       │   │           │   │   │   ├── rls.vim
│       │   │           │   │   │   └── rustc.vim
│       │   │           │   │   ├── sass
│       │   │           │   │   │   ├── sasslint.vim
│       │   │           │   │   │   └── stylelint.vim
│       │   │           │   │   ├── scala
│       │   │           │   │   │   ├── fsc.vim
│       │   │           │   │   │   ├── scalac.vim
│       │   │           │   │   │   └── scalastyle.vim
│       │   │           │   │   ├── scss
│       │   │           │   │   │   ├── sasslint.vim
│       │   │           │   │   │   ├── scsslint.vim
│       │   │           │   │   │   └── stylelint.vim
│       │   │           │   │   ├── sh
│       │   │           │   │   │   ├── shell.vim
│       │   │           │   │   │   └── shellcheck.vim
│       │   │           │   │   ├── slim
│       │   │           │   │   │   └── slimlint.vim
│       │   │           │   │   ├── sml
│       │   │           │   │   │   ├── smlnj.vim
│       │   │           │   │   │   └── smlnj_cm.vim
│       │   │           │   │   ├── solidity
│       │   │           │   │   │   ├── solhint.vim
│       │   │           │   │   │   └── solium.vim
│       │   │           │   │   ├── spec
│       │   │           │   │   │   └── rpmlint.vim
│       │   │           │   │   ├── sql
│       │   │           │   │   │   └── sqlint.vim
│       │   │           │   │   ├── stylus
│       │   │           │   │   │   └── stylelint.vim
│       │   │           │   │   ├── swift
│       │   │           │   │   │   └── swiftlint.vim
│       │   │           │   │   ├── tcl
│       │   │           │   │   │   └── nagelfar.vim
│       │   │           │   │   ├── terraform
│       │   │           │   │   │   └── tflint.vim
│       │   │           │   │   ├── testft
│       │   │           │   │   │   └── testlinter.vim
│       │   │           │   │   ├── tex
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── chktex.vim
│       │   │           │   │   │   ├── lacheck.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── redpen.vim
│       │   │           │   │   │   ├── vale.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── texinfo
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── text
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   ├── redpen.vim
│       │   │           │   │   │   ├── textlint.vim
│       │   │           │   │   │   ├── vale.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── thrift
│       │   │           │   │   │   └── thrift.vim
│       │   │           │   │   ├── typescript
│       │   │           │   │   │   ├── eslint.vim
│       │   │           │   │   │   ├── tslint.vim
│       │   │           │   │   │   ├── tsserver.vim
│       │   │           │   │   │   └── typecheck.vim
│       │   │           │   │   ├── verilog
│       │   │           │   │   │   ├── iverilog.vim
│       │   │           │   │   │   └── verilator.vim
│       │   │           │   │   ├── vim
│       │   │           │   │   │   └── vint.vim
│       │   │           │   │   ├── xhtml
│       │   │           │   │   │   ├── alex.vim
│       │   │           │   │   │   ├── proselint.vim
│       │   │           │   │   │   └── write-good.vim
│       │   │           │   │   ├── xml
│       │   │           │   │   │   └── xmllint.vim
│       │   │           │   │   └── yaml
│       │   │           │   │       ├── swaglint.vim
│       │   │           │   │       └── yamllint.vim
│       │   │           │   ├── autoload
│       │   │           │   │   ├── ale
│       │   │           │   │   │   ├── autocmd.vim
│       │   │           │   │   │   ├── balloon.vim
│       │   │           │   │   │   ├── c.vim
│       │   │           │   │   │   ├── command.vim
│       │   │           │   │   │   ├── completion
│       │   │           │   │   │   │   └── python.vim
│       │   │           │   │   │   ├── completion.vim
│       │   │           │   │   │   ├── cursor.vim
│       │   │           │   │   │   ├── debugging.vim
│       │   │           │   │   │   ├── definition.vim
│       │   │           │   │   │   ├── engine.vim
│       │   │           │   │   │   ├── events.vim
│       │   │           │   │   │   ├── filetypes.vim
│       │   │           │   │   │   ├── fix
│       │   │           │   │   │   │   └── registry.vim
│       │   │           │   │   │   ├── fix.vim
│       │   │           │   │   │   ├── fixers
│       │   │           │   │   │   │   ├── autopep8.vim
│       │   │           │   │   │   │   ├── black.vim
│       │   │           │   │   │   │   ├── brittany.vim
│       │   │           │   │   │   │   ├── clangformat.vim
│       │   │           │   │   │   │   ├── elm_format.vim
│       │   │           │   │   │   │   ├── eslint.vim
│       │   │           │   │   │   │   ├── fixjson.vim
│       │   │           │   │   │   │   ├── generic.vim
│       │   │           │   │   │   │   ├── generic_python.vim
│       │   │           │   │   │   │   ├── gofmt.vim
│       │   │           │   │   │   │   ├── goimports.vim
│       │   │           │   │   │   │   ├── google_java_format.vim
│       │   │           │   │   │   │   ├── hackfmt.vim
│       │   │           │   │   │   │   ├── help.vim
│       │   │           │   │   │   │   ├── hfmt.vim
│       │   │           │   │   │   │   ├── importjs.vim
│       │   │           │   │   │   │   ├── isort.vim
│       │   │           │   │   │   │   ├── jq.vim
│       │   │           │   │   │   │   ├── mix_format.vim
│       │   │           │   │   │   │   ├── perltidy.vim
│       │   │           │   │   │   │   ├── php_cs_fixer.vim
│       │   │           │   │   │   │   ├── phpcbf.vim
│       │   │           │   │   │   │   ├── prettier.vim
│       │   │           │   │   │   │   ├── prettier_eslint.vim
│       │   │           │   │   │   │   ├── prettier_standard.vim
│       │   │           │   │   │   │   ├── puppetlint.vim
│       │   │           │   │   │   │   ├── refmt.vim
│       │   │           │   │   │   │   ├── rubocop.vim
│       │   │           │   │   │   │   ├── rufo.vim
│       │   │           │   │   │   │   ├── rustfmt.vim
│       │   │           │   │   │   │   ├── scalafmt.vim
│       │   │           │   │   │   │   ├── shfmt.vim
│       │   │           │   │   │   │   ├── standard.vim
│       │   │           │   │   │   │   ├── stylelint.vim
│       │   │           │   │   │   │   ├── swiftformat.vim
│       │   │           │   │   │   │   ├── tslint.vim
│       │   │           │   │   │   │   ├── xo.vim
│       │   │           │   │   │   │   └── yapf.vim
│       │   │           │   │   │   ├── gradle
│       │   │           │   │   │   │   └── init.gradle
│       │   │           │   │   │   ├── gradle.vim
│       │   │           │   │   │   ├── handlers
│       │   │           │   │   │   │   ├── alex.vim
│       │   │           │   │   │   │   ├── cppcheck.vim
│       │   │           │   │   │   │   ├── cpplint.vim
│       │   │           │   │   │   │   ├── css.vim
│       │   │           │   │   │   │   ├── eslint.vim
│       │   │           │   │   │   │   ├── flawfinder.vim
│       │   │           │   │   │   │   ├── gawk.vim
│       │   │           │   │   │   │   ├── gcc.vim
│       │   │           │   │   │   │   ├── go.vim
│       │   │           │   │   │   │   ├── haskell.vim
│       │   │           │   │   │   │   ├── markdownlint.vim
│       │   │           │   │   │   │   ├── ols.vim
│       │   │           │   │   │   │   ├── pony.vim
│       │   │           │   │   │   │   ├── rails_best_practices.vim
│       │   │           │   │   │   │   ├── redpen.vim
│       │   │           │   │   │   │   ├── rubocop.vim
│       │   │           │   │   │   │   ├── ruby.vim
│       │   │           │   │   │   │   ├── rust.vim
│       │   │           │   │   │   │   ├── sasslint.vim
│       │   │           │   │   │   │   ├── scala.vim
│       │   │           │   │   │   │   ├── sh.vim
│       │   │           │   │   │   │   ├── sml.vim
│       │   │           │   │   │   │   ├── textlint.vim
│       │   │           │   │   │   │   ├── unix.vim
│       │   │           │   │   │   │   ├── vale.vim
│       │   │           │   │   │   │   └── writegood.vim
│       │   │           │   │   │   ├── highlight.vim
│       │   │           │   │   │   ├── history.vim
│       │   │           │   │   │   ├── hover.vim
│       │   │           │   │   │   ├── job.vim
│       │   │           │   │   │   ├── linter.vim
│       │   │           │   │   │   ├── list.vim
│       │   │           │   │   │   ├── loclist_jumping.vim
│       │   │           │   │   │   ├── lsp
│       │   │           │   │   │   │   ├── message.vim
│       │   │           │   │   │   │   ├── reset.vim
│       │   │           │   │   │   │   ├── response.vim
│       │   │           │   │   │   │   └── tsserver_message.vim
│       │   │           │   │   │   ├── lsp.vim
│       │   │           │   │   │   ├── node.vim
│       │   │           │   │   │   ├── path.vim
│       │   │           │   │   │   ├── pattern_options.vim
│       │   │           │   │   │   ├── preview.vim
│       │   │           │   │   │   ├── python.vim
│       │   │           │   │   │   ├── references.vim
│       │   │           │   │   │   ├── ruby.vim
│       │   │           │   │   │   ├── semver.vim
│       │   │           │   │   │   ├── sign.vim
│       │   │           │   │   │   ├── statusline.vim
│       │   │           │   │   │   ├── test.vim
│       │   │           │   │   │   ├── toggle.vim
│       │   │           │   │   │   ├── uri.vim
│       │   │           │   │   │   └── util.vim
│       │   │           │   │   └── ale.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── ale-asciidoc.txt
│       │   │           │   │   ├── ale-asm.txt
│       │   │           │   │   ├── ale-awk.txt
│       │   │           │   │   ├── ale-c.txt
│       │   │           │   │   ├── ale-chef.txt
│       │   │           │   │   ├── ale-clojure.txt
│       │   │           │   │   ├── ale-cmake.txt
│       │   │           │   │   ├── ale-cpp.txt
│       │   │           │   │   ├── ale-cs.txt
│       │   │           │   │   ├── ale-css.txt
│       │   │           │   │   ├── ale-cuda.txt
│       │   │           │   │   ├── ale-dart.txt
│       │   │           │   │   ├── ale-dockerfile.txt
│       │   │           │   │   ├── ale-elixir.txt
│       │   │           │   │   ├── ale-elm.txt
│       │   │           │   │   ├── ale-erlang.txt
│       │   │           │   │   ├── ale-eruby.txt
│       │   │           │   │   ├── ale-fish.txt
│       │   │           │   │   ├── ale-fortran.txt
│       │   │           │   │   ├── ale-fountain.txt
│       │   │           │   │   ├── ale-fuse.txt
│       │   │           │   │   ├── ale-gitcommit.txt
│       │   │           │   │   ├── ale-glsl.txt
│       │   │           │   │   ├── ale-go.txt
│       │   │           │   │   ├── ale-graphql.txt
│       │   │           │   │   ├── ale-handlebars.txt
│       │   │           │   │   ├── ale-haskell.txt
│       │   │           │   │   ├── ale-html.txt
│       │   │           │   │   ├── ale-idris.txt
│       │   │           │   │   ├── ale-java.txt
│       │   │           │   │   ├── ale-javascript.txt
│       │   │           │   │   ├── ale-json.txt
│       │   │           │   │   ├── ale-kotlin.txt
│       │   │           │   │   ├── ale-latex.txt
│       │   │           │   │   ├── ale-less.txt
│       │   │           │   │   ├── ale-llvm.txt
│       │   │           │   │   ├── ale-lua.txt
│       │   │           │   │   ├── ale-markdown.txt
│       │   │           │   │   ├── ale-mercury.txt
│       │   │           │   │   ├── ale-nasm.txt
│       │   │           │   │   ├── ale-nroff.txt
│       │   │           │   │   ├── ale-objc.txt
│       │   │           │   │   ├── ale-objcpp.txt
│       │   │           │   │   ├── ale-ocaml.txt
│       │   │           │   │   ├── ale-perl.txt
│       │   │           │   │   ├── ale-php.txt
│       │   │           │   │   ├── ale-po.txt
│       │   │           │   │   ├── ale-pod.txt
│       │   │           │   │   ├── ale-pony.txt
│       │   │           │   │   ├── ale-proto.txt
│       │   │           │   │   ├── ale-pug.txt
│       │   │           │   │   ├── ale-puppet.txt
│       │   │           │   │   ├── ale-python.txt
│       │   │           │   │   ├── ale-qml.txt
│       │   │           │   │   ├── ale-r.txt
│       │   │           │   │   ├── ale-reasonml.txt
│       │   │           │   │   ├── ale-restructuredtext.txt
│       │   │           │   │   ├── ale-ruby.txt
│       │   │           │   │   ├── ale-rust.txt
│       │   │           │   │   ├── ale-sass.txt
│       │   │           │   │   ├── ale-scala.txt
│       │   │           │   │   ├── ale-scss.txt
│       │   │           │   │   ├── ale-sh.txt
│       │   │           │   │   ├── ale-sml.txt
│       │   │           │   │   ├── ale-solidity.txt
│       │   │           │   │   ├── ale-spec.txt
│       │   │           │   │   ├── ale-stylus.txt
│       │   │           │   │   ├── ale-tcl.txt
│       │   │           │   │   ├── ale-terraform.txt
│       │   │           │   │   ├── ale-tex.txt
│       │   │           │   │   ├── ale-texinfo.txt
│       │   │           │   │   ├── ale-text.txt
│       │   │           │   │   ├── ale-thrift.txt
│       │   │           │   │   ├── ale-typescript.txt
│       │   │           │   │   ├── ale-verilog.txt
│       │   │           │   │   ├── ale-vim-help.txt
│       │   │           │   │   ├── ale-vim.txt
│       │   │           │   │   ├── ale-vue.txt
│       │   │           │   │   ├── ale-xhtml.txt
│       │   │           │   │   ├── ale-xml.txt
│       │   │           │   │   ├── ale-yaml.txt
│       │   │           │   │   ├── ale.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── ftplugin
│       │   │           │   │   ├── ale-fix-suggest.vim
│       │   │           │   │   ├── ale-preview-selection.vim
│       │   │           │   │   └── ale-preview.vim
│       │   │           │   ├── img
│       │   │           │   │   ├── echo.png
│       │   │           │   │   ├── example.gif
│       │   │           │   │   ├── issues.png
│       │   │           │   │   ├── logo.jpg
│       │   │           │   │   └── no_issues.png
│       │   │           │   ├── plugin
│       │   │           │   │   └── ale.vim
│       │   │           │   ├── run-tests
│       │   │           │   ├── run-tests.bat
│       │   │           │   ├── syntax
│       │   │           │   │   ├── ale-fix-suggest.vim
│       │   │           │   │   └── ale-preview-selection.vim
│       │   │           │   └── test
│       │   │           │       ├── command_callback
│       │   │           │       │   ├── c_paths
│       │   │           │       │   │   └── dummy.c
│       │   │           │       │   ├── cargo_paths
│       │   │           │       │   │   └── Cargo.toml
│       │   │           │       │   ├── cppcheck_paths
│       │   │           │       │   │   └── one
│       │   │           │       │   │       ├── compile_commands.json
│       │   │           │       │   │       └── two
│       │   │           │       │   │           └── three
│       │   │           │       │   │               ├── file.c
│       │   │           │       │   │               └── file.cpp
│       │   │           │       │   ├── dart_paths
│       │   │           │       │   ├── htmlhint_paths
│       │   │           │       │   │   ├── node_modules
│       │   │           │       │   │   └── with_config
│       │   │           │       │   ├── java_paths
│       │   │           │       │   │   └── src
│       │   │           │       │   │       ├── main
│       │   │           │       │   │       │   └── java
│       │   │           │       │   │       │       └── com
│       │   │           │       │   │       │           └── something
│       │   │           │       │   │       │               └── dummy
│       │   │           │       │   │       └── test
│       │   │           │       │   │           └── java
│       │   │           │       │   │               └── com
│       │   │           │       │   │                   └── something
│       │   │           │       │   │                       └── dummy
│       │   │           │       │   ├── java_paths_with_jaxb
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── main
│       │   │           │       │   │           ├── java
│       │   │           │       │   │           │   └── com
│       │   │           │       │   │           │       └── something
│       │   │           │       │   │           │           └── dummy
│       │   │           │       │   │           └── jaxb
│       │   │           │       │   │               └── com
│       │   │           │       │   │                   └── something
│       │   │           │       │   │                       └── dummy
│       │   │           │       │   ├── lessc_paths
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── ols_paths
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── php-langserver-project
│       │   │           │       │   │   └── vendor
│       │   │           │       │   │       └── bin
│       │   │           │       │   │           └── php-language-server.php
│       │   │           │       │   ├── php_paths
│       │   │           │       │   │   ├── project-with-php-cs-fixer
│       │   │           │       │   │   │   ├── test.php
│       │   │           │       │   │   │   └── vendor
│       │   │           │       │   │   │       └── bin
│       │   │           │       │   │   │           └── php-cs-fixer
│       │   │           │       │   │   ├── project-with-phpcbf
│       │   │           │       │   │   │   ├── foo
│       │   │           │       │   │   │   │   └── test.php
│       │   │           │       │   │   │   └── vendor
│       │   │           │       │   │   │       └── bin
│       │   │           │       │   │   │           └── phpcbf
│       │   │           │       │   │   ├── project-without-php-cs-fixer
│       │   │           │       │   │   │   └── test.php
│       │   │           │       │   │   └── project-without-phpcbf
│       │   │           │       │   │       └── foo
│       │   │           │       │   │           └── test.php
│       │   │           │       │   ├── puglint_project
│       │   │           │       │   │   ├── node_modules
│       │   │           │       │   │   ├── package.json
│       │   │           │       │   │   ├── puglint_rc_dir
│       │   │           │       │   │   ├── puglint_rc_js_dir
│       │   │           │       │   │   └── puglint_rc_json_dir
│       │   │           │       │   ├── puppet_paths
│       │   │           │       │   │   └── dummy.pp
│       │   │           │       │   ├── python_paths
│       │   │           │       │   │   ├── namespace_package_manifest
│       │   │           │       │   │   │   ├── MANIFEST.in
│       │   │           │       │   │   │   └── namespace
│       │   │           │       │   │   │       └── foo
│       │   │           │       │   │   │           ├── __init__.py
│       │   │           │       │   │   │           └── bar.py
│       │   │           │       │   │   ├── namespace_package_pytest
│       │   │           │       │   │   │   ├── namespace
│       │   │           │       │   │   │   │   └── foo
│       │   │           │       │   │   │   │       ├── __init__.py
│       │   │           │       │   │   │   │       └── bar.py
│       │   │           │       │   │   │   └── pytest.ini
│       │   │           │       │   │   ├── namespace_package_setup
│       │   │           │       │   │   │   ├── namespace
│       │   │           │       │   │   │   │   └── foo
│       │   │           │       │   │   │   │       ├── __init__.py
│       │   │           │       │   │   │   │       └── bar.py
│       │   │           │       │   │   │   └── setup.cfg
│       │   │           │       │   │   ├── namespace_package_tox
│       │   │           │       │   │   │   ├── namespace
│       │   │           │       │   │   │   │   └── foo
│       │   │           │       │   │   │   │       ├── __init__.py
│       │   │           │       │   │   │   │       └── bar.py
│       │   │           │       │   │   │   └── tox.ini
│       │   │           │       │   │   ├── no_virtualenv
│       │   │           │       │   │   │   └── subdir
│       │   │           │       │   │   │       └── foo
│       │   │           │       │   │   │           ├── COMMIT_EDITMSG
│       │   │           │       │   │   │           ├── __init__.py
│       │   │           │       │   │   │           └── bar.py
│       │   │           │       │   │   └── with_virtualenv
│       │   │           │       │   │       ├── dir_with_yapf_config
│       │   │           │       │   │       ├── env
│       │   │           │       │   │       │   ├── Scripts
│       │   │           │       │   │       │   │   ├── activate
│       │   │           │       │   │       │   │   ├── autopep8.exe
│       │   │           │       │   │       │   │   ├── black.exe
│       │   │           │       │   │       │   │   ├── flake8.exe
│       │   │           │       │   │       │   │   ├── gitlint.exe
│       │   │           │       │   │       │   │   ├── isort.exe
│       │   │           │       │   │       │   │   ├── mypy.exe
│       │   │           │       │   │       │   │   ├── pyflakes.exe
│       │   │           │       │   │       │   │   ├── pylint.exe
│       │   │           │       │   │       │   │   ├── pyls.exe
│       │   │           │       │   │       │   │   └── yapf.exe
│       │   │           │       │   │       │   └── bin
│       │   │           │       │   │       │       ├── activate
│       │   │           │       │   │       │       ├── autopep8
│       │   │           │       │   │       │       ├── black
│       │   │           │       │   │       │       ├── flake8
│       │   │           │       │   │       │       ├── gitlint
│       │   │           │       │   │       │       ├── isort
│       │   │           │       │   │       │       ├── mypy
│       │   │           │       │   │       │       ├── pyflakes
│       │   │           │       │   │       │       ├── pylint
│       │   │           │       │   │       │       ├── pyls
│       │   │           │       │   │       │       └── yapf
│       │   │           │       │   │       └── subdir
│       │   │           │       │   │           └── foo
│       │   │           │       │   │               ├── COMMIT_EDITMSG
│       │   │           │       │   │               ├── __init__.py
│       │   │           │       │   │               └── bar.py
│       │   │           │       │   ├── ruby_paths
│       │   │           │       │   │   ├── dummy.rb
│       │   │           │       │   │   └── with_config
│       │   │           │       │   ├── rust-rls-project
│       │   │           │       │   │   └── Cargo.toml
│       │   │           │       │   ├── scala_paths
│       │   │           │       │   │   └── dummy.scala
│       │   │           │       │   ├── standard-test-files
│       │   │           │       │   │   ├── with-bin
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   └── with-cmd
│       │   │           │       │   │       └── node_modules
│       │   │           │       │   │           └── standard
│       │   │           │       │   │               └── bin
│       │   │           │       │   │                   └── cmd.js
│       │   │           │       │   ├── stylelint_paths
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── swaglint_paths
│       │   │           │       │   │   ├── docs
│       │   │           │       │   │   │   └── swagger.yaml
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── swift_paths
│       │   │           │       │   │   └── dummy.swift
│       │   │           │       │   ├── test_asm_gcc_command_callbacks.vader
│       │   │           │       │   ├── test_brakeman_command_callback.vader
│       │   │           │       │   ├── test_c_clang_command_callbacks.vader
│       │   │           │       │   ├── test_c_clang_tidy_command_callback.vader
│       │   │           │       │   ├── test_c_cppcheck_command_callbacks.vader
│       │   │           │       │   ├── test_c_flawfinder_command_callbacks.vader
│       │   │           │       │   ├── test_c_gcc_command_callbacks.vader
│       │   │           │       │   ├── test_cargo_command_callbacks.vader
│       │   │           │       │   ├── test_clang_tidy_command_callback.vader
│       │   │           │       │   ├── test_cpp_clang_command_callbacks.vader
│       │   │           │       │   ├── test_cpp_clangcheck_command_callbacks.vader
│       │   │           │       │   ├── test_cpp_cppcheck_command_callbacks.vader
│       │   │           │       │   ├── test_cpp_cquery_command_callbacks.vader
│       │   │           │       │   ├── test_cpp_flawfinder_command_callbacks.vader
│       │   │           │       │   ├── test_cpp_gcc_command_callbacks.vader
│       │   │           │       │   ├── test_cpplint_command_callbacks.vader
│       │   │           │       │   ├── test_cs_mcs_command_callbacks.vader
│       │   │           │       │   ├── test_cs_mcsc_command_callbacks.vader
│       │   │           │       │   ├── test_cucumber_command_callback.vader
│       │   │           │       │   ├── test_cuda_nvcc_command_callbacks.vader
│       │   │           │       │   ├── test_dartanalyzer_command_callback.vader
│       │   │           │       │   ├── test_erb_command_callback.vader
│       │   │           │       │   ├── test_erlang_syntaxerl_command_callback.vader
│       │   │           │       │   ├── test_erubi_command_callback.vader
│       │   │           │       │   ├── test_erubis_command_callback.vader
│       │   │           │       │   ├── test_flake8_command_callback.vader
│       │   │           │       │   ├── test_foodcritic_command_callback.vader
│       │   │           │       │   ├── test_fsc_command_callback.vader
│       │   │           │       │   ├── test_fusionlint_command_callback.vader
│       │   │           │       │   ├── test_gawk_command_callback.vader
│       │   │           │       │   ├── test_gfortran_command_callback.vader
│       │   │           │       │   ├── test_gitlint_command_callback.vader
│       │   │           │       │   ├── test_glslang_command_callback.vader
│       │   │           │       │   ├── test_glslls_command_callback.vader
│       │   │           │       │   ├── test_gobuild_command_callback.vader
│       │   │           │       │   ├── test_gometalinter_command_callback.vader
│       │   │           │       │   ├── test_gosimple_command_callback.vader
│       │   │           │       │   ├── test_gotype_command_callback.vader
│       │   │           │       │   ├── test_govet_command_callback.vader
│       │   │           │       │   ├── test_haml_hamllint_command_callback.vader
│       │   │           │       │   ├── test_haskell_ghc_command_callbacks.vader
│       │   │           │       │   ├── test_haskell_hdevtools_command_callbacks.vader
│       │   │           │       │   ├── test_htmlhint_command_callback.vader
│       │   │           │       │   ├── test_idris_command_callbacks.vader
│       │   │           │       │   ├── test_iverilog_command_callback.vader
│       │   │           │       │   ├── test_javac_command_callback.vader
│       │   │           │       │   ├── test_jscs_command_callback.vader
│       │   │           │       │   ├── test_less_stylelint_command_callback.vader
│       │   │           │       │   ├── test_lessc_command_callback.vader
│       │   │           │       │   ├── test_lintr_command_callback.vader
│       │   │           │       │   ├── test_llc_command_callback.vader
│       │   │           │       │   ├── test_luac_command_callback.vader
│       │   │           │       │   ├── test_luacheck_command_callback.vader
│       │   │           │       │   ├── test_markdown_mdl_command_callback.vader
│       │   │           │       │   ├── test_mercury_mmc_command_callback.vader
│       │   │           │       │   ├── test_mypy_command_callback.vader
│       │   │           │       │   ├── test_nagelfar_command_callbacks.vader
│       │   │           │       │   ├── test_nasm_nasm_command_callbacks.vader
│       │   │           │       │   ├── test_ocaml_ols_callbacks.vader
│       │   │           │       │   ├── test_perl_command_callback.vader
│       │   │           │       │   ├── test_perlcritic_command_callback.vader
│       │   │           │       │   ├── test_php_langserver_callbacks.vader
│       │   │           │       │   ├── test_phpmd_command_callbacks.vader
│       │   │           │       │   ├── test_phpstan_command_callbacks.vader
│       │   │           │       │   ├── test_pony_ponyc_command_callbacks.vader
│       │   │           │       │   ├── test_prospector_command_callback.vader
│       │   │           │       │   ├── test_proto_command_callback.vader
│       │   │           │       │   ├── test_puglint_command_callback.vader
│       │   │           │       │   ├── test_pycodestyle_command_callback.vader
│       │   │           │       │   ├── test_pyflakes_command_callback.vader
│       │   │           │       │   ├── test_pylint_command_callback.vader
│       │   │           │       │   ├── test_pyls_command_callback.vader
│       │   │           │       │   ├── test_qmlfmt_command_callback.vader
│       │   │           │       │   ├── test_rails_best_practices_command_callback.vader
│       │   │           │       │   ├── test_reason_ols_callbacks.vader
│       │   │           │       │   ├── test_rubocop_command_callback.vader
│       │   │           │       │   ├── test_ruby_command_callback.vader
│       │   │           │       │   ├── test_rust_rls_callbacks.vader
│       │   │           │       │   ├── test_rustc_command_callback.vader
│       │   │           │       │   ├── test_sasslint_command_callback.vader
│       │   │           │       │   ├── test_scalac_command_callback.vader
│       │   │           │       │   ├── test_scalastyle_command_callback.vader
│       │   │           │       │   ├── test_shellcheck_command_callback.vader
│       │   │           │       │   ├── test_slimlint_command_callback.vader
│       │   │           │       │   ├── test_standard_command_callback.vader
│       │   │           │       │   ├── test_staticcheck_command_callback.vader
│       │   │           │       │   ├── test_swaglint_command_callback.vader
│       │   │           │       │   ├── test_terraform_tflint_command_callback.vader
│       │   │           │       │   ├── test_textlint_command_callbacks.vader
│       │   │           │       │   ├── test_thrift_command_callback.vader
│       │   │           │       │   ├── test_tslint_command_callback.vader
│       │   │           │       │   ├── test_vint_command_callback.vader
│       │   │           │       │   ├── test_write_good_command_callback.vader
│       │   │           │       │   ├── test_xmllint_command_callback.vader
│       │   │           │       │   ├── textlint_paths
│       │   │           │       │   │   ├── with_bin_path
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   └── with_textlint_bin_path
│       │   │           │       │   │       └── node_modules
│       │   │           │       │   │           └── textlint
│       │   │           │       │   │               └── bin
│       │   │           │       │   │                   └── textlint.js
│       │   │           │       │   ├── write-good-node-modules
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   └── write-good-node-modules-2
│       │   │           │       │       └── node_modules
│       │   │           │       │           └── write-good
│       │   │           │       │               └── bin
│       │   │           │       │                   └── write-good.js
│       │   │           │       ├── completion
│       │   │           │       │   ├── test_completion_events.vader
│       │   │           │       │   ├── test_completion_filtering.vader
│       │   │           │       │   ├── test_completion_prefixes.vader
│       │   │           │       │   ├── test_lsp_completion_messages.vader
│       │   │           │       │   ├── test_lsp_completion_parsing.vader
│       │   │           │       │   └── test_tsserver_completion_parsing.vader
│       │   │           │       ├── csslint-test-files
│       │   │           │       │   ├── other-app
│       │   │           │       │   │   └── testfile.css
│       │   │           │       │   └── some-app
│       │   │           │       │       └── subdir
│       │   │           │       │           └── testfile.css
│       │   │           │       ├── cucumber_fixtures
│       │   │           │       │   └── features
│       │   │           │       │       ├── cuke.feature
│       │   │           │       │       └── step_definitions
│       │   │           │       │           └── base_steps.rb
│       │   │           │       ├── elixir-test-files
│       │   │           │       │   └── testfile.ex
│       │   │           │       ├── elm-test-files
│       │   │           │       │   ├── app
│       │   │           │       │   │   ├── filetest.elm
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── node_modules
│       │   │           │       │   └── src
│       │   │           │       │       └── subdir
│       │   │           │       │           └── testfile.elm
│       │   │           │       ├── eslint-test-files
│       │   │           │       │   ├── app-with-eslint-d
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   ├── node_modules
│       │   │           │       │   ├── other-app
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── testfile.js
│       │   │           │       │   ├── package.json
│       │   │           │       │   └── react-app
│       │   │           │       │       ├── node_modules
│       │   │           │       │       │   ├── eslint
│       │   │           │       │       │   │   └── bin
│       │   │           │       │       │   │       └── eslint.js
│       │   │           │       │       │   ├── standard
│       │   │           │       │       │   │   └── bin
│       │   │           │       │       │   │       └── cmd.js
│       │   │           │       │       │   └── stylelint
│       │   │           │       │       │       └── bin
│       │   │           │       │       │           └── stylelint.js
│       │   │           │       │       ├── subdir
│       │   │           │       │       │   ├── testfile.css
│       │   │           │       │       │   └── testfile.js
│       │   │           │       │       ├── subdir-with-config
│       │   │           │       │       └── subdir-with-package-json
│       │   │           │       │           └── package.json
│       │   │           │       ├── fix
│       │   │           │       │   ├── test_ale_fix.vader
│       │   │           │       │   ├── test_ale_fix_aliases.vader
│       │   │           │       │   ├── test_ale_fix_completion.vader
│       │   │           │       │   ├── test_ale_fix_completion_filter.vader
│       │   │           │       │   └── test_ale_fix_suggest.vader
│       │   │           │       ├── fixers
│       │   │           │       │   ├── eslint-test-files
│       │   │           │       │   │   ├── app-with-eslint-d
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   ├── node_modules
│       │   │           │       │   │   ├── other-app
│       │   │           │       │   │   │   └── subdir
│       │   │           │       │   │   │       └── testfile.js
│       │   │           │       │   │   └── react-app
│       │   │           │       │   │       ├── node_modules
│       │   │           │       │   │       │   ├── eslint
│       │   │           │       │   │       │   │   └── bin
│       │   │           │       │   │       │   │       └── eslint.js
│       │   │           │       │   │       │   ├── standard
│       │   │           │       │   │       │   │   └── bin
│       │   │           │       │   │       │   │       └── cmd.js
│       │   │           │       │   │       │   └── stylelint
│       │   │           │       │   │       │       └── bin
│       │   │           │       │   │       │           └── stylelint.js
│       │   │           │       │   │       └── subdir
│       │   │           │       │   │           ├── testfile.css
│       │   │           │       │   │           └── testfile.js
│       │   │           │       │   ├── long-line-project
│       │   │           │       │   │   └── setup.cfg
│       │   │           │       │   ├── test_autopep8_fixer_callback.vader
│       │   │           │       │   ├── test_black_fixer_callback.vader
│       │   │           │       │   ├── test_break_up_long_lines_python_fixer.vader
│       │   │           │       │   ├── test_brittany_fixer_callback.vader
│       │   │           │       │   ├── test_clangformat_fixer_callback.vader
│       │   │           │       │   ├── test_elm_format_fixer_callback.vader
│       │   │           │       │   ├── test_eslint_fixer_callback.vader
│       │   │           │       │   ├── test_fixjson_fixer_callback.vader
│       │   │           │       │   ├── test_gofmt_fixer_callback.vader
│       │   │           │       │   ├── test_goimports_fixer_callback.vader
│       │   │           │       │   ├── test_goofle_java_format_fixer_callback.vader
│       │   │           │       │   ├── test_hackfmt_fixer_callback.vader
│       │   │           │       │   ├── test_hfmt_fixer_callback.vader
│       │   │           │       │   ├── test_importjs_fixer_callback.vader
│       │   │           │       │   ├── test_isort_fixer_callback.vader
│       │   │           │       │   ├── test_jq_fixer_callback.vader
│       │   │           │       │   ├── test_mix_format_fixer_callback.vader
│       │   │           │       │   ├── test_perltidy_fixer_callback.vader
│       │   │           │       │   ├── test_php_cs_fixer.vader
│       │   │           │       │   ├── test_phpcbf_fixer_callback.vader
│       │   │           │       │   ├── test_prettier_eslint_fixer.callback.vader
│       │   │           │       │   ├── test_prettier_fixer_callback.vader
│       │   │           │       │   ├── test_puppetlint_fixer_callback.vader
│       │   │           │       │   ├── test_python_add_blank_lines_fixer.vader
│       │   │           │       │   ├── test_refmt_fixer_callback.vader
│       │   │           │       │   ├── test_rubocop_fixer_callback.vader
│       │   │           │       │   ├── test_rufo_fixer_callback.vader
│       │   │           │       │   ├── test_rustfmt_fixer_callback.vader
│       │   │           │       │   ├── test_scalafmt_fixer_callback.vader
│       │   │           │       │   ├── test_shfmt_fixer_callback.vader
│       │   │           │       │   ├── test_standard_fixer_callback.vader
│       │   │           │       │   ├── test_stylelint_fixer_callback.vader
│       │   │           │       │   ├── test_swiftformat_fixer_callback.vader
│       │   │           │       │   ├── test_trim_whitespace.vader
│       │   │           │       │   ├── test_tslint_fixer_callback.vader
│       │   │           │       │   ├── test_vim_help_tags_alignment_fixer.vader
│       │   │           │       │   └── test_yapf_fixer_callback.vader
│       │   │           │       ├── flow
│       │   │           │       │   ├── a
│       │   │           │       │   │   └── sub
│       │   │           │       │   │       └── dummy
│       │   │           │       │   └── b
│       │   │           │       │       └── sub
│       │   │           │       │           └── dummy
│       │   │           │       ├── go_files
│       │   │           │       │   ├── testfile.go
│       │   │           │       │   └── testfile2.go
│       │   │           │       ├── gradle-test-files
│       │   │           │       │   ├── build-gradle-project
│       │   │           │       │   │   ├── build.gradle
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── main
│       │   │           │       │   │           └── kotlin
│       │   │           │       │   │               └── dummy.kt
│       │   │           │       │   ├── gradle
│       │   │           │       │   ├── non-gradle-project
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── main
│       │   │           │       │   │           └── kotlin
│       │   │           │       │   │               └── dummy.kt
│       │   │           │       │   ├── settings-gradle-project
│       │   │           │       │   │   ├── settings.gradle
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── main
│       │   │           │       │   │           └── kotlin
│       │   │           │       │   │               └── dummy.kt
│       │   │           │       │   ├── unwrapped-project
│       │   │           │       │   │   ├── build.gradle
│       │   │           │       │   │   ├── settings.gradle
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── main
│       │   │           │       │   │           └── kotlin
│       │   │           │       │   │               └── dummy.kt
│       │   │           │       │   └── wrapped-project
│       │   │           │       │       ├── build.gradle
│       │   │           │       │       ├── gradlew
│       │   │           │       │       ├── settings.gradle
│       │   │           │       │       └── src
│       │   │           │       │           └── main
│       │   │           │       │               └── kotlin
│       │   │           │       │                   └── dummy.kt
│       │   │           │       ├── hack_files
│       │   │           │       │   └── testfile.php
│       │   │           │       ├── hamllint-test-files
│       │   │           │       │   ├── haml-lint-and-rubocop
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── file.haml
│       │   │           │       │   ├── haml-lint-yml
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── file.haml
│       │   │           │       │   └── rubocop-yml
│       │   │           │       │       └── subdir
│       │   │           │       │           └── file.haml
│       │   │           │       ├── handler
│       │   │           │       │   ├── test_alex_handler.vader
│       │   │           │       │   ├── test_ansible_lint_handler.vader
│       │   │           │       │   ├── test_asm_handler.vader
│       │   │           │       │   ├── test_brakeman_handler.vader
│       │   │           │       │   ├── test_checkmake_handler.vader
│       │   │           │       │   ├── test_checkstyle_handler.vader
│       │   │           │       │   ├── test_clang_handler.vader
│       │   │           │       │   ├── test_clojure_joker_handler.vader
│       │   │           │       │   ├── test_coffeelint_handler.vader
│       │   │           │       │   ├── test_common_handlers.vader
│       │   │           │       │   ├── test_cppcheck_handler.vader
│       │   │           │       │   ├── test_cpplint_handler.vader
│       │   │           │       │   ├── test_credo_handler.vader
│       │   │           │       │   ├── test_crystal_handler.vader
│       │   │           │       │   ├── test_cucumber_handler.vader
│       │   │           │       │   ├── test_cuda_nvcc_handler.vader
│       │   │           │       │   ├── test_dafny_handler.vader
│       │   │           │       │   ├── test_dartanalyzer_handler.vader
│       │   │           │       │   ├── test_dogma_handler.vader
│       │   │           │       │   ├── test_drafter_handler.vader
│       │   │           │       │   ├── test_elmmake_handler.vader
│       │   │           │       │   ├── test_embertemplatelint_handler.vader
│       │   │           │       │   ├── test_eslint_handler.vader
│       │   │           │       │   ├── test_fish_handler.vader
│       │   │           │       │   ├── test_flake8_handler.vader
│       │   │           │       │   ├── test_flawfinder_handler.vader
│       │   │           │       │   ├── test_flow_handler.vader
│       │   │           │       │   ├── test_foodcritic_handler.vader
│       │   │           │       │   ├── test_fortran_handler.vader
│       │   │           │       │   ├── test_gawk_handler.vader
│       │   │           │       │   ├── test_gcc_handler.vader
│       │   │           │       │   ├── test_ghc_handler.vader
│       │   │           │       │   ├── test_ghc_mod_handler.vader
│       │   │           │       │   ├── test_gitlint_handler.vader
│       │   │           │       │   ├── test_glslang_handler.vader
│       │   │           │       │   ├── test_go_generic_handler.vader
│       │   │           │       │   ├── test_gobuild_handler.vader
│       │   │           │       │   ├── test_gometalinter_handler.vader
│       │   │           │       │   ├── test_hlint_handler.vader
│       │   │           │       │   ├── test_idris_handler.vader
│       │   │           │       │   ├── test_javac_handler.vader
│       │   │           │       │   ├── test_jscs_handler.vader
│       │   │           │       │   ├── test_lessc_handler.vader
│       │   │           │       │   ├── test_llc_handler.vader
│       │   │           │       │   ├── test_luac_handler.vader
│       │   │           │       │   ├── test_luacheck_handler.vader
│       │   │           │       │   ├── test_markdownlint_handler.vader
│       │   │           │       │   ├── test_mcs_handler.vader
│       │   │           │       │   ├── test_mcsc_handler.vader
│       │   │           │       │   ├── test_mercury_mmc_handler.vader
│       │   │           │       │   ├── test_msgfmt_hander.vader
│       │   │           │       │   ├── test_mypy_handler.vader
│       │   │           │       │   ├── test_nagelfar_handler.vader
│       │   │           │       │   ├── test_nasm_handler.vader
│       │   │           │       │   ├── test_nim_handler.vader
│       │   │           │       │   ├── test_nix_handler.vader
│       │   │           │       │   ├── test_perl_handler.vader
│       │   │           │       │   ├── test_perlcritic_handler.vader
│       │   │           │       │   ├── test_php_handler.vader
│       │   │           │       │   ├── test_php_phan_handler.vader
│       │   │           │       │   ├── test_php_phpmd_handler.vader
│       │   │           │       │   ├── test_phpstan_handler.vader
│       │   │           │       │   ├── test_pmd_handler.vader
│       │   │           │       │   ├── test_pony_handler.vader
│       │   │           │       │   ├── test_prospector_handler.vader
│       │   │           │       │   ├── test_puppet_handler.vader
│       │   │           │       │   ├── test_pycodestyle_handler.vader
│       │   │           │       │   ├── test_pyflakes_handler.vader
│       │   │           │       │   ├── test_pylint_handler.vader
│       │   │           │       │   ├── test_qmlfmt_handler.vader
│       │   │           │       │   ├── test_qmllint_handler.vader
│       │   │           │       │   ├── test_rails_best_practices_handler.vader
│       │   │           │       │   ├── test_redpen_handler.vader
│       │   │           │       │   ├── test_reek_handler.vader
│       │   │           │       │   ├── test_remark_lint_handler.vader
│       │   │           │       │   ├── test_rpmlint_handler.vader
│       │   │           │       │   ├── test_rstcheck_lint_handler.vader
│       │   │           │       │   ├── test_rubocop_handler.vader
│       │   │           │       │   ├── test_ruby_handler.vader
│       │   │           │       │   ├── test_rust_handler.vader
│       │   │           │       │   ├── test_scala_handler.vader
│       │   │           │       │   ├── test_scalastyle_handler.vader
│       │   │           │       │   ├── test_shell_handler.vader
│       │   │           │       │   ├── test_shellcheck_handler.vader
│       │   │           │       │   ├── test_slim_handler.vader
│       │   │           │       │   ├── test_sml_handler.vader
│       │   │           │       │   ├── test_solhint_handler.vader
│       │   │           │       │   ├── test_sqlint_handler.vader
│       │   │           │       │   ├── test_standard_handler.vader
│       │   │           │       │   ├── test_stylelint_handler.vader
│       │   │           │       │   ├── test_swaglint_handler.vader
│       │   │           │       │   ├── test_swiftlint_handler.vader
│       │   │           │       │   ├── test_syntaxerl_handler.vader
│       │   │           │       │   ├── test_textlint_handler.vader
│       │   │           │       │   ├── test_tflint_handler.vader
│       │   │           │       │   ├── test_thrift_handler.vader
│       │   │           │       │   ├── test_tslint_handler.vader
│       │   │           │       │   ├── test_typecheck_handler.vader
│       │   │           │       │   ├── test_vale_handler.vader
│       │   │           │       │   ├── test_vint_handler.vader
│       │   │           │       │   ├── test_write_good_handler.vader
│       │   │           │       │   └── test_xmllint_handler.vader
│       │   │           │       ├── javascript_files
│       │   │           │       │   └── test.js
│       │   │           │       ├── json_files
│       │   │           │       │   └── testfile.json
│       │   │           │       ├── lsp
│       │   │           │       │   ├── test_did_save_event.vader
│       │   │           │       │   ├── test_lsp_client_messages.vader
│       │   │           │       │   ├── test_lsp_connections.vader
│       │   │           │       │   ├── test_lsp_error_parsing.vader
│       │   │           │       │   ├── test_other_initialize_message_handling.vader
│       │   │           │       │   ├── test_read_lsp_diagnostics.vader
│       │   │           │       │   └── test_reset_lsp.vader
│       │   │           │       ├── phpcs-test-files
│       │   │           │       │   ├── project-with-phpcs
│       │   │           │       │   │   ├── foo
│       │   │           │       │   │   │   └── test.php
│       │   │           │       │   │   └── vendor
│       │   │           │       │   │       └── bin
│       │   │           │       │   │           └── phpcs
│       │   │           │       │   └── project-without-phpcs
│       │   │           │       │       └── foo
│       │   │           │       │           └── test.php
│       │   │           │       ├── prettier-test-files
│       │   │           │       │   ├── testfile.css
│       │   │           │       │   ├── testfile.js
│       │   │           │       │   ├── testfile.json
│       │   │           │       │   ├── testfile.scss
│       │   │           │       │   ├── testfile.ts
│       │   │           │       │   └── with_config
│       │   │           │       │       └── testfile.js
│       │   │           │       ├── reasonml_files
│       │   │           │       │   └── testfile.re
│       │   │           │       ├── ruby_fixtures
│       │   │           │       │   ├── not_a_rails_app
│       │   │           │       │   │   └── file.rb
│       │   │           │       │   └── valid_rails_app
│       │   │           │       │       ├── app
│       │   │           │       │       │   ├── dummy.rb
│       │   │           │       │       │   ├── models
│       │   │           │       │       │   │   └── thing.rb
│       │   │           │       │       │   └── views
│       │   │           │       │       │       └── my_great_view.html.erb
│       │   │           │       │       ├── config
│       │   │           │       │       │   └── dummy.rb
│       │   │           │       │       └── db
│       │   │           │       │           └── dummy.rb
│       │   │           │       ├── rust_files
│       │   │           │       │   └── testfile.rs
│       │   │           │       ├── script
│       │   │           │       │   ├── check-supported-tools-tables
│       │   │           │       │   ├── check-toc
│       │   │           │       │   ├── custom-checks
│       │   │           │       │   ├── custom-linting-rules
│       │   │           │       │   ├── run-vader-tests
│       │   │           │       │   └── run-vint
│       │   │           │       ├── sign
│       │   │           │       │   ├── test_linting_sets_signs.vader
│       │   │           │       │   ├── test_sign_column_highlighting.vader
│       │   │           │       │   ├── test_sign_limits.vader
│       │   │           │       │   ├── test_sign_parsing.vader
│       │   │           │       │   └── test_sign_placement.vader
│       │   │           │       ├── slimlint-test-files
│       │   │           │       │   └── subdir
│       │   │           │       │       └── file.slim
│       │   │           │       ├── smlnj
│       │   │           │       │   ├── cm
│       │   │           │       │   │   ├── foo.sml
│       │   │           │       │   │   ├── path
│       │   │           │       │   │   │   └── to
│       │   │           │       │   │   │       └── bar.sml
│       │   │           │       │   │   └── sources.cm
│       │   │           │       │   └── file
│       │   │           │       │       └── qux.sml
│       │   │           │       ├── smoke_test.vader
│       │   │           │       ├── test_ale_info.vader
│       │   │           │       ├── test_ale_lint_command.vader
│       │   │           │       ├── test_ale_toggle.vader
│       │   │           │       ├── test_ale_var.vader
│       │   │           │       ├── test_alejobstarted_autocmd.vader
│       │   │           │       ├── test_alelint_autocmd.vader
│       │   │           │       ├── test_autocmd_commands.vader
│       │   │           │       ├── test_backwards_compatibility.vader
│       │   │           │       ├── test_balloon_messages.vader
│       │   │           │       ├── test_c_import_paths.vader
│       │   │           │       ├── test_c_parse_makefile.vader
│       │   │           │       ├── test_c_projects
│       │   │           │       │   ├── build
│       │   │           │       │   │   ├── bad_folder_to_test_priority
│       │   │           │       │   │   └── compile_commands.json
│       │   │           │       │   ├── configure_project
│       │   │           │       │   │   ├── Makefile
│       │   │           │       │   │   ├── configure
│       │   │           │       │   │   ├── include
│       │   │           │       │   │   │   └── test.h
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── Makefile
│       │   │           │       │   ├── git_and_nested_makefiles
│       │   │           │       │   │   ├── include
│       │   │           │       │   │   │   └── test.h
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── Makefile
│       │   │           │       │   ├── h_file_project
│       │   │           │       │   │   ├── Makefile
│       │   │           │       │   │   ├── subdir
│       │   │           │       │   │   │   └── dummy
│       │   │           │       │   │   └── test.h
│       │   │           │       │   ├── hpp_file_project
│       │   │           │       │   │   ├── Makefile
│       │   │           │       │   │   ├── subdir
│       │   │           │       │   │   │   └── dummy
│       │   │           │       │   │   └── test.hpp
│       │   │           │       │   ├── json_project
│       │   │           │       │   │   ├── build
│       │   │           │       │   │   │   └── compile_commands.json
│       │   │           │       │   │   ├── include
│       │   │           │       │   │   │   └── test.h
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── dummy
│       │   │           │       │   └── makefile_project
│       │   │           │       │       ├── Makefile
│       │   │           │       │       ├── include
│       │   │           │       │       │   └── test.h
│       │   │           │       │       └── subdir
│       │   │           │       │           ├── dummy
│       │   │           │       │           └── file.c
│       │   │           │       ├── test_checkingbuffer_autocmd.vader
│       │   │           │       ├── test_cleanup.vader
│       │   │           │       ├── test_command_chain.vader
│       │   │           │       ├── test_csslint_config_detection.vader
│       │   │           │       ├── test_cursor_warnings.vader
│       │   │           │       ├── test_disabling_ale.vader
│       │   │           │       ├── test_dockerfile_hadolint_linter.vader
│       │   │           │       ├── test_elm_executable_detection.vader
│       │   │           │       ├── test_engine_invocation.vader
│       │   │           │       ├── test_engine_lsp_response_handling.vader
│       │   │           │       ├── test_errors_removed_after_filetype_changed.vader
│       │   │           │       ├── test_eslint_executable_detection.vader
│       │   │           │       ├── test_filetype_linter_defaults.vader
│       │   │           │       ├── test_filetype_mapping.vader
│       │   │           │       ├── test_find_nearest_directory.vader
│       │   │           │       ├── test_find_references.vader
│       │   │           │       ├── test_flow_command.vader
│       │   │           │       ├── test_format_command.vader
│       │   │           │       ├── test_format_temporary_file_creation.vader
│       │   │           │       ├── test_function_arg_count.vader
│       │   │           │       ├── test_fuzzy_json_decode.vader
│       │   │           │       ├── test_get_abspath.vader
│       │   │           │       ├── test_get_loclist.vader
│       │   │           │       ├── test_getmatches.vader
│       │   │           │       ├── test_go_to_definition.vader
│       │   │           │       ├── test_gradle_build_classpath_command.vader
│       │   │           │       ├── test_gradle_find_executable.vader
│       │   │           │       ├── test_gradle_find_project_root.vader
│       │   │           │       ├── test_highlight_placement.vader
│       │   │           │       ├── test_highlight_position_chunking.vader
│       │   │           │       ├── test_history_saving.vader
│       │   │           │       ├── test_hover.vader
│       │   │           │       ├── test_line_join.vader
│       │   │           │       ├── test_lint_error_delay.vader
│       │   │           │       ├── test_lint_file_linters.vader
│       │   │           │       ├── test_lint_on_enter_when_file_changed.vader
│       │   │           │       ├── test_lint_on_filetype_changed.vader
│       │   │           │       ├── test_linter_defintion_processing.vader
│       │   │           │       ├── test_linter_retrieval.vader
│       │   │           │       ├── test_linter_type_mapping.vader
│       │   │           │       ├── test_linting_blacklist.vader
│       │   │           │       ├── test_linting_updates_loclist.vader
│       │   │           │       ├── test_list_formatting.vader
│       │   │           │       ├── test_list_opening.vader
│       │   │           │       ├── test_list_titles.vader
│       │   │           │       ├── test_load_all_linters.vader
│       │   │           │       ├── test_loclist_binary_search.vader
│       │   │           │       ├── test_loclist_corrections.vader
│       │   │           │       ├── test_loclist_jumping.vader
│       │   │           │       ├── test_loclist_sorting.vader
│       │   │           │       ├── test_nearest_file_search.vader
│       │   │           │       ├── test_no_linting_on_write_quit.vader
│       │   │           │       ├── test_path_equality.vader
│       │   │           │       ├── test_path_upwards.vader
│       │   │           │       ├── test_path_uri.vader
│       │   │           │       ├── test_pattern_options.vader
│       │   │           │       ├── test_phpcs_executable_detection.vader
│       │   │           │       ├── test_phpcs_include_code.vader
│       │   │           │       ├── test_prepare_command.vader
│       │   │           │       ├── test_python_virtualenv.vader
│       │   │           │       ├── test_quickfix_deduplication.vader
│       │   │           │       ├── test_quitting_variable.vader
│       │   │           │       ├── test_regex_escaping.vader
│       │   │           │       ├── test_resolve_local_path.vader
│       │   │           │       ├── test_results_not_cleared_when_opening_loclist.vader
│       │   │           │       ├── test_sandbox_execution.vader
│       │   │           │       ├── test_semver_utils.vader
│       │   │           │       ├── test_set_list_timers.vader
│       │   │           │       ├── test_setting_loclist_from_another_buffer.vader
│       │   │           │       ├── test_setting_problems_found_in_previous_buffers.vader
│       │   │           │       ├── test_shell_detection.vader
│       │   │           │       ├── test_should_do_nothing_conditions.vader
│       │   │           │       ├── test_sml_command.vader
│       │   │           │       ├── test_statusline.vader
│       │   │           │       ├── test_temporary_file_management.vader
│       │   │           │       ├── test_tflint_config_detection.vader
│       │   │           │       ├── test_tmpdir_init.vader
│       │   │           │       ├── test_verilog_verilator_options.vader
│       │   │           │       ├── test_vim8_processid_parsing.vader
│       │   │           │       ├── test_windows_escaping.vader
│       │   │           │       ├── test_wrap_comand.vader
│       │   │           │       ├── test_writefile_function.vader
│       │   │           │       ├── tflint-test-files
│       │   │           │       │   └── foo
│       │   │           │       │       └── bar.tf
│       │   │           │       ├── top
│       │   │           │       │   ├── ale-special-directory-name-dont-use-this-please
│       │   │           │       │   │   └── empty-file
│       │   │           │       │   ├── example.ini
│       │   │           │       │   └── middle
│       │   │           │       │       └── bottom
│       │   │           │       │           └── dummy.txt
│       │   │           │       ├── util
│       │   │           │       │   └── test_cd_string_commands.vader
│       │   │           │       └── vimrc
│       │   │           ├── base16-vim
│       │   │           │   ├── LICENSE.md
│       │   │           │   ├── README.md
│       │   │           │   ├── base16-vim.png
│       │   │           │   ├── colors
│       │   │           │   │   ├── base16-3024.vim
│       │   │           │   │   ├── base16-apathy.vim
│       │   │           │   │   ├── base16-ashes.vim
│       │   │           │   │   ├── base16-atelier-cave-light.vim
│       │   │           │   │   ├── base16-atelier-cave.vim
│       │   │           │   │   ├── base16-atelier-dune-light.vim
│       │   │           │   │   ├── base16-atelier-dune.vim
│       │   │           │   │   ├── base16-atelier-estuary-light.vim
│       │   │           │   │   ├── base16-atelier-estuary.vim
│       │   │           │   │   ├── base16-atelier-forest-light.vim
│       │   │           │   │   ├── base16-atelier-forest.vim
│       │   │           │   │   ├── base16-atelier-heath-light.vim
│       │   │           │   │   ├── base16-atelier-heath.vim
│       │   │           │   │   ├── base16-atelier-lakeside-light.vim
│       │   │           │   │   ├── base16-atelier-lakeside.vim
│       │   │           │   │   ├── base16-atelier-plateau-light.vim
│       │   │           │   │   ├── base16-atelier-plateau.vim
│       │   │           │   │   ├── base16-atelier-savanna-light.vim
│       │   │           │   │   ├── base16-atelier-savanna.vim
│       │   │           │   │   ├── base16-atelier-seaside-light.vim
│       │   │           │   │   ├── base16-atelier-seaside.vim
│       │   │           │   │   ├── base16-atelier-sulphurpool-light.vim
│       │   │           │   │   ├── base16-atelier-sulphurpool.vim
│       │   │           │   │   ├── base16-bespin.vim
│       │   │           │   │   ├── base16-black-metal-bathory.vim
│       │   │           │   │   ├── base16-black-metal-burzum.vim
│       │   │           │   │   ├── base16-black-metal-dark-funeral.vim
│       │   │           │   │   ├── base16-black-metal-gorgoroth.vim
│       │   │           │   │   ├── base16-black-metal-immortal.vim
│       │   │           │   │   ├── base16-black-metal-khold.vim
│       │   │           │   │   ├── base16-black-metal-marduk.vim
│       │   │           │   │   ├── base16-black-metal-mayhem.vim
│       │   │           │   │   ├── base16-black-metal-nile.vim
│       │   │           │   │   ├── base16-black-metal-venom.vim
│       │   │           │   │   ├── base16-black-metal.vim
│       │   │           │   │   ├── base16-brewer.vim
│       │   │           │   │   ├── base16-bright.vim
│       │   │           │   │   ├── base16-brogrammer.vim
│       │   │           │   │   ├── base16-brushtrees-dark.vim
│       │   │           │   │   ├── base16-brushtrees.vim
│       │   │           │   │   ├── base16-chalk.vim
│       │   │           │   │   ├── base16-circus.vim
│       │   │           │   │   ├── base16-classic-dark.vim
│       │   │           │   │   ├── base16-classic-light.vim
│       │   │           │   │   ├── base16-codeschool.vim
│       │   │           │   │   ├── base16-cupcake.vim
│       │   │           │   │   ├── base16-cupertino.vim
│       │   │           │   │   ├── base16-darktooth.vim
│       │   │           │   │   ├── base16-default-dark.vim
│       │   │           │   │   ├── base16-default-light.vim
│       │   │           │   │   ├── base16-dracula.vim
│       │   │           │   │   ├── base16-eighties.vim
│       │   │           │   │   ├── base16-embers.vim
│       │   │           │   │   ├── base16-flat.vim
│       │   │           │   │   ├── base16-github.vim
│       │   │           │   │   ├── base16-google-dark.vim
│       │   │           │   │   ├── base16-google-light.vim
│       │   │           │   │   ├── base16-grayscale-dark.vim
│       │   │           │   │   ├── base16-grayscale-light.vim
│       │   │           │   │   ├── base16-greenscreen.vim
│       │   │           │   │   ├── base16-gruvbox-dark-hard.vim
│       │   │           │   │   ├── base16-gruvbox-dark-medium.vim
│       │   │           │   │   ├── base16-gruvbox-dark-pale.vim
│       │   │           │   │   ├── base16-gruvbox-dark-soft.vim
│       │   │           │   │   ├── base16-gruvbox-light-hard.vim
│       │   │           │   │   ├── base16-gruvbox-light-medium.vim
│       │   │           │   │   ├── base16-gruvbox-light-soft.vim
│       │   │           │   │   ├── base16-harmonic-dark.vim
│       │   │           │   │   ├── base16-harmonic-light.vim
│       │   │           │   │   ├── base16-hopscotch.vim
│       │   │           │   │   ├── base16-icy.vim
│       │   │           │   │   ├── base16-irblack.vim
│       │   │           │   │   ├── base16-isotope.vim
│       │   │           │   │   ├── base16-macintosh.vim
│       │   │           │   │   ├── base16-marrakesh.vim
│       │   │           │   │   ├── base16-materia.vim
│       │   │           │   │   ├── base16-material-darker.vim
│       │   │           │   │   ├── base16-material-lighter.vim
│       │   │           │   │   ├── base16-material-palenight.vim
│       │   │           │   │   ├── base16-material-vivid.vim
│       │   │           │   │   ├── base16-material.vim
│       │   │           │   │   ├── base16-mellow-purple.vim
│       │   │           │   │   ├── base16-mexico-light.vim
│       │   │           │   │   ├── base16-mocha.vim
│       │   │           │   │   ├── base16-monokai.vim
│       │   │           │   │   ├── base16-nord.vim
│       │   │           │   │   ├── base16-ocean.vim
│       │   │           │   │   ├── base16-oceanicnext.vim
│       │   │           │   │   ├── base16-one-light.vim
│       │   │           │   │   ├── base16-onedark.vim
│       │   │           │   │   ├── base16-outrun-dark.vim
│       │   │           │   │   ├── base16-paraiso.vim
│       │   │           │   │   ├── base16-phd.vim
│       │   │           │   │   ├── base16-pico.vim
│       │   │           │   │   ├── base16-pop.vim
│       │   │           │   │   ├── base16-porple.vim
│       │   │           │   │   ├── base16-railscasts.vim
│       │   │           │   │   ├── base16-rebecca.vim
│       │   │           │   │   ├── base16-seti.vim
│       │   │           │   │   ├── base16-shapeshifter.vim
│       │   │           │   │   ├── base16-snazzy.vim
│       │   │           │   │   ├── base16-solarflare.vim
│       │   │           │   │   ├── base16-solarized-dark.vim
│       │   │           │   │   ├── base16-solarized-light.vim
│       │   │           │   │   ├── base16-spacemacs.vim
│       │   │           │   │   ├── base16-summerfruit-dark.vim
│       │   │           │   │   ├── base16-summerfruit-light.vim
│       │   │           │   │   ├── base16-tomorrow-night.vim
│       │   │           │   │   ├── base16-tomorrow.vim
│       │   │           │   │   ├── base16-tube.vim
│       │   │           │   │   ├── base16-twilight.vim
│       │   │           │   │   ├── base16-unikitty-dark.vim
│       │   │           │   │   ├── base16-unikitty-light.vim
│       │   │           │   │   ├── base16-woodland.vim
│       │   │           │   │   ├── base16-xcode-dusk.vim
│       │   │           │   │   └── base16-zenburn.vim
│       │   │           │   ├── templates
│       │   │           │   │   ├── config.yaml
│       │   │           │   │   └── default.mustache
│       │   │           │   ├── with-base16colorspace-256-without-base16-shell.png
│       │   │           │   └── without-base16colorspace-256-with-256-terminal-theme.png
│       │   │           ├── deoplete.nvim
│       │   │           │   ├── LICENSE
│       │   │           │   ├── Makefile
│       │   │           │   ├── README.md
│       │   │           │   ├── autoload
│       │   │           │   │   ├── deoplete
│       │   │           │   │   │   ├── custom.vim
│       │   │           │   │   │   ├── handler.vim
│       │   │           │   │   │   ├── init.vim
│       │   │           │   │   │   ├── mapping.vim
│       │   │           │   │   │   ├── mappings.vim
│       │   │           │   │   │   └── util.vim
│       │   │           │   │   ├── deoplete.vim
│       │   │           │   │   └── health
│       │   │           │   │       └── deoplete.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── deoplete.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── plugin
│       │   │           │   │   └── deoplete.vim
│       │   │           │   ├── rplugin
│       │   │           │   │   └── python3
│       │   │           │   │       └── deoplete
│       │   │           │   │           ├── __init__.py
│       │   │           │   │           ├── __pycache__
│       │   │           │   │           │   ├── __init__.cpython-36.pyc
│       │   │           │   │           │   ├── child.cpython-36.pyc
│       │   │           │   │           │   ├── deoplete.cpython-36.pyc
│       │   │           │   │           │   ├── exceptions.cpython-36.pyc
│       │   │           │   │           │   ├── logger.cpython-36.pyc
│       │   │           │   │           │   ├── parent.cpython-36.pyc
│       │   │           │   │           │   ├── process.cpython-36.pyc
│       │   │           │   │           │   └── util.cpython-36.pyc
│       │   │           │   │           ├── child.py
│       │   │           │   │           ├── deoplete.py
│       │   │           │   │           ├── dp_main.py
│       │   │           │   │           ├── exceptions.py
│       │   │           │   │           ├── filter
│       │   │           │   │           │   ├── __pycache__
│       │   │           │   │           │   │   ├── base.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_auto_delimiter.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_auto_paren.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_remove_overlap.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_remove_paren.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_truncate_abbr.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_truncate_kind.cpython-36.pyc
│       │   │           │   │           │   │   ├── converter_truncate_menu.cpython-36.pyc
│       │   │           │   │           │   │   ├── matcher_cpsm.cpython-36.pyc
│       │   │           │   │           │   │   ├── matcher_full_fuzzy.cpython-36.pyc
│       │   │           │   │           │   │   ├── matcher_fuzzy.cpython-36.pyc
│       │   │           │   │           │   │   ├── matcher_head.cpython-36.pyc
│       │   │           │   │           │   │   ├── matcher_length.cpython-36.pyc
│       │   │           │   │           │   │   ├── sorter_rank.cpython-36.pyc
│       │   │           │   │           │   │   └── sorter_word.cpython-36.pyc
│       │   │           │   │           │   ├── base.py
│       │   │           │   │           │   ├── converter_auto_delimiter.py
│       │   │           │   │           │   ├── converter_auto_paren.py
│       │   │           │   │           │   ├── converter_remove_overlap.py
│       │   │           │   │           │   ├── converter_remove_paren.py
│       │   │           │   │           │   ├── converter_truncate_abbr.py
│       │   │           │   │           │   ├── converter_truncate_kind.py
│       │   │           │   │           │   ├── converter_truncate_menu.py
│       │   │           │   │           │   ├── matcher_cpsm.py
│       │   │           │   │           │   ├── matcher_full_fuzzy.py
│       │   │           │   │           │   ├── matcher_fuzzy.py
│       │   │           │   │           │   ├── matcher_head.py
│       │   │           │   │           │   ├── matcher_length.py
│       │   │           │   │           │   ├── sorter_rank.py
│       │   │           │   │           │   └── sorter_word.py
│       │   │           │   │           ├── logger.py
│       │   │           │   │           ├── parent.py
│       │   │           │   │           ├── process.py
│       │   │           │   │           ├── source
│       │   │           │   │           │   ├── __pycache__
│       │   │           │   │           │   │   ├── around.cpython-36.pyc
│       │   │           │   │           │   │   ├── base.cpython-36.pyc
│       │   │           │   │           │   │   ├── buffer.cpython-36.pyc
│       │   │           │   │           │   │   ├── dictionary.cpython-36.pyc
│       │   │           │   │           │   │   ├── file.cpython-36.pyc
│       │   │           │   │           │   │   ├── member.cpython-36.pyc
│       │   │           │   │           │   │   ├── omni.cpython-36.pyc
│       │   │           │   │           │   │   └── tag.cpython-36.pyc
│       │   │           │   │           │   ├── around.py
│       │   │           │   │           │   ├── base.py
│       │   │           │   │           │   ├── buffer.py
│       │   │           │   │           │   ├── dictionary.py
│       │   │           │   │           │   ├── file.py
│       │   │           │   │           │   ├── member.py
│       │   │           │   │           │   ├── omni.py
│       │   │           │   │           │   └── tag.py
│       │   │           │   │           └── util.py
│       │   │           │   └── test
│       │   │           │       ├── autoload
│       │   │           │       │   └── deoplete
│       │   │           │       │       ├── custom.vim
│       │   │           │       │       └── util.vim
│       │   │           │       ├── conftest.py
│       │   │           │       └── rplugin
│       │   │           │           └── python3
│       │   │           │               └── deoplete
│       │   │           │                   ├── test_filter.py
│       │   │           │                   ├── test_matcher_full_fuzzy.py
│       │   │           │                   ├── test_matcher_fuzzy.py
│       │   │           │                   └── test_util.py
│       │   │           ├── fzf
│       │   │           │   ├── BUILD.md
│       │   │           │   ├── CHANGELOG.md
│       │   │           │   ├── Dockerfile
│       │   │           │   ├── LICENSE
│       │   │           │   ├── Makefile
│       │   │           │   ├── README-VIM.md
│       │   │           │   ├── README.md
│       │   │           │   ├── bin
│       │   │           │   │   └── fzf-tmux
│       │   │           │   ├── doc
│       │   │           │   │   ├── fzf.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── glide.lock
│       │   │           │   ├── glide.yaml
│       │   │           │   ├── install
│       │   │           │   ├── main.go
│       │   │           │   ├── man
│       │   │           │   │   └── man1
│       │   │           │   │       ├── fzf-tmux.1
│       │   │           │   │       └── fzf.1
│       │   │           │   ├── plugin
│       │   │           │   │   └── fzf.vim
│       │   │           │   ├── shell
│       │   │           │   │   ├── completion.bash
│       │   │           │   │   ├── completion.zsh
│       │   │           │   │   ├── key-bindings.bash
│       │   │           │   │   ├── key-bindings.fish
│       │   │           │   │   └── key-bindings.zsh
│       │   │           │   ├── src
│       │   │           │   │   ├── LICENSE
│       │   │           │   │   ├── algo
│       │   │           │   │   │   ├── algo.go
│       │   │           │   │   │   ├── algo_test.go
│       │   │           │   │   │   └── normalize.go
│       │   │           │   │   ├── ansi.go
│       │   │           │   │   ├── ansi_test.go
│       │   │           │   │   ├── cache.go
│       │   │           │   │   ├── cache_test.go
│       │   │           │   │   ├── chunklist.go
│       │   │           │   │   ├── chunklist_test.go
│       │   │           │   │   ├── constants.go
│       │   │           │   │   ├── core.go
│       │   │           │   │   ├── history.go
│       │   │           │   │   ├── history_test.go
│       │   │           │   │   ├── item.go
│       │   │           │   │   ├── item_test.go
│       │   │           │   │   ├── matcher.go
│       │   │           │   │   ├── merger.go
│       │   │           │   │   ├── merger_test.go
│       │   │           │   │   ├── options.go
│       │   │           │   │   ├── options_test.go
│       │   │           │   │   ├── pattern.go
│       │   │           │   │   ├── pattern_test.go
│       │   │           │   │   ├── reader.go
│       │   │           │   │   ├── reader_test.go
│       │   │           │   │   ├── result.go
│       │   │           │   │   ├── result_others.go
│       │   │           │   │   ├── result_test.go
│       │   │           │   │   ├── result_x86.go
│       │   │           │   │   ├── terminal.go
│       │   │           │   │   ├── terminal_test.go
│       │   │           │   │   ├── terminal_unix.go
│       │   │           │   │   ├── terminal_windows.go
│       │   │           │   │   ├── tokenizer.go
│       │   │           │   │   ├── tokenizer_test.go
│       │   │           │   │   ├── tui
│       │   │           │   │   │   ├── dummy.go
│       │   │           │   │   │   ├── light.go
│       │   │           │   │   │   ├── tcell.go
│       │   │           │   │   │   ├── ttyname_unix.go
│       │   │           │   │   │   ├── ttyname_windows.go
│       │   │           │   │   │   ├── tui.go
│       │   │           │   │   │   └── tui_test.go
│       │   │           │   │   ├── update_assets.rb
│       │   │           │   │   └── util
│       │   │           │   │       ├── atomicbool.go
│       │   │           │   │       ├── atomicbool_test.go
│       │   │           │   │       ├── chars.go
│       │   │           │   │       ├── chars_test.go
│       │   │           │   │       ├── eventbox.go
│       │   │           │   │       ├── eventbox_test.go
│       │   │           │   │       ├── slab.go
│       │   │           │   │       ├── util.go
│       │   │           │   │       ├── util_test.go
│       │   │           │   │       ├── util_unix.go
│       │   │           │   │       └── util_windows.go
│       │   │           │   ├── test
│       │   │           │   │   ├── fzf.vader
│       │   │           │   │   └── test_go.rb
│       │   │           │   └── uninstall
│       │   │           ├── fzf.vim
│       │   │           │   ├── README.md
│       │   │           │   ├── autoload
│       │   │           │   │   └── fzf
│       │   │           │   │       ├── vim
│       │   │           │   │       │   └── complete.vim
│       │   │           │   │       └── vim.vim
│       │   │           │   ├── bin
│       │   │           │   │   ├── preview.rb
│       │   │           │   │   ├── preview.sh
│       │   │           │   │   └── tags.pl
│       │   │           │   ├── doc
│       │   │           │   │   ├── fzf-vim.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── fzf.vim
│       │   │           ├── indentLine
│       │   │           │   ├── LICENSE
│       │   │           │   ├── README.md
│       │   │           │   ├── after
│       │   │           │   │   ├── plugin
│       │   │           │   │   │   └── indentLine.vim
│       │   │           │   │   └── syntax
│       │   │           │   │       └── indentLine.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── indentLine.txt
│       │   │           │   │   └── tags
│       │   │           │   └── glyph
│       │   │           │       └── indentLine-dotted-guide.eps
│       │   │           ├── lightline.vim
│       │   │           │   ├── LICENSE
│       │   │           │   ├── README.md
│       │   │           │   ├── autoload
│       │   │           │   │   ├── lightline
│       │   │           │   │   │   ├── colorscheme
│       │   │           │   │   │   │   ├── 16color.vim
│       │   │           │   │   │   │   ├── OldHope.vim
│       │   │           │   │   │   │   ├── PaperColor.vim
│       │   │           │   │   │   │   ├── PaperColor_dark.vim
│       │   │           │   │   │   │   ├── PaperColor_light.vim
│       │   │           │   │   │   │   ├── Tomorrow.vim
│       │   │           │   │   │   │   ├── Tomorrow_Night.vim
│       │   │           │   │   │   │   ├── Tomorrow_Night_Blue.vim
│       │   │           │   │   │   │   ├── Tomorrow_Night_Bright.vim
│       │   │           │   │   │   │   ├── Tomorrow_Night_Eighties.vim
│       │   │           │   │   │   │   ├── darcula.vim
│       │   │           │   │   │   │   ├── default.vim
│       │   │           │   │   │   │   ├── deus.vim
│       │   │           │   │   │   │   ├── jellybeans.vim
│       │   │           │   │   │   │   ├── landscape.vim
│       │   │           │   │   │   │   ├── materia.vim
│       │   │           │   │   │   │   ├── material.vim
│       │   │           │   │   │   │   ├── molokai.vim
│       │   │           │   │   │   │   ├── nord.vim
│       │   │           │   │   │   │   ├── one.vim
│       │   │           │   │   │   │   ├── powerline.vim
│       │   │           │   │   │   │   ├── seoul256.vim
│       │   │           │   │   │   │   ├── solarized.vim
│       │   │           │   │   │   │   ├── srcery_drk.vim
│       │   │           │   │   │   │   └── wombat.vim
│       │   │           │   │   │   ├── colorscheme.vim
│       │   │           │   │   │   ├── colortable.vim
│       │   │           │   │   │   └── tab.vim
│       │   │           │   │   └── lightline.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── lightline.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── plugin
│       │   │           │   │   └── lightline.vim
│       │   │           │   └── test
│       │   │           │       ├── concatenate.vim
│       │   │           │       ├── error.vim
│       │   │           │       ├── expand.vim
│       │   │           │       ├── highlight.vim
│       │   │           │       ├── link.vim
│       │   │           │       ├── mode.vim
│       │   │           │       ├── onetab.vim
│       │   │           │       ├── subseparator.vim
│       │   │           │       ├── tabline.vim
│       │   │           │       ├── tabs.vim
│       │   │           │       ├── toggle.vim
│       │   │           │       └── uniq.vim
│       │   │           ├── vim-buftabline
│       │   │           │   ├── LICENSE
│       │   │           │   ├── README.md
│       │   │           │   ├── doc
│       │   │           │   │   ├── buftabline.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── buftabline.vim
│       │   │           ├── vim-commentary
│       │   │           │   ├── CONTRIBUTING.markdown
│       │   │           │   ├── README.markdown
│       │   │           │   ├── doc
│       │   │           │   │   ├── commentary.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── commentary.vim
│       │   │           ├── vim-fugitive
│       │   │           │   ├── CONTRIBUTING.markdown
│       │   │           │   ├── README.markdown
│       │   │           │   ├── autoload
│       │   │           │   │   └── fugitive.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── fugitive.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── fugitive.vim
│       │   │           ├── vim-highlightedyank
│       │   │           │   ├── README.md
│       │   │           │   ├── autoload
│       │   │           │   │   ├── highlightedyank
│       │   │           │   │   │   ├── highlight.vim
│       │   │           │   │   │   └── obsolete
│       │   │           │   │   │       ├── clock.vim
│       │   │           │   │   │       ├── highlight.vim
│       │   │           │   │   │       └── highlightedyank.vim
│       │   │           │   │   ├── highlightedyank.vim
│       │   │           │   │   └── vital
│       │   │           │   │       ├── _highlightedyank
│       │   │           │   │       │   └── Schedule.vim
│       │   │           │   │       ├── _highlightedyank.vim
│       │   │           │   │       ├── highlightedyank.vim
│       │   │           │   │       └── highlightedyank.vital
│       │   │           │   ├── doc
│       │   │           │   │   ├── highlightedyank.jax
│       │   │           │   │   ├── highlightedyank.txt
│       │   │           │   │   ├── tags
│       │   │           │   │   └── tags-ja
│       │   │           │   ├── plugin
│       │   │           │   │   └── highlightedyank.vim
│       │   │           │   └── test
│       │   │           │       ├── test-highlightedyank.bat
│       │   │           │       ├── test-highlightedyank.sh
│       │   │           │       └── test-highlightedyank.vim
│       │   │           ├── vim-markdown-composer
│       │   │           │   ├── Cargo.lock
│       │   │           │   ├── Cargo.toml
│       │   │           │   ├── README.md
│       │   │           │   ├── after
│       │   │           │   │   └── ftplugin
│       │   │           │   │       └── markdown
│       │   │           │   │           └── composer.vim
│       │   │           │   ├── config
│       │   │           │   │   └── log.yaml
│       │   │           │   ├── doc
│       │   │           │   │   ├── markdown-composer.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── error.log
│       │   │           │   ├── src
│       │   │           │   │   └── main.rs
│       │   │           │   └── target
│       │   │           │       └── release
│       │   │           │           ├── build
│       │   │           │           │   ├── mime_guess-52c4127d6208f28d
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   │   └── mime_types_generated.rs
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── mime_guess-7ddd4c845c47bf56
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── mime_guess-a2c83fe9a214ce40
│       │   │           │           │   │   ├── build-script-gen_mime_types
│       │   │           │           │   │   ├── build_script_gen_mime_types-a2c83fe9a214ce40
│       │   │           │           │   │   └── build_script_gen_mime_types-a2c83fe9a214ce40.d
│       │   │           │           │   ├── mime_guess-c93397470b680cd4
│       │   │           │           │   │   ├── build-script-gen_mime_types
│       │   │           │           │   │   ├── build_script_gen_mime_types-c93397470b680cd4
│       │   │           │           │   │   └── build_script_gen_mime_types-c93397470b680cd4.d
│       │   │           │           │   ├── mime_guess-d1fd67043daa3823
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-d1fd67043daa3823
│       │   │           │           │   │   └── build_script_build-d1fd67043daa3823.d
│       │   │           │           │   ├── mime_guess-e82a1b93fa535ff8
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── miniz-sys-510946048a77b73f
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   │   ├── libminiz.a
│       │   │           │           │   │   │   └── miniz.o
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── miniz-sys-5c85da84c0883674
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-5c85da84c0883674
│       │   │           │           │   │   └── build_script_build-5c85da84c0883674.d
│       │   │           │           │   ├── miniz-sys-ba5b48186a04f2d8
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-ba5b48186a04f2d8
│       │   │           │           │   │   └── build_script_build-ba5b48186a04f2d8.d
│       │   │           │           │   ├── miniz-sys-da85115890d44987
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   │   ├── libminiz.a
│       │   │           │           │   │   │   └── miniz.o
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── miniz-sys-ecb8bd01411c11fb
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-ecb8bd01411c11fb
│       │   │           │           │   │   └── build_script_build-ecb8bd01411c11fb.d
│       │   │           │           │   ├── miniz-sys-fb02397beb7c2fc9
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   │   ├── libminiz.a
│       │   │           │           │   │   │   └── miniz.o
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── num-integer-0a89fc4e1d9043b5
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── num-integer-b9cb602f4228c83f
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-b9cb602f4228c83f
│       │   │           │           │   │   └── build_script_build-b9cb602f4228c83f.d
│       │   │           │           │   ├── num-traits-04daa4b7c88020ac
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── num-traits-8d33ba1ec84f4d71
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-8d33ba1ec84f4d71
│       │   │           │           │   │   └── build_script_build-8d33ba1ec84f4d71.d
│       │   │           │           │   ├── pulldown-cmark-12b757dc56e23f77
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── pulldown-cmark-384a20535d3e8207
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-384a20535d3e8207
│       │   │           │           │   │   └── build_script_build-384a20535d3e8207.d
│       │   │           │           │   ├── pulldown-cmark-44dd2cd34e1dbfcd
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-44dd2cd34e1dbfcd
│       │   │           │           │   │   └── build_script_build-44dd2cd34e1dbfcd.d
│       │   │           │           │   ├── pulldown-cmark-6a634cdad6ac06d6
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── pulldown-cmark-700707ab47081130
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-700707ab47081130
│       │   │           │           │   │   └── build_script_build-700707ab47081130.d
│       │   │           │           │   ├── pulldown-cmark-b9e0e82519dea8b5
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── regex-7b98e50fabdf447b
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── regex-c564c00e28555815
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-c564c00e28555815
│       │   │           │           │   │   └── build_script_build-c564c00e28555815.d
│       │   │           │           │   ├── unicase-2f1face903e00a0b
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── unicase-4001da5702e93b82
│       │   │           │           │   │   ├── out
│       │   │           │           │   │   ├── output
│       │   │           │           │   │   ├── root-output
│       │   │           │           │   │   └── stderr
│       │   │           │           │   ├── unicase-788d081e4e38f951
│       │   │           │           │   │   ├── build-script-build
│       │   │           │           │   │   ├── build_script_build-788d081e4e38f951
│       │   │           │           │   │   └── build_script_build-788d081e4e38f951.d
│       │   │           │           │   └── unicase-eaf5f67bb479e42f
│       │   │           │           │       ├── build-script-build
│       │   │           │           │       ├── build_script_build-eaf5f67bb479e42f
│       │   │           │           │       └── build_script_build-eaf5f67bb479e42f.d
│       │   │           │           ├── deps
│       │   │           │           │   ├── aho_corasick-0e069905443baa5a.d
│       │   │           │           │   ├── aho_corasick-64b2deae5796ee8e.d
│       │   │           │           │   ├── aho_corasick-c442c95eb8611c4e.d
│       │   │           │           │   ├── ansi_term-466fd77757641639.d
│       │   │           │           │   ├── ansi_term-886e9bf3184fd84c.d
│       │   │           │           │   ├── ansi_term-df4221087b2a2a14.d
│       │   │           │           │   ├── antidote-340026ff4b7cd296.d
│       │   │           │           │   ├── antidote-43ffe8ea30be867d.d
│       │   │           │           │   ├── atty-149be734047b6f4e.d
│       │   │           │           │   ├── atty-8992bb857b1de5df.d
│       │   │           │           │   ├── atty-a4a1884e4837cbf3.d
│       │   │           │           │   ├── aurelius-856bd7a0d0238f01.d
│       │   │           │           │   ├── aurelius-8c80fef7b83b9a97.d
│       │   │           │           │   ├── aurelius-f98e632472279b32.d
│       │   │           │           │   ├── backtrace-39167ae2ffbe43e3.d
│       │   │           │           │   ├── backtrace-e35bbc1ca31d74e3.d
│       │   │           │           │   ├── backtrace-f8a6c1115938344d.d
│       │   │           │           │   ├── base64-02f8ed3beec16725.d
│       │   │           │           │   ├── base64-1a3d52f784d8d6e9.d
│       │   │           │           │   ├── base64-585a1decc08c4e01.d
│       │   │           │           │   ├── base64-c1068bbf8e1fc419.d
│       │   │           │           │   ├── base64-c57d1025ca5fd0fd.d
│       │   │           │           │   ├── base64-e83d444b552ea551.d
│       │   │           │           │   ├── bitflags-0027123a6ee1ba3f.d
│       │   │           │           │   ├── bitflags-563ee321af8ea45c.d
│       │   │           │           │   ├── bitflags-597059c4d6ef8165.d
│       │   │           │           │   ├── bitflags-628c5d0e9cdfbcd9.d
│       │   │           │           │   ├── bitflags-c753293ce184b081.d
│       │   │           │           │   ├── byteorder-47eb3e0a760228e8.d
│       │   │           │           │   ├── byteorder-6eb1169fd0d412f7.d
│       │   │           │           │   ├── byteorder-bbcf25548227edcf.d
│       │   │           │           │   ├── cc-38085edab22b7dac.d
│       │   │           │           │   ├── cc-9ecb56b83af2b7d8.d
│       │   │           │           │   ├── cc-bd8671b8e19408b5.d
│       │   │           │           │   ├── cfg_if-33afef4ba43c979a.d
│       │   │           │           │   ├── cfg_if-a6db5dfe8ca049ce.d
│       │   │           │           │   ├── cfg_if-f52d017e0871fbda.d
│       │   │           │           │   ├── chan-3c02fd121d4bfea5.d
│       │   │           │           │   ├── chan-aa2c5437b50a6433.d
│       │   │           │           │   ├── chan-f391f1143ebfb320.d
│       │   │           │           │   ├── chrono-15fb7e46e2825cdf.d
│       │   │           │           │   ├── chrono-b079533e3f413a80.d
│       │   │           │           │   ├── chrono-c9acf2ee8a188f8d.d
│       │   │           │           │   ├── clap-1d56bb9c44dcd7d3.d
│       │   │           │           │   ├── clap-55cbbdb6aab111cd.d
│       │   │           │           │   ├── clap-b3838ef737386f43.d
│       │   │           │           │   ├── crossbeam-3102631475657c77.d
│       │   │           │           │   ├── crossbeam-f69db28e704a8504.d
│       │   │           │           │   ├── dtoa-30cf9e53abecef40.d
│       │   │           │           │   ├── dtoa-afe4e03449ff7cd7.d
│       │   │           │           │   ├── error_chain-12692eab4dc4d98f.d
│       │   │           │           │   ├── error_chain-8c412759fa2f7246.d
│       │   │           │           │   ├── error_chain-c6d90c1a528a6433.d
│       │   │           │           │   ├── flate2-134928d914863ba7.d
│       │   │           │           │   ├── flate2-b4929aebd4aefbd7.d
│       │   │           │           │   ├── flate2-e0f93e5d73cbecf1.d
│       │   │           │           │   ├── fnv-7c5b5757ce1d9345.d
│       │   │           │           │   ├── fnv-aff3d3c9c6435586.d
│       │   │           │           │   ├── handlebars-3936d74b2bfa5359.d
│       │   │           │           │   ├── handlebars-39dad435e1cac97d.d
│       │   │           │           │   ├── handlebars-46c3e88c090bafe1.d
│       │   │           │           │   ├── handlebars_iron-02d0d405b65347e1.d
│       │   │           │           │   ├── handlebars_iron-70d64af9676a1485.d
│       │   │           │           │   ├── handlebars_iron-7ed6baf25aa0b61e.d
│       │   │           │           │   ├── httparse-63e7f6beb0bce946.d
│       │   │           │           │   ├── httparse-76434a22de78f72f.d
│       │   │           │           │   ├── humantime-03f8a3d9c80410c5.d
│       │   │           │           │   ├── humantime-706956a71134d07a.d
│       │   │           │           │   ├── humantime-7e1ad9454e1fefed.d
│       │   │           │           │   ├── hyper-0f61958d35da08c2.d
│       │   │           │           │   ├── hyper-5e184c0b77cf27c6.d
│       │   │           │           │   ├── hyper-8774fa3011b1f1fd.d
│       │   │           │           │   ├── idna-58320eba9229d578.d
│       │   │           │           │   ├── idna-afe153bf65b3d195.d
│       │   │           │           │   ├── idna-f19da11d969b4401.d
│       │   │           │           │   ├── iron-16bd8de357bbf635.d
│       │   │           │           │   ├── iron-560c85659505d88c.d
│       │   │           │           │   ├── iron-ea0433c10be2a258.d
│       │   │           │           │   ├── itoa-998e32fa2e7c4cd5.d
│       │   │           │           │   ├── itoa-9f225c09e52eff28.d
│       │   │           │           │   ├── itoa-c3a968abdf6cc962.d
│       │   │           │           │   ├── language_tags-139325a534c4322d.d
│       │   │           │           │   ├── language_tags-cefcaaf04c58d9f6.d
│       │   │           │           │   ├── lazy_static-27baf624e7c4300b.d
│       │   │           │           │   ├── lazy_static-a29c6a02c3d3f534.d
│       │   │           │           │   ├── libaho_corasick-0e069905443baa5a.rlib
│       │   │           │           │   ├── libaho_corasick-64b2deae5796ee8e.rlib
│       │   │           │           │   ├── libaho_corasick-c442c95eb8611c4e.rlib
│       │   │           │           │   ├── libansi_term-466fd77757641639.rlib
│       │   │           │           │   ├── libansi_term-886e9bf3184fd84c.rlib
│       │   │           │           │   ├── libansi_term-df4221087b2a2a14.rlib
│       │   │           │           │   ├── libantidote-340026ff4b7cd296.rlib
│       │   │           │           │   ├── libantidote-43ffe8ea30be867d.rlib
│       │   │           │           │   ├── libatty-149be734047b6f4e.rlib
│       │   │           │           │   ├── libatty-8992bb857b1de5df.rlib
│       │   │           │           │   ├── libatty-a4a1884e4837cbf3.rlib
│       │   │           │           │   ├── libaurelius-856bd7a0d0238f01.rlib
│       │   │           │           │   ├── libaurelius-8c80fef7b83b9a97.rlib
│       │   │           │           │   ├── libaurelius-f98e632472279b32.rlib
│       │   │           │           │   ├── libbacktrace-39167ae2ffbe43e3.rlib
│       │   │           │           │   ├── libbacktrace-e35bbc1ca31d74e3.rlib
│       │   │           │           │   ├── libbacktrace-f8a6c1115938344d.rlib
│       │   │           │           │   ├── libbase64-02f8ed3beec16725.rlib
│       │   │           │           │   ├── libbase64-1a3d52f784d8d6e9.rlib
│       │   │           │           │   ├── libbase64-585a1decc08c4e01.rlib
│       │   │           │           │   ├── libbase64-c1068bbf8e1fc419.rlib
│       │   │           │           │   ├── libbase64-c57d1025ca5fd0fd.rlib
│       │   │           │           │   ├── libbase64-e83d444b552ea551.rlib
│       │   │           │           │   ├── libbitflags-0027123a6ee1ba3f.rlib
│       │   │           │           │   ├── libbitflags-563ee321af8ea45c.rlib
│       │   │           │           │   ├── libbitflags-597059c4d6ef8165.rlib
│       │   │           │           │   ├── libbitflags-628c5d0e9cdfbcd9.rlib
│       │   │           │           │   ├── libbitflags-c753293ce184b081.rlib
│       │   │           │           │   ├── libbyteorder-47eb3e0a760228e8.rlib
│       │   │           │           │   ├── libbyteorder-6eb1169fd0d412f7.rlib
│       │   │           │           │   ├── libbyteorder-bbcf25548227edcf.rlib
│       │   │           │           │   ├── libc-2a73de8016118f52.d
│       │   │           │           │   ├── libc-39d632c4f2a03e8e.d
│       │   │           │           │   ├── libc-d7978a1eb45f036d.d
│       │   │           │           │   ├── libcc-38085edab22b7dac.rlib
│       │   │           │           │   ├── libcc-9ecb56b83af2b7d8.rlib
│       │   │           │           │   ├── libcc-bd8671b8e19408b5.rlib
│       │   │           │           │   ├── libcfg_if-33afef4ba43c979a.rlib
│       │   │           │           │   ├── libcfg_if-a6db5dfe8ca049ce.rlib
│       │   │           │           │   ├── libcfg_if-f52d017e0871fbda.rlib
│       │   │           │           │   ├── libchan-3c02fd121d4bfea5.rlib
│       │   │           │           │   ├── libchan-aa2c5437b50a6433.rlib
│       │   │           │           │   ├── libchan-f391f1143ebfb320.rlib
│       │   │           │           │   ├── libchrono-15fb7e46e2825cdf.rlib
│       │   │           │           │   ├── libchrono-b079533e3f413a80.rlib
│       │   │           │           │   ├── libchrono-c9acf2ee8a188f8d.rlib
│       │   │           │           │   ├── libclap-1d56bb9c44dcd7d3.rlib
│       │   │           │           │   ├── libclap-55cbbdb6aab111cd.rlib
│       │   │           │           │   ├── libclap-b3838ef737386f43.rlib
│       │   │           │           │   ├── libcrossbeam-3102631475657c77.rlib
│       │   │           │           │   ├── libcrossbeam-f69db28e704a8504.rlib
│       │   │           │           │   ├── libdtoa-30cf9e53abecef40.rlib
│       │   │           │           │   ├── libdtoa-afe4e03449ff7cd7.rlib
│       │   │           │           │   ├── liberror_chain-12692eab4dc4d98f.rlib
│       │   │           │           │   ├── liberror_chain-8c412759fa2f7246.rlib
│       │   │           │           │   ├── liberror_chain-c6d90c1a528a6433.rlib
│       │   │           │           │   ├── libflate2-134928d914863ba7.rlib
│       │   │           │           │   ├── libflate2-b4929aebd4aefbd7.rlib
│       │   │           │           │   ├── libflate2-e0f93e5d73cbecf1.rlib
│       │   │           │           │   ├── libfnv-7c5b5757ce1d9345.rlib
│       │   │           │           │   ├── libfnv-aff3d3c9c6435586.rlib
│       │   │           │           │   ├── libhandlebars-3936d74b2bfa5359.rlib
│       │   │           │           │   ├── libhandlebars-39dad435e1cac97d.rlib
│       │   │           │           │   ├── libhandlebars-46c3e88c090bafe1.rlib
│       │   │           │           │   ├── libhandlebars_iron-02d0d405b65347e1.rlib
│       │   │           │           │   ├── libhandlebars_iron-70d64af9676a1485.rlib
│       │   │           │           │   ├── libhandlebars_iron-7ed6baf25aa0b61e.rlib
│       │   │           │           │   ├── libhttparse-63e7f6beb0bce946.rlib
│       │   │           │           │   ├── libhttparse-76434a22de78f72f.rlib
│       │   │           │           │   ├── libhumantime-03f8a3d9c80410c5.rlib
│       │   │           │           │   ├── libhumantime-706956a71134d07a.rlib
│       │   │           │           │   ├── libhumantime-7e1ad9454e1fefed.rlib
│       │   │           │           │   ├── libhyper-0f61958d35da08c2.rlib
│       │   │           │           │   ├── libhyper-5e184c0b77cf27c6.rlib
│       │   │           │           │   ├── libhyper-8774fa3011b1f1fd.rlib
│       │   │           │           │   ├── libidna-58320eba9229d578.rlib
│       │   │           │           │   ├── libidna-afe153bf65b3d195.rlib
│       │   │           │           │   ├── libidna-f19da11d969b4401.rlib
│       │   │           │           │   ├── libiron-16bd8de357bbf635.rlib
│       │   │           │           │   ├── libiron-560c85659505d88c.rlib
│       │   │           │           │   ├── libiron-ea0433c10be2a258.rlib
│       │   │           │           │   ├── libitoa-998e32fa2e7c4cd5.rlib
│       │   │           │           │   ├── libitoa-9f225c09e52eff28.rlib
│       │   │           │           │   ├── libitoa-c3a968abdf6cc962.rlib
│       │   │           │           │   ├── liblanguage_tags-139325a534c4322d.rlib
│       │   │           │           │   ├── liblanguage_tags-cefcaaf04c58d9f6.rlib
│       │   │           │           │   ├── liblazy_static-27baf624e7c4300b.rlib
│       │   │           │           │   ├── liblazy_static-a29c6a02c3d3f534.rlib
│       │   │           │           │   ├── liblibc-2a73de8016118f52.rlib
│       │   │           │           │   ├── liblibc-39d632c4f2a03e8e.rlib
│       │   │           │           │   ├── liblibc-d7978a1eb45f036d.rlib
│       │   │           │           │   ├── liblinked_hash_map-4807d584bcff9d53.rlib
│       │   │           │           │   ├── liblinked_hash_map-4bcb44da9f9ef352.rlib
│       │   │           │           │   ├── liblinked_hash_map-b86a0fabf9aa0b53.rlib
│       │   │           │           │   ├── liblog-266adc3c7e50afd6.rlib
│       │   │           │           │   ├── liblog-28506c453bcc6aa1.rlib
│       │   │           │           │   ├── liblog-3241897c5353cb75.rlib
│       │   │           │           │   ├── liblog-92fc16765557fd3a.rlib
│       │   │           │           │   ├── liblog-bdfe9268fe871acb.rlib
│       │   │           │           │   ├── liblog-f0fbff00f3e8212b.rlib
│       │   │           │           │   ├── liblog4rs-18f8e6b5e2c8057f.rlib
│       │   │           │           │   ├── liblog4rs-37377a85a622fc09.rlib
│       │   │           │           │   ├── liblog4rs-530f940b2191f917.rlib
│       │   │           │           │   ├── liblog_mdc-689cc4abcb6387e0.rlib
│       │   │           │           │   ├── liblog_mdc-dd4de0a2fa6ea61f.rlib
│       │   │           │           │   ├── liblog_panics-49d0cf4cdb94cd1a.rlib
│       │   │           │           │   ├── liblog_panics-57cf11ee7f8ca9e8.rlib
│       │   │           │           │   ├── liblog_panics-ba3a727c19b1d6f2.rlib
│       │   │           │           │   ├── libmatches-4aeef7d23e89289a.rlib
│       │   │           │           │   ├── libmatches-833c2c4d51183b7b.rlib
│       │   │           │           │   ├── libmemchr-1e22fc6d00c04df0.rlib
│       │   │           │           │   ├── libmemchr-3d12e12bb9bf5116.rlib
│       │   │           │           │   ├── libmemchr-556c9977f9427875.rlib
│       │   │           │           │   ├── libmime-5ef8be73b6e9e64a.rlib
│       │   │           │           │   ├── libmime-6087a79a173b7fb6.rlib
│       │   │           │           │   ├── libmime-fd8f224c5ebf5af9.rlib
│       │   │           │           │   ├── libmime_guess-0e68c9baa6bf0522.rlib
│       │   │           │           │   ├── libmime_guess-d6bfca8de0139995.rlib
│       │   │           │           │   ├── libmime_guess-fd3899c43b2ae180.rlib
│       │   │           │           │   ├── libminiz_sys-49ad59b13fb55993.rlib
│       │   │           │           │   ├── libminiz_sys-4ea7083b612bbefe.rlib
│       │   │           │           │   ├── libminiz_sys-9ebb6659d6d2cdb8.rlib
│       │   │           │           │   ├── libmodifier-239988ac3532e42b.rlib
│       │   │           │           │   ├── libmodifier-98b77b47fe7f9898.rlib
│       │   │           │           │   ├── libmount-a9dd4cc1f5848b4f.rlib
│       │   │           │           │   ├── libmount-e66dfd554ad38ae1.rlib
│       │   │           │           │   ├── libmount-e87d034b8111cabd.rlib
│       │   │           │           │   ├── libnum-2464e3f115589784.rlib
│       │   │           │           │   ├── libnum-cb983e8cdbe0e987.rlib
│       │   │           │           │   ├── libnum_cpus-005e6eb6cd71fa73.rlib
│       │   │           │           │   ├── libnum_cpus-3d6b36ee12c66f29.rlib
│       │   │           │           │   ├── libnum_cpus-c18aec78f840dbca.rlib
│       │   │           │           │   ├── libnum_integer-624ef1933165d949.rlib
│       │   │           │           │   ├── libnum_integer-c86b7e219dd6976c.rlib
│       │   │           │           │   ├── libnum_integer-d5eb7bbd276ddf83.rlib
│       │   │           │           │   ├── libnum_iter-8dcbd64b54dc20a2.rlib
│       │   │           │           │   ├── libnum_iter-f2fa83377dc2ef2b.rlib
│       │   │           │           │   ├── libnum_traits-45446b387d5047e5.rlib
│       │   │           │           │   ├── libnum_traits-871a4fcadf8549fd.rlib
│       │   │           │           │   ├── libnum_traits-9f24093bf088b6c1.rlib
│       │   │           │           │   ├── libnum_traits-b98020ecc01218d7.rlib
│       │   │           │           │   ├── libordered_float-1e576d5013fe8f03.rlib
│       │   │           │           │   ├── libordered_float-c1740041383a373c.rlib
│       │   │           │           │   ├── libordered_float-ca8d97b39c0fbc88.rlib
│       │   │           │           │   ├── libpercent_encoding-02c8917eedd513f0.rlib
│       │   │           │           │   ├── libpercent_encoding-7a8bae7514be74aa.rlib
│       │   │           │           │   ├── libpest-5717699a28ec6aa0.rlib
│       │   │           │           │   ├── libpest-7e71ac46aa57f8e7.rlib
│       │   │           │           │   ├── libpest-ebcad2ebfb8c81a5.rlib
│       │   │           │           │   ├── libpest_derive-408fb78939efdd02.dylib
│       │   │           │           │   ├── libpest_derive-5ca63ce4cf7f239d.dylib
│       │   │           │           │   ├── libpest_derive-5ce47561e713f4de.dylib
│       │   │           │           │   ├── libphf-24558e41e8965a33.rlib
│       │   │           │           │   ├── libphf-5677a1b5767070ed.rlib
│       │   │           │           │   ├── libphf-cb83278788e3ebed.rlib
│       │   │           │           │   ├── libphf_codegen-58fc07451458bea6.rlib
│       │   │           │           │   ├── libphf_codegen-c5f6cf11b42e9832.rlib
│       │   │           │           │   ├── libphf_codegen-caa444092a1d55b1.rlib
│       │   │           │           │   ├── libphf_generator-7736f5f124a91dc4.rlib
│       │   │           │           │   ├── libphf_generator-950daa3a05d7f239.rlib
│       │   │           │           │   ├── libphf_generator-a3d2b723576fdf6c.rlib
│       │   │           │           │   ├── libphf_shared-ba6ff8c8bbdcfaf2.rlib
│       │   │           │           │   ├── libphf_shared-d76443840dddfef6.rlib
│       │   │           │           │   ├── libphf_shared-ee39a6416ed1aaa0.rlib
│       │   │           │           │   ├── libplugin-96c3d15270e47712.rlib
│       │   │           │           │   ├── libplugin-9ec5aa182fb43d01.rlib
│       │   │           │           │   ├── libproc_macro2-58e343f8ee2f3593.rlib
│       │   │           │           │   ├── libpulldown_cmark-3d507a2d398eed0f.rlib
│       │   │           │           │   ├── libpulldown_cmark-5f48fd78e207b466.rlib
│       │   │           │           │   ├── libpulldown_cmark-9f00e677a5e54177.rlib
│       │   │           │           │   ├── libquick_error-c898df68bd32cb70.rlib
│       │   │           │           │   ├── libquick_error-d40f0d126a52a6c7.rlib
│       │   │           │           │   ├── libquote-3cca359e759fa0d8.rlib
│       │   │           │           │   ├── libquote-4b5518fb6d00a171.rlib
│       │   │           │           │   ├── libquote-57f9c3d33cce9b4c.rlib
│       │   │           │           │   ├── librand-80dcd34270f302c8.rlib
│       │   │           │           │   ├── librand-a33b2ec292c86c16.rlib
│       │   │           │           │   ├── librand-d06422b8f89b4315.rlib
│       │   │           │           │   ├── librand-e7117b23b49b1e9e.rlib
│       │   │           │           │   ├── libregex-130087211f928ad3.rlib
│       │   │           │           │   ├── libregex-aa99691257b1a035.rlib
│       │   │           │           │   ├── libregex-e2e51ad0e3e0b723.rlib
│       │   │           │           │   ├── libregex_syntax-5d85aa8f236781ba.rlib
│       │   │           │           │   ├── libregex_syntax-5f9a57a2c5eb9cb2.rlib
│       │   │           │           │   ├── libregex_syntax-b44342623e0c3293.rlib
│       │   │           │           │   ├── librmp-0e51cf94231ab604.rlib
│       │   │           │           │   ├── librmp-127db9b721487fe2.rlib
│       │   │           │           │   ├── librmp-18b15fbee6516f8f.rlib
│       │   │           │           │   ├── librmp_serde-035eab872005f132.rlib
│       │   │           │           │   ├── librmp_serde-1af2fd82b282a3fc.rlib
│       │   │           │           │   ├── librmp_serde-fd151219f3ccdadf.rlib
│       │   │           │           │   ├── librustc_demangle-c800d04f2e87ca8a.rlib
│       │   │           │           │   ├── librustc_demangle-eee1da6fe9b363f6.rlib
│       │   │           │           │   ├── librustc_demangle-f1b9fd8cbbf62da0.rlib
│       │   │           │           │   ├── libsafemem-09f8afbf77eeedd0.rlib
│       │   │           │           │   ├── libsafemem-a189df975b5c5afd.rlib
│       │   │           │           │   ├── libsame_file-c92bd9b1ab292700.rlib
│       │   │           │           │   ├── libsame_file-d010225ae5a09d1d.rlib
│       │   │           │           │   ├── libsequence_trie-62c7ceb92e615a9f.rlib
│       │   │           │           │   ├── libsequence_trie-eaf72a304c332c72.rlib
│       │   │           │           │   ├── libserde-1d53cfe3a3ecdfd7.rlib
│       │   │           │           │   ├── libserde-4988bea5c2cf8796.rlib
│       │   │           │           │   ├── libserde-fc123953f7b713b4.rlib
│       │   │           │           │   ├── libserde_derive-6d7ac7f9f2c0a245.dylib
│       │   │           │           │   ├── libserde_derive-ddc30972e593977b.dylib
│       │   │           │           │   ├── libserde_derive-e3596893ab24a91c.dylib
│       │   │           │           │   ├── libserde_derive_internals-15e8e17b5bd081fc.rlib
│       │   │           │           │   ├── libserde_derive_internals-5c78287cd223cda3.rlib
│       │   │           │           │   ├── libserde_json-112de609c516fa84.rlib
│       │   │           │           │   ├── libserde_json-9ed42ffcc68da9f1.rlib
│       │   │           │           │   ├── libserde_json-b25298dd40aa67e1.rlib
│       │   │           │           │   ├── libserde_value-956d86e57834fdc1.rlib
│       │   │           │           │   ├── libserde_value-bba89e100aab1a6a.rlib
│       │   │           │           │   ├── libserde_value-e8424e72e97b4153.rlib
│       │   │           │           │   ├── libserde_yaml-6d75199baa31c162.rlib
│       │   │           │           │   ├── libserde_yaml-c447b6dc07cc5674.rlib
│       │   │           │           │   ├── libserde_yaml-f7aae37c3e078577.rlib
│       │   │           │           │   ├── libsha1-603a26c663602b8c.rlib
│       │   │           │           │   ├── libsha1-879968bbcca291fd.rlib
│       │   │           │           │   ├── libshlex-31c763da2a502e2d.rlib
│       │   │           │           │   ├── libshlex-c2714093918d935d.rlib
│       │   │           │           │   ├── libsiphasher-8676af8a5c116f88.rlib
│       │   │           │           │   ├── libsiphasher-abbfdc968aa32639.rlib
│       │   │           │           │   ├── libstaticfile-50cb9b627e286437.rlib
│       │   │           │           │   ├── libstaticfile-9f097b7ba3edfbf7.rlib
│       │   │           │           │   ├── libstaticfile-fe58f1a0c0b7f757.rlib
│       │   │           │           │   ├── libstrsim-5cdc35fe7af8bf07.rlib
│       │   │           │           │   ├── libstrsim-63f96b0e61b9c45f.rlib
│       │   │           │           │   ├── libstrsim-754e49b0a0f1f257.rlib
│       │   │           │           │   ├── libsyn-02915e4ef025dd8b.rlib
│       │   │           │           │   ├── libsyn-a44e60fe20836d8d.rlib
│       │   │           │           │   ├── libsyn-be604022eace9052.rlib
│       │   │           │           │   ├── libsyn-f7bf4da4dd64ccb9.rlib
│       │   │           │           │   ├── libsynom-e60392ea99488643.rlib
│       │   │           │           │   ├── libsynom-fb0914a3d8164296.rlib
│       │   │           │           │   ├── libtextwrap-0952135c7b77b61d.rlib
│       │   │           │           │   ├── libtextwrap-f6614772f726d18e.rlib
│       │   │           │           │   ├── libthread_local-81fbfa58ccd5a6e9.rlib
│       │   │           │           │   ├── libthread_local-ea9dd4336c905c11.rlib
│       │   │           │           │   ├── libtime-2c60cb46cdba05f3.rlib
│       │   │           │           │   ├── libtime-3e875588a9788f53.rlib
│       │   │           │           │   ├── libtime-68c1e7ecad1e3d4a.rlib
│       │   │           │           │   ├── libtraitobject-3449ec392744c246.rlib
│       │   │           │           │   ├── libtraitobject-8ca36cda4d6dcaf9.rlib
│       │   │           │           │   ├── libtypeable-2bf798c470c8b1b7.rlib
│       │   │           │           │   ├── libtypeable-b3228f65cf5f4131.rlib
│       │   │           │           │   ├── libtypemap-c1dd20509670f7f7.rlib
│       │   │           │           │   ├── libtypemap-cf024416166bd68c.rlib
│       │   │           │           │   ├── libucd_util-2fa6be8f31594200.rlib
│       │   │           │           │   ├── libunicase-450c89cf6c79f26b.rlib
│       │   │           │           │   ├── libunicase-dfa7ad7ab4e2551d.rlib
│       │   │           │           │   ├── libunicode_bidi-78e5e4c7667da33b.rlib
│       │   │           │           │   ├── libunicode_bidi-a970e149e9dbbcb4.rlib
│       │   │           │           │   ├── libunicode_normalization-1b04c098f93a8f08.rlib
│       │   │           │           │   ├── libunicode_normalization-60738537dd5c27e7.rlib
│       │   │           │           │   ├── libunicode_normalization-a1405d70b136e057.rlib
│       │   │           │           │   ├── libunicode_width-cfc57006a7d6dc13.rlib
│       │   │           │           │   ├── libunicode_width-fdf54158249adbce.rlib
│       │   │           │           │   ├── libunicode_xid-6e4bc64e23e95afc.rlib
│       │   │           │           │   ├── libunicode_xid-a1566504ffcb014d.rlib
│       │   │           │           │   ├── libunicode_xid-ed340f58e921d9b5.rlib
│       │   │           │           │   ├── libunreachable-7b409d7844ee3836.rlib
│       │   │           │           │   ├── libunreachable-a8d07be79a0f3f3a.rlib
│       │   │           │           │   ├── libunreachable-aac6dfdaee7a613b.rlib
│       │   │           │           │   ├── libunreachable-df5db693122722d3.rlib
│       │   │           │           │   ├── libunsafe_any-a8bb27a14398d33e.rlib
│       │   │           │           │   ├── libunsafe_any-b9e4dbf89fdce58b.rlib
│       │   │           │           │   ├── liburl-381925bca0afcc76.rlib
│       │   │           │           │   ├── liburl-4269c1075468ee7d.rlib
│       │   │           │           │   ├── liburl-be4b8a3b7d3af779.rlib
│       │   │           │           │   ├── libutf8_ranges-4e93fd38394516a0.rlib
│       │   │           │           │   ├── libutf8_ranges-8096a1785a919a70.rlib
│       │   │           │           │   ├── libvec_map-01307a6a4110e620.rlib
│       │   │           │           │   ├── libvec_map-2620090de31a2ab6.rlib
│       │   │           │           │   ├── libvec_map-b1a7ccb544fc9963.rlib
│       │   │           │           │   ├── libversion_check-01a60654f04cbb4c.rlib
│       │   │           │           │   ├── libversion_check-73842fd8b9911f84.rlib
│       │   │           │           │   ├── libvoid-533777f1118872e4.rlib
│       │   │           │           │   ├── libvoid-8fe8ca3283972eab.rlib
│       │   │           │           │   ├── libwalkdir-9c081475f9974b55.rlib
│       │   │           │           │   ├── libwalkdir-cc96a356fee977a9.rlib
│       │   │           │           │   ├── libwebsocket-4ded63f71ef526fb.rlib
│       │   │           │           │   ├── libwebsocket-51ce89ff7df6ad63.rlib
│       │   │           │           │   ├── libwebsocket-e283ebbc91ff48e7.rlib
│       │   │           │           │   ├── libyaml_rust-c40181ec7a1d029e.rlib
│       │   │           │           │   ├── libyaml_rust-d5f405393779b771.rlib
│       │   │           │           │   ├── libyaml_rust-e9efd65e86dcfc49.rlib
│       │   │           │           │   ├── linked_hash_map-4807d584bcff9d53.d
│       │   │           │           │   ├── linked_hash_map-4bcb44da9f9ef352.d
│       │   │           │           │   ├── linked_hash_map-b86a0fabf9aa0b53.d
│       │   │           │           │   ├── log-266adc3c7e50afd6.d
│       │   │           │           │   ├── log-28506c453bcc6aa1.d
│       │   │           │           │   ├── log-3241897c5353cb75.d
│       │   │           │           │   ├── log-92fc16765557fd3a.d
│       │   │           │           │   ├── log-bdfe9268fe871acb.d
│       │   │           │           │   ├── log-f0fbff00f3e8212b.d
│       │   │           │           │   ├── log4rs-18f8e6b5e2c8057f.d
│       │   │           │           │   ├── log4rs-37377a85a622fc09.d
│       │   │           │           │   ├── log4rs-530f940b2191f917.d
│       │   │           │           │   ├── log_mdc-689cc4abcb6387e0.d
│       │   │           │           │   ├── log_mdc-dd4de0a2fa6ea61f.d
│       │   │           │           │   ├── log_panics-49d0cf4cdb94cd1a.d
│       │   │           │           │   ├── log_panics-57cf11ee7f8ca9e8.d
│       │   │           │           │   ├── log_panics-ba3a727c19b1d6f2.d
│       │   │           │           │   ├── markdown_composer-03f103fda9cfb22a
│       │   │           │           │   ├── markdown_composer-03f103fda9cfb22a.d
│       │   │           │           │   ├── markdown_composer-92ed6aab75cd22bb
│       │   │           │           │   ├── markdown_composer-92ed6aab75cd22bb.d
│       │   │           │           │   ├── markdown_composer-fdbb119b911a4046
│       │   │           │           │   ├── markdown_composer-fdbb119b911a4046.d
│       │   │           │           │   ├── matches-4aeef7d23e89289a.d
│       │   │           │           │   ├── matches-833c2c4d51183b7b.d
│       │   │           │           │   ├── memchr-1e22fc6d00c04df0.d
│       │   │           │           │   ├── memchr-3d12e12bb9bf5116.d
│       │   │           │           │   ├── memchr-556c9977f9427875.d
│       │   │           │           │   ├── mime-5ef8be73b6e9e64a.d
│       │   │           │           │   ├── mime-6087a79a173b7fb6.d
│       │   │           │           │   ├── mime-fd8f224c5ebf5af9.d
│       │   │           │           │   ├── mime_guess-0e68c9baa6bf0522.d
│       │   │           │           │   ├── mime_guess-d6bfca8de0139995.d
│       │   │           │           │   ├── mime_guess-fd3899c43b2ae180.d
│       │   │           │           │   ├── miniz_sys-49ad59b13fb55993.d
│       │   │           │           │   ├── miniz_sys-4ea7083b612bbefe.d
│       │   │           │           │   ├── miniz_sys-9ebb6659d6d2cdb8.d
│       │   │           │           │   ├── modifier-239988ac3532e42b.d
│       │   │           │           │   ├── modifier-98b77b47fe7f9898.d
│       │   │           │           │   ├── mount-a9dd4cc1f5848b4f.d
│       │   │           │           │   ├── mount-e66dfd554ad38ae1.d
│       │   │           │           │   ├── mount-e87d034b8111cabd.d
│       │   │           │           │   ├── num-2464e3f115589784.d
│       │   │           │           │   ├── num-cb983e8cdbe0e987.d
│       │   │           │           │   ├── num_cpus-005e6eb6cd71fa73.d
│       │   │           │           │   ├── num_cpus-3d6b36ee12c66f29.d
│       │   │           │           │   ├── num_cpus-c18aec78f840dbca.d
│       │   │           │           │   ├── num_integer-624ef1933165d949.d
│       │   │           │           │   ├── num_integer-c86b7e219dd6976c.d
│       │   │           │           │   ├── num_integer-d5eb7bbd276ddf83.d
│       │   │           │           │   ├── num_iter-8dcbd64b54dc20a2.d
│       │   │           │           │   ├── num_iter-f2fa83377dc2ef2b.d
│       │   │           │           │   ├── num_traits-45446b387d5047e5.d
│       │   │           │           │   ├── num_traits-871a4fcadf8549fd.d
│       │   │           │           │   ├── num_traits-9f24093bf088b6c1.d
│       │   │           │           │   ├── num_traits-b98020ecc01218d7.d
│       │   │           │           │   ├── ordered_float-1e576d5013fe8f03.d
│       │   │           │           │   ├── ordered_float-c1740041383a373c.d
│       │   │           │           │   ├── ordered_float-ca8d97b39c0fbc88.d
│       │   │           │           │   ├── percent_encoding-02c8917eedd513f0.d
│       │   │           │           │   ├── percent_encoding-7a8bae7514be74aa.d
│       │   │           │           │   ├── pest-5717699a28ec6aa0.d
│       │   │           │           │   ├── pest-7e71ac46aa57f8e7.d
│       │   │           │           │   ├── pest-ebcad2ebfb8c81a5.d
│       │   │           │           │   ├── pest_derive-408fb78939efdd02.d
│       │   │           │           │   ├── pest_derive-5ca63ce4cf7f239d.d
│       │   │           │           │   ├── pest_derive-5ce47561e713f4de.d
│       │   │           │           │   ├── phf-24558e41e8965a33.d
│       │   │           │           │   ├── phf-5677a1b5767070ed.d
│       │   │           │           │   ├── phf-cb83278788e3ebed.d
│       │   │           │           │   ├── phf_codegen-58fc07451458bea6.d
│       │   │           │           │   ├── phf_codegen-c5f6cf11b42e9832.d
│       │   │           │           │   ├── phf_codegen-caa444092a1d55b1.d
│       │   │           │           │   ├── phf_generator-7736f5f124a91dc4.d
│       │   │           │           │   ├── phf_generator-950daa3a05d7f239.d
│       │   │           │           │   ├── phf_generator-a3d2b723576fdf6c.d
│       │   │           │           │   ├── phf_shared-ba6ff8c8bbdcfaf2.d
│       │   │           │           │   ├── phf_shared-d76443840dddfef6.d
│       │   │           │           │   ├── phf_shared-ee39a6416ed1aaa0.d
│       │   │           │           │   ├── plugin-96c3d15270e47712.d
│       │   │           │           │   ├── plugin-9ec5aa182fb43d01.d
│       │   │           │           │   ├── proc_macro2-58e343f8ee2f3593.d
│       │   │           │           │   ├── pulldown_cmark-3d507a2d398eed0f.d
│       │   │           │           │   ├── pulldown_cmark-5f48fd78e207b466.d
│       │   │           │           │   ├── pulldown_cmark-9f00e677a5e54177.d
│       │   │           │           │   ├── quick_error-c898df68bd32cb70.d
│       │   │           │           │   ├── quick_error-d40f0d126a52a6c7.d
│       │   │           │           │   ├── quote-3cca359e759fa0d8.d
│       │   │           │           │   ├── quote-4b5518fb6d00a171.d
│       │   │           │           │   ├── quote-57f9c3d33cce9b4c.d
│       │   │           │           │   ├── rand-80dcd34270f302c8.d
│       │   │           │           │   ├── rand-a33b2ec292c86c16.d
│       │   │           │           │   ├── rand-d06422b8f89b4315.d
│       │   │           │           │   ├── rand-e7117b23b49b1e9e.d
│       │   │           │           │   ├── regex-130087211f928ad3.d
│       │   │           │           │   ├── regex-aa99691257b1a035.d
│       │   │           │           │   ├── regex-e2e51ad0e3e0b723.d
│       │   │           │           │   ├── regex_syntax-5d85aa8f236781ba.d
│       │   │           │           │   ├── regex_syntax-5f9a57a2c5eb9cb2.d
│       │   │           │           │   ├── regex_syntax-b44342623e0c3293.d
│       │   │           │           │   ├── rmp-0e51cf94231ab604.d
│       │   │           │           │   ├── rmp-127db9b721487fe2.d
│       │   │           │           │   ├── rmp-18b15fbee6516f8f.d
│       │   │           │           │   ├── rmp_serde-035eab872005f132.d
│       │   │           │           │   ├── rmp_serde-1af2fd82b282a3fc.d
│       │   │           │           │   ├── rmp_serde-fd151219f3ccdadf.d
│       │   │           │           │   ├── rustc_demangle-c800d04f2e87ca8a.d
│       │   │           │           │   ├── rustc_demangle-eee1da6fe9b363f6.d
│       │   │           │           │   ├── rustc_demangle-f1b9fd8cbbf62da0.d
│       │   │           │           │   ├── safemem-09f8afbf77eeedd0.d
│       │   │           │           │   ├── safemem-a189df975b5c5afd.d
│       │   │           │           │   ├── same_file-c92bd9b1ab292700.d
│       │   │           │           │   ├── same_file-d010225ae5a09d1d.d
│       │   │           │           │   ├── sequence_trie-62c7ceb92e615a9f.d
│       │   │           │           │   ├── sequence_trie-eaf72a304c332c72.d
│       │   │           │           │   ├── serde-1d53cfe3a3ecdfd7.d
│       │   │           │           │   ├── serde-4988bea5c2cf8796.d
│       │   │           │           │   ├── serde-fc123953f7b713b4.d
│       │   │           │           │   ├── serde_derive-6d7ac7f9f2c0a245.d
│       │   │           │           │   ├── serde_derive-ddc30972e593977b.d
│       │   │           │           │   ├── serde_derive-e3596893ab24a91c.d
│       │   │           │           │   ├── serde_derive_internals-15e8e17b5bd081fc.d
│       │   │           │           │   ├── serde_derive_internals-5c78287cd223cda3.d
│       │   │           │           │   ├── serde_json-112de609c516fa84.d
│       │   │           │           │   ├── serde_json-9ed42ffcc68da9f1.d
│       │   │           │           │   ├── serde_json-b25298dd40aa67e1.d
│       │   │           │           │   ├── serde_value-956d86e57834fdc1.d
│       │   │           │           │   ├── serde_value-bba89e100aab1a6a.d
│       │   │           │           │   ├── serde_value-e8424e72e97b4153.d
│       │   │           │           │   ├── serde_yaml-6d75199baa31c162.d
│       │   │           │           │   ├── serde_yaml-c447b6dc07cc5674.d
│       │   │           │           │   ├── serde_yaml-f7aae37c3e078577.d
│       │   │           │           │   ├── sha1-603a26c663602b8c.d
│       │   │           │           │   ├── sha1-879968bbcca291fd.d
│       │   │           │           │   ├── shlex-31c763da2a502e2d.d
│       │   │           │           │   ├── shlex-c2714093918d935d.d
│       │   │           │           │   ├── siphasher-8676af8a5c116f88.d
│       │   │           │           │   ├── siphasher-abbfdc968aa32639.d
│       │   │           │           │   ├── staticfile-50cb9b627e286437.d
│       │   │           │           │   ├── staticfile-9f097b7ba3edfbf7.d
│       │   │           │           │   ├── staticfile-fe58f1a0c0b7f757.d
│       │   │           │           │   ├── strsim-5cdc35fe7af8bf07.d
│       │   │           │           │   ├── strsim-63f96b0e61b9c45f.d
│       │   │           │           │   ├── strsim-754e49b0a0f1f257.d
│       │   │           │           │   ├── syn-02915e4ef025dd8b.d
│       │   │           │           │   ├── syn-a44e60fe20836d8d.d
│       │   │           │           │   ├── syn-be604022eace9052.d
│       │   │           │           │   ├── syn-f7bf4da4dd64ccb9.d
│       │   │           │           │   ├── synom-e60392ea99488643.d
│       │   │           │           │   ├── synom-fb0914a3d8164296.d
│       │   │           │           │   ├── textwrap-0952135c7b77b61d.d
│       │   │           │           │   ├── textwrap-f6614772f726d18e.d
│       │   │           │           │   ├── thread_local-81fbfa58ccd5a6e9.d
│       │   │           │           │   ├── thread_local-ea9dd4336c905c11.d
│       │   │           │           │   ├── time-2c60cb46cdba05f3.d
│       │   │           │           │   ├── time-3e875588a9788f53.d
│       │   │           │           │   ├── time-68c1e7ecad1e3d4a.d
│       │   │           │           │   ├── traitobject-3449ec392744c246.d
│       │   │           │           │   ├── traitobject-8ca36cda4d6dcaf9.d
│       │   │           │           │   ├── typeable-2bf798c470c8b1b7.d
│       │   │           │           │   ├── typeable-b3228f65cf5f4131.d
│       │   │           │           │   ├── typemap-c1dd20509670f7f7.d
│       │   │           │           │   ├── typemap-cf024416166bd68c.d
│       │   │           │           │   ├── ucd_util-2fa6be8f31594200.d
│       │   │           │           │   ├── unicase-450c89cf6c79f26b.d
│       │   │           │           │   ├── unicase-dfa7ad7ab4e2551d.d
│       │   │           │           │   ├── unicode_bidi-78e5e4c7667da33b.d
│       │   │           │           │   ├── unicode_bidi-a970e149e9dbbcb4.d
│       │   │           │           │   ├── unicode_normalization-1b04c098f93a8f08.d
│       │   │           │           │   ├── unicode_normalization-60738537dd5c27e7.d
│       │   │           │           │   ├── unicode_normalization-a1405d70b136e057.d
│       │   │           │           │   ├── unicode_width-cfc57006a7d6dc13.d
│       │   │           │           │   ├── unicode_width-fdf54158249adbce.d
│       │   │           │           │   ├── unicode_xid-6e4bc64e23e95afc.d
│       │   │           │           │   ├── unicode_xid-a1566504ffcb014d.d
│       │   │           │           │   ├── unicode_xid-ed340f58e921d9b5.d
│       │   │           │           │   ├── unreachable-7b409d7844ee3836.d
│       │   │           │           │   ├── unreachable-a8d07be79a0f3f3a.d
│       │   │           │           │   ├── unreachable-aac6dfdaee7a613b.d
│       │   │           │           │   ├── unreachable-df5db693122722d3.d
│       │   │           │           │   ├── unsafe_any-a8bb27a14398d33e.d
│       │   │           │           │   ├── unsafe_any-b9e4dbf89fdce58b.d
│       │   │           │           │   ├── url-381925bca0afcc76.d
│       │   │           │           │   ├── url-4269c1075468ee7d.d
│       │   │           │           │   ├── url-be4b8a3b7d3af779.d
│       │   │           │           │   ├── utf8_ranges-4e93fd38394516a0.d
│       │   │           │           │   ├── utf8_ranges-8096a1785a919a70.d
│       │   │           │           │   ├── vec_map-01307a6a4110e620.d
│       │   │           │           │   ├── vec_map-2620090de31a2ab6.d
│       │   │           │           │   ├── vec_map-b1a7ccb544fc9963.d
│       │   │           │           │   ├── version_check-01a60654f04cbb4c.d
│       │   │           │           │   ├── version_check-73842fd8b9911f84.d
│       │   │           │           │   ├── void-533777f1118872e4.d
│       │   │           │           │   ├── void-8fe8ca3283972eab.d
│       │   │           │           │   ├── walkdir-9c081475f9974b55.d
│       │   │           │           │   ├── walkdir-cc96a356fee977a9.d
│       │   │           │           │   ├── websocket-4ded63f71ef526fb.d
│       │   │           │           │   ├── websocket-51ce89ff7df6ad63.d
│       │   │           │           │   ├── websocket-e283ebbc91ff48e7.d
│       │   │           │           │   ├── yaml_rust-c40181ec7a1d029e.d
│       │   │           │           │   ├── yaml_rust-d5f405393779b771.d
│       │   │           │           │   └── yaml_rust-e9efd65e86dcfc49.d
│       │   │           │           ├── examples
│       │   │           │           ├── incremental
│       │   │           │           ├── markdown-composer
│       │   │           │           ├── markdown-composer.d
│       │   │           │           └── native
│       │   │           ├── vim-polyglot
│       │   │           │   ├── Gemfile
│       │   │           │   ├── Gemfile.lock
│       │   │           │   ├── README.md
│       │   │           │   ├── after
│       │   │           │   │   ├── ftdetect
│       │   │           │   │   │   └── rspec.vim
│       │   │           │   │   ├── ftplugin
│       │   │           │   │   │   ├── cabal.vim
│       │   │           │   │   │   ├── coffee.vim
│       │   │           │   │   │   ├── haskell.vim
│       │   │           │   │   │   ├── javascript.vim
│       │   │           │   │   │   ├── jsx.vim
│       │   │           │   │   │   ├── puppet.vim
│       │   │           │   │   │   ├── terraform.vim
│       │   │           │   │   │   └── yaml.vim
│       │   │           │   │   ├── indent
│       │   │           │   │   │   ├── html.vim
│       │   │           │   │   │   ├── jsx.vim
│       │   │           │   │   │   └── objc.vim
│       │   │           │   │   └── syntax
│       │   │           │   │       ├── c.vim
│       │   │           │   │       ├── coffee.vim
│       │   │           │   │       ├── cpp.vim
│       │   │           │   │       ├── haml.vim
│       │   │           │   │       ├── help.vim
│       │   │           │   │       ├── html.vim
│       │   │           │   │       ├── javascript
│       │   │           │   │       │   └── graphql.vim
│       │   │           │   │       ├── jsx.vim
│       │   │           │   │       ├── mma.vim
│       │   │           │   │       ├── objc.vim
│       │   │           │   │       ├── rspec.vim
│       │   │           │   │       ├── ruby.vim
│       │   │           │   │       ├── rust.vim
│       │   │           │   │       ├── tex.vim
│       │   │           │   │       ├── typescript
│       │   │           │   │       │   └── graphql.vim
│       │   │           │   │       └── yaml.vim
│       │   │           │   ├── autoload
│       │   │           │   │   ├── LaTeXtoUnicode.vim
│       │   │           │   │   ├── cargo.vim
│       │   │           │   │   ├── clojurecomplete.vim
│       │   │           │   │   ├── coffee.vim
│       │   │           │   │   ├── crystal_lang.vim
│       │   │           │   │   ├── dart.vim
│       │   │           │   │   ├── elixir
│       │   │           │   │   │   ├── indent.vim
│       │   │           │   │   │   └── util.vim
│       │   │           │   │   ├── elm
│       │   │           │   │   │   └── util.vim
│       │   │           │   │   ├── elm.vim
│       │   │           │   │   ├── fish.vim
│       │   │           │   │   ├── go
│       │   │           │   │   │   └── config.vim
│       │   │           │   │   ├── htmlcomplete.vim
│       │   │           │   │   ├── julia.vim
│       │   │           │   │   ├── julia_blocks.vim
│       │   │           │   │   ├── julia_latex_symbols.vim
│       │   │           │   │   ├── python
│       │   │           │   │   │   └── utils.vim
│       │   │           │   │   ├── racket.vim
│       │   │           │   │   ├── rubycomplete.vim
│       │   │           │   │   ├── rust.vim
│       │   │           │   │   ├── rustfmt.vim
│       │   │           │   │   ├── scss_indent.vim
│       │   │           │   │   ├── vifm
│       │   │           │   │   │   ├── edit.vim
│       │   │           │   │   │   └── globals.vim
│       │   │           │   │   ├── vital
│       │   │           │   │   │   ├── _crystal
│       │   │           │   │   │   │   ├── ColorEcho.vim
│       │   │           │   │   │   │   ├── Data
│       │   │           │   │   │   │   │   ├── List.vim
│       │   │           │   │   │   │   │   └── String.vim
│       │   │           │   │   │   │   ├── Process.vim
│       │   │           │   │   │   │   └── Web
│       │   │           │   │   │   │       └── JSON.vim
│       │   │           │   │   │   ├── _crystal.vim
│       │   │           │   │   │   ├── crystal.vim
│       │   │           │   │   │   └── crystal.vital
│       │   │           │   │   └── xml
│       │   │           │   │       ├── aria.vim
│       │   │           │   │       └── html5.vim
│       │   │           │   ├── build
│       │   │           │   ├── compiler
│       │   │           │   │   ├── cake.vim
│       │   │           │   │   ├── cargo.vim
│       │   │           │   │   ├── coffee.vim
│       │   │           │   │   ├── credo.vim
│       │   │           │   │   ├── cryptol.vim
│       │   │           │   │   ├── cucumber.vim
│       │   │           │   │   ├── eruby.vim
│       │   │           │   │   ├── eslint.vim
│       │   │           │   │   ├── exunit.vim
│       │   │           │   │   ├── fish.vim
│       │   │           │   │   ├── go.vim
│       │   │           │   │   ├── haml.vim
│       │   │           │   │   ├── ls.vim
│       │   │           │   │   ├── mix.vim
│       │   │           │   │   ├── nim.vim
│       │   │           │   │   ├── python.vim
│       │   │           │   │   ├── rake.vim
│       │   │           │   │   ├── rspec.vim
│       │   │           │   │   ├── ruby.vim
│       │   │           │   │   ├── rubyunit.vim
│       │   │           │   │   ├── rustc.vim
│       │   │           │   │   ├── sbt.vim
│       │   │           │   │   └── typescript.vim
│       │   │           │   ├── config.vim
│       │   │           │   ├── extras
│       │   │           │   │   ├── flow.vim
│       │   │           │   │   ├── jsdoc.vim
│       │   │           │   │   └── ngdoc.vim
│       │   │           │   ├── ftdetect
│       │   │           │   │   └── polyglot.vim
│       │   │           │   ├── ftplugin
│       │   │           │   │   ├── ansible.vim
│       │   │           │   │   ├── ansible_hosts.vim
│       │   │           │   │   ├── blade.vim
│       │   │           │   │   ├── caddyfile.vim
│       │   │           │   │   ├── clojure.vim
│       │   │           │   │   ├── coffee.vim
│       │   │           │   │   ├── cryptol
│       │   │           │   │   │   └── folding.vim
│       │   │           │   │   ├── crystal.vim
│       │   │           │   │   ├── cucumber.vim
│       │   │           │   │   ├── dart.vim
│       │   │           │   │   ├── eelixir.vim
│       │   │           │   │   ├── elixir.vim
│       │   │           │   │   ├── elm
│       │   │           │   │   │   └── tagbar.vim
│       │   │           │   │   ├── elm.vim
│       │   │           │   │   ├── ember-script.vim
│       │   │           │   │   ├── emblem.vim
│       │   │           │   │   ├── eruby.vim
│       │   │           │   │   ├── fish.vim
│       │   │           │   │   ├── git.vim
│       │   │           │   │   ├── gitcommit.vim
│       │   │           │   │   ├── gitconfig.vim
│       │   │           │   │   ├── gitrebase.vim
│       │   │           │   │   ├── gitsendemail.vim
│       │   │           │   │   ├── graphql.vim
│       │   │           │   │   ├── haml.vim
│       │   │           │   │   ├── html.vim
│       │   │           │   │   ├── i3.vim
│       │   │           │   │   ├── json.vim
│       │   │           │   │   ├── julia.vim
│       │   │           │   │   ├── latex-box
│       │   │           │   │   │   ├── common.vim
│       │   │           │   │   │   ├── complete.vim
│       │   │           │   │   │   ├── findmain.vim
│       │   │           │   │   │   ├── folding.vim
│       │   │           │   │   │   ├── latexmk.vim
│       │   │           │   │   │   ├── mappings.vim
│       │   │           │   │   │   └── motion.vim
│       │   │           │   │   ├── latextoc.vim
│       │   │           │   │   ├── less.vim
│       │   │           │   │   ├── liquid.vim
│       │   │           │   │   ├── litcoffee.vim
│       │   │           │   │   ├── ls.vim
│       │   │           │   │   ├── mail_vifm.vim
│       │   │           │   │   ├── mako.vim
│       │   │           │   │   ├── mma.vim
│       │   │           │   │   ├── mustache.vim
│       │   │           │   │   ├── nginx.vim
│       │   │           │   │   ├── nix.vim
│       │   │           │   │   ├── objc.vim
│       │   │           │   │   ├── ocaml.vim
│       │   │           │   │   ├── opencl.vim
│       │   │           │   │   ├── perl.vim
│       │   │           │   │   ├── plantuml.vim
│       │   │           │   │   ├── ps1.vim
│       │   │           │   │   ├── ps1xml.vim
│       │   │           │   │   ├── pug.vim
│       │   │           │   │   ├── puppet.vim
│       │   │           │   │   ├── purescript.vim
│       │   │           │   │   ├── qml.vim
│       │   │           │   │   ├── r.vim
│       │   │           │   │   ├── racket.vim
│       │   │           │   │   ├── raml.vim
│       │   │           │   │   ├── rhelp.vim
│       │   │           │   │   ├── rnoweb.vim
│       │   │           │   │   ├── ruby.vim
│       │   │           │   │   ├── rust.vim
│       │   │           │   │   ├── scala
│       │   │           │   │   │   └── tagbar.vim
│       │   │           │   │   ├── scala.vim
│       │   │           │   │   ├── scala.xpt.vim
│       │   │           │   │   ├── scss.vim
│       │   │           │   │   ├── slim.vim
│       │   │           │   │   ├── solidity.vim
│       │   │           │   │   ├── stylus.vim
│       │   │           │   │   ├── swift.vim
│       │   │           │   │   ├── tex_LatexBox.vim
│       │   │           │   │   ├── textile.vim
│       │   │           │   │   ├── tmux.vim
│       │   │           │   │   ├── toml.vim
│       │   │           │   │   ├── tt2html.vim
│       │   │           │   │   ├── twig.vim
│       │   │           │   │   ├── typescript.vim
│       │   │           │   │   ├── vifm-cmdedit.vim
│       │   │           │   │   ├── vifm-edit.vim
│       │   │           │   │   ├── vifm-rename.vim
│       │   │           │   │   ├── vifm.vim
│       │   │           │   │   ├── vue.vim
│       │   │           │   │   └── xs.vim
│       │   │           │   ├── indent
│       │   │           │   │   ├── Jenkinsfile.vim
│       │   │           │   │   ├── ansible.vim
│       │   │           │   │   ├── applescript.vim
│       │   │           │   │   ├── arduino.vim
│       │   │           │   │   ├── autohotkey.vim
│       │   │           │   │   ├── blade.vim
│       │   │           │   │   ├── cabal.vim
│       │   │           │   │   ├── caddyfile.vim
│       │   │           │   │   ├── clojure.vim
│       │   │           │   │   ├── cmake.vim
│       │   │           │   │   ├── coffee.vim
│       │   │           │   │   ├── crystal.vim
│       │   │           │   │   ├── cucumber.vim
│       │   │           │   │   ├── cython.vim
│       │   │           │   │   ├── dart.vim
│       │   │           │   │   ├── eelixir.vim
│       │   │           │   │   ├── elixir.vim
│       │   │           │   │   ├── elm.vim
│       │   │           │   │   ├── ember-script.vim
│       │   │           │   │   ├── emblem.vim
│       │   │           │   │   ├── erlang.vim
│       │   │           │   │   ├── eruby.vim
│       │   │           │   │   ├── fish.vim
│       │   │           │   │   ├── fsharp.vim
│       │   │           │   │   ├── gitconfig.vim
│       │   │           │   │   ├── glsl.vim
│       │   │           │   │   ├── go.vim
│       │   │           │   │   ├── gohtmltmpl.vim
│       │   │           │   │   ├── graphql.vim
│       │   │           │   │   ├── haml.vim
│       │   │           │   │   ├── handlebars.vim
│       │   │           │   │   ├── haskell.vim
│       │   │           │   │   ├── html.vim
│       │   │           │   │   ├── javascript.vim
│       │   │           │   │   ├── json.vim
│       │   │           │   │   ├── jst.vim
│       │   │           │   │   ├── julia.vim
│       │   │           │   │   ├── kotlin.vim
│       │   │           │   │   ├── less.vim
│       │   │           │   │   ├── liquid.vim
│       │   │           │   │   ├── litcoffee.vim
│       │   │           │   │   ├── ls.vim
│       │   │           │   │   ├── lua.vim
│       │   │           │   │   ├── mako.vim
│       │   │           │   │   ├── markdown.vim
│       │   │           │   │   ├── nginx.vim
│       │   │           │   │   ├── nim.vim
│       │   │           │   │   ├── nix.vim
│       │   │           │   │   ├── ocaml.vim
│       │   │           │   │   ├── opencl.vim
│       │   │           │   │   ├── perl.vim
│       │   │           │   │   ├── plantuml.vim
│       │   │           │   │   ├── proto.vim
│       │   │           │   │   ├── ps1.vim
│       │   │           │   │   ├── pug.vim
│       │   │           │   │   ├── puppet.vim
│       │   │           │   │   ├── purescript.vim
│       │   │           │   │   ├── python.vim
│       │   │           │   │   ├── qml.vim
│       │   │           │   │   ├── racket.vim
│       │   │           │   │   ├── ruby.vim
│       │   │           │   │   ├── rust.vim
│       │   │           │   │   ├── scala.vim
│       │   │           │   │   ├── slim.vim
│       │   │           │   │   ├── slime.vim
│       │   │           │   │   ├── solidity.vim
│       │   │           │   │   ├── stylus.vim
│       │   │           │   │   ├── swift.vim
│       │   │           │   │   ├── terraform.vim
│       │   │           │   │   ├── tex.vim
│       │   │           │   │   ├── twig.vim
│       │   │           │   │   ├── typescript.vim
│       │   │           │   │   ├── vala.vim
│       │   │           │   │   ├── velocity.vim
│       │   │           │   │   └── vue.vim
│       │   │           │   ├── plugin_guard.vim.template
│       │   │           │   ├── spec
│       │   │           │   │   ├── build_spec.rb
│       │   │           │   │   ├── loading_spec.rb
│       │   │           │   │   └── spec_helper.rb
│       │   │           │   └── syntax
│       │   │           │       ├── Jenkinsfile.vim
│       │   │           │       ├── ansible.vim
│       │   │           │       ├── ansible_hosts.vim
│       │   │           │       ├── apiblueprint.vim
│       │   │           │       ├── applescript.vim
│       │   │           │       ├── arduino.vim
│       │   │           │       ├── asciidoc.vim
│       │   │           │       ├── blade.vim
│       │   │           │       ├── c.vim
│       │   │           │       ├── cabal.vim
│       │   │           │       ├── caddyfile.vim
│       │   │           │       ├── carp.vim
│       │   │           │       ├── clojure.vim
│       │   │           │       ├── cmake.vim
│       │   │           │       ├── coffee.vim
│       │   │           │       ├── cpp.vim
│       │   │           │       ├── cql.vim
│       │   │           │       ├── cryptol.vim
│       │   │           │       ├── crystal.vim
│       │   │           │       ├── cucumber.vim
│       │   │           │       ├── dart.vim
│       │   │           │       ├── dockerfile.vim
│       │   │           │       ├── eelixir.vim
│       │   │           │       ├── elixir.vim
│       │   │           │       ├── elm.vim
│       │   │           │       ├── ember-script.vim
│       │   │           │       ├── emblem.vim
│       │   │           │       ├── erlang.vim
│       │   │           │       ├── eruby.vim
│       │   │           │       ├── ferm.vim
│       │   │           │       ├── fish.vim
│       │   │           │       ├── fsharp.vim
│       │   │           │       ├── git.vim
│       │   │           │       ├── gitcommit.vim
│       │   │           │       ├── gitconfig.vim
│       │   │           │       ├── gitrebase.vim
│       │   │           │       ├── gitsendemail.vim
│       │   │           │       ├── glsl.vim
│       │   │           │       ├── gmpl.vim
│       │   │           │       ├── gnuplot.vim
│       │   │           │       ├── go.vim
│       │   │           │       ├── godebugoutput.vim
│       │   │           │       ├── godebugstacktrace.vim
│       │   │           │       ├── godebugvariables.vim
│       │   │           │       ├── godefstack.vim
│       │   │           │       ├── gohtmltmpl.vim
│       │   │           │       ├── gotexttmpl.vim
│       │   │           │       ├── graphql.vim
│       │   │           │       ├── groovy.vim
│       │   │           │       ├── haml.vim
│       │   │           │       ├── haproxy.vim
│       │   │           │       ├── haskell.vim
│       │   │           │       ├── haxe.vim
│       │   │           │       ├── html
│       │   │           │       │   ├── aria.vim
│       │   │           │       │   ├── electron.vim
│       │   │           │       │   └── rdfa.vim
│       │   │           │       ├── html.vim
│       │   │           │       ├── i3.vim
│       │   │           │       ├── jasmine.vim
│       │   │           │       ├── javascript
│       │   │           │       │   └── html5.vim
│       │   │           │       ├── javascript.vim
│       │   │           │       ├── jinja2.vim
│       │   │           │       ├── json.vim
│       │   │           │       ├── json5.vim
│       │   │           │       ├── jst.vim
│       │   │           │       ├── julia.vim
│       │   │           │       ├── kotlin.vim
│       │   │           │       ├── latextoc.vim
│       │   │           │       ├── less.vim
│       │   │           │       ├── liquid.vim
│       │   │           │       ├── litcoffee.vim
│       │   │           │       ├── ls.vim
│       │   │           │       ├── lua.vim
│       │   │           │       ├── mako.vim
│       │   │           │       ├── markdown.vim
│       │   │           │       ├── mason.vim
│       │   │           │       ├── mma.vim
│       │   │           │       ├── mustache.vim
│       │   │           │       ├── nginx.vim
│       │   │           │       ├── nim.vim
│       │   │           │       ├── nix.vim
│       │   │           │       ├── ocaml.vim
│       │   │           │       ├── octave.vim
│       │   │           │       ├── opencl.vim
│       │   │           │       ├── perl.vim
│       │   │           │       ├── pgsql.vim
│       │   │           │       ├── php.vim
│       │   │           │       ├── plantuml.vim
│       │   │           │       ├── pod.vim
│       │   │           │       ├── proto.vim
│       │   │           │       ├── ps1.vim
│       │   │           │       ├── ps1xml.vim
│       │   │           │       ├── pug.vim
│       │   │           │       ├── puppet.vim
│       │   │           │       ├── purescript.vim
│       │   │           │       ├── python.vim
│       │   │           │       ├── qml.vim
│       │   │           │       ├── racket.vim
│       │   │           │       ├── ragel.vim
│       │   │           │       ├── raml.vim
│       │   │           │       ├── rhelp.vim
│       │   │           │       ├── rnoweb.vim
│       │   │           │       ├── ruby.vim
│       │   │           │       ├── rust.vim
│       │   │           │       ├── sbt.vim
│       │   │           │       ├── scala.vim
│       │   │           │       ├── scss.vim
│       │   │           │       ├── slim.vim
│       │   │           │       ├── slime.vim
│       │   │           │       ├── solidity.vim
│       │   │           │       ├── stylus.vim
│       │   │           │       ├── swift.vim
│       │   │           │       ├── sxhkdrc.vim
│       │   │           │       ├── systemd.vim
│       │   │           │       ├── tap.vim
│       │   │           │       ├── terraform.vim
│       │   │           │       ├── textile.vim
│       │   │           │       ├── thrift.vim
│       │   │           │       ├── tmux.vim
│       │   │           │       ├── tomdoc.vim
│       │   │           │       ├── toml.vim
│       │   │           │       ├── tt2.vim
│       │   │           │       ├── tt2html.vim
│       │   │           │       ├── tt2js.vim
│       │   │           │       ├── twig.vim
│       │   │           │       ├── typescript.vim
│       │   │           │       ├── vala.vim
│       │   │           │       ├── vbnet.vim
│       │   │           │       ├── vcl.vim
│       │   │           │       ├── velocity.vim
│       │   │           │       ├── vifm.vim
│       │   │           │       ├── vimgo.vim
│       │   │           │       ├── vue.vim
│       │   │           │       ├── xs.vim
│       │   │           │       └── xsl.vim
│       │   │           └── vim-tmux-navigator
│       │   │               ├── License.md
│       │   │               ├── README.md
│       │   │               ├── doc
│       │   │               │   ├── tags
│       │   │               │   └── tmux-navigator.txt
│       │   │               ├── pattern-check
│       │   │               ├── plugin
│       │   │               │   └── tmux_navigator.vim
│       │   │               └── vim-tmux-navigator.tmux
│       │   ├── plugin
│       │   │   ├── autocmds.vim
│       │   │   ├── mappings
│       │   │   │   ├── normal.vim
│       │   │   │   └── visual.vim
│       │   │   ├── sessions.vim
│       │   │   └── settings.vim
│       │   ├── spell
│       │   │   ├── en.utf-8.add
│       │   │   ├── en.utf-8.add.spl
│       │   │   ├── en.utf-8.spl
│       │   │   └── en.utf-8.sug
│       │   └── tmp
│       │       ├── backup
│       │       ├── sessions
│       │       │   ├── brew-services.vim
│       │       │   ├── crj.com.vim
│       │       │   ├── crj.vim
│       │       │   ├── dots.vim
│       │       │   ├── dropbear.vim
│       │       │   ├── fuse-ext2.rb.vim
│       │       │   ├── fuse-ext2.vim
│       │       │   ├── github-battle.vim
│       │       │   ├── kegcop.vim
│       │       │   ├── qemu.vim
│       │       │   ├── re.vim
│       │       │   └── react-tm.vim
│       │       ├── swap
│       │       ├── undo
        │       ├── views
│       │       │   └── dots.vim
│       │       └── viminfo
│       ├── vimrc
│       └── vimrc.pre-feb-26-2018
├── install.sh
├── jobs
│   ├── Linux
│   │   ├── etc
│   │   │   └── systemd
│   │   │       └── system
│   │   │           ├── xclip.socket
│   │   │           └── xclip@.service
│   │   ├── lib
│   │   │   └── systemd
│   │   │       └── system
│   │   │           └── postgresql.service
│   │   ├── pg_backup.config
│   │   ├── pg_backup.sh
│   │   ├── pg_backup_borked.sh
│   │   └── pg_backup_rotated.sh
│   ├── bin
│   │   ├── battery -> /opt/Code/dotfiles/terms/tmux/bin/battery
│   │   ├── colors-fish
│   │   ├── colors-lencioni
│   │   ├── colors-lencioni.orig
│   │   ├── colors-wincent
│   │   ├── colors-wincent.orig
│   │   ├── colors-zsh
│   │   ├── defunct
│   │   │   ├── tmux-session -> tmux_session.sh
│   │   │   ├── tmux_session -> tmux_session.sh
│   │   │   └── tmux_session.sh
│   │   ├── docker-uninstall-on-macos.sh
│   │   ├── dots.sh -> /opt/Code/dotfiles/terms/tmux/bin/dots.sh
│   │   ├── dpkg-gettext.pl
│   │   ├── dpkg-scanpackages-cydia
│   │   ├── jtool -> /opt/code/ios-dev/tools/jtool/jtool
│   │   ├── print_ls_colors
│   │   └── rm_ds_store_files.sh
│   ├── macOS
│   │   └── com.chrisrjones.rm_ds_store_files.plist
│   └── scripts
├── lang
│   ├── elixir
│   │   └── iex.exs
│   └── python
│       ├── pyenv
│       └── pystartup
├── mutt
│   └── muttrc
├── re
│   ├── gdb
│   ├── lldb
│   │   └── lldbinit
│   └── radare
│       └── radare2rc
├── shells
│   ├── bash -> /opt/Code/dotfiles/config/bash
│   ├── fish -> /opt/Code/dotfiles/config/fish
│   └── zsh -> /opt/Code/dotfiles/config/zsh
├── tags
├── terms
│   ├── Terminal-app
│   │   └── macOS-10.13.terminal
│   ├── alacritty
│   │   └── alacritty.yml
│   ├── hyper
│   │   └── hyper.js
│   ├── iterm2
│   │   └── com.googlecode.iterm2.plist
│   └── tmux
│       ├── bin
│       │   ├── battery
│       │   └── dots.sh
│       ├── tmux
│       │   ├── plugins
│       │   │   ├── tmux-resurrect
│       │   │   │   ├── CHANGELOG.md
│       │   │   │   ├── CONTRIBUTING.md
│       │   │   │   ├── LICENSE.md
│       │   │   │   ├── README.md
│       │   │   │   ├── docs
│       │   │   │   │   ├── custom_key_bindings.md
│       │   │   │   │   ├── migrating_from_tmuxinator.md
│       │   │   │   │   ├── restoring_pane_contents.md
│       │   │   │   │   ├── restoring_programs.md
│       │   │   │   │   ├── restoring_shell_history.md
│       │   │   │   │   ├── restoring_vim_and_neovim_sessions.md
│       │   │   │   │   └── save_dir.md
│       │   │   │   ├── lib
│       │   │   │   │   └── tmux-test
│       │   │   │   │       ├── CHANGELOG.md
│       │   │   │   │       ├── LICENSE.md
│       │   │   │   │       ├── README.md
│       │   │   │   │       ├── Vagrantfile
│       │   │   │   │       ├── run_framework_tests
│       │   │   │   │       ├── run_tests
│       │   │   │   │       ├── setup
│       │   │   │   │       ├── tests
│       │   │   │   │       │   ├── helpers
│       │   │   │   │       │   │   └── helpers.sh
│       │   │   │   │       │   ├── run_tests_in_isolation
│       │   │   │   │       │   ├── test_basic_script_execution.sh
│       │   │   │   │       │   ├── test_default_session_name.sh
│       │   │   │   │       │   └── test_tmux_scripting.sh
│       │   │   │   │       ├── vagrant_centos_provisioning.sh
│       │   │   │   │       └── vagrant_ubuntu_provisioning.sh
│       │   │   │   ├── resurrect.tmux
│       │   │   │   ├── run_tests -> lib/tmux-test/run_tests
│       │   │   │   ├── save_command_strategies
│       │   │   │   │   ├── gdb.sh
│       │   │   │   │   ├── pgrep.sh
│       │   │   │   │   └── ps.sh
│       │   │   │   ├── scripts
│       │   │   │   │   ├── check_tmux_version.sh
│       │   │   │   │   ├── helpers.sh
│       │   │   │   │   ├── process_restore_helpers.sh
│       │   │   │   │   ├── restore.exp
│       │   │   │   │   ├── restore.sh
│       │   │   │   │   ├── save.sh
│       │   │   │   │   ├── spinner_helpers.sh
│       │   │   │   │   ├── tmux_spinner.sh
│       │   │   │   │   └── variables.sh
│       │   │   │   ├── strategies
│       │   │   │   │   ├── irb_default_strategy.sh
│       │   │   │   │   ├── nvim_session.sh
│       │   │   │   │   └── vim_session.sh
│       │   │   │   ├── tests
│       │   │   │   │   ├── fixtures
│       │   │   │   │   │   ├── restore_file.txt
│       │   │   │   │   │   └── save_file.txt
│       │   │   │   │   ├── helpers
│       │   │   │   │   │   ├── create_and_save_tmux_test_environment.exp
│       │   │   │   │   │   ├── expect_helpers.exp
│       │   │   │   │   │   ├── helpers.sh -> ../../lib/tmux-test/tests/helpers/helpers.sh
│       │   │   │   │   │   ├── restore_and_save_tmux_test_environment.exp
│       │   │   │   │   │   └── resurrect_helpers.sh
│       │   │   │   │   ├── run_tests_in_isolation -> ../lib/tmux-test/tests/run_tests_in_isolation
│       │   │   │   │   ├── test_resurrect_restore.sh
│       │   │   │   │   └── test_resurrect_save.sh
│       │   │   │   └── video
│       │   │   │       ├── issue_vid.png
│       │   │   │       ├── screencast_img.png
│       │   │   │       └── script.md
│       │   │   └── tpm
│       │   │       ├── CHANGELOG.md
│       │   │       ├── HOW_TO_PLUGIN.md
│       │   │       ├── LICENSE.md
│       │   │       ├── README.md
│       │   │       ├── bin
│       │   │       │   ├── clean_plugins
│       │   │       │   ├── install_plugins
│       │   │       │   └── update_plugins
│       │   │       ├── bindings
│       │   │       │   ├── clean_plugins
│       │   │       │   ├── install_plugins
│       │   │       │   └── update_plugins
│       │   │       ├── docs
│       │   │       │   ├── automatic_tpm_installation.md
│       │   │       │   ├── changing_plugins_install_dir.md
│       │   │       │   ├── how_to_create_plugin.md
│       │   │       │   ├── managing_plugins_via_cmd_line.md
│       │   │       │   └── tpm_not_working.md
│       │   │       ├── lib
│       │   │       │   └── tmux-test
│       │   │       ├── scripts
│       │   │       │   ├── check_tmux_version.sh
│       │   │       │   ├── clean_plugins.sh
│       │   │       │   ├── helpers
│       │   │       │   │   ├── plugin_functions.sh
│       │   │       │   │   ├── shell_echo_functions.sh
│       │   │       │   │   ├── tmux_echo_functions.sh
│       │   │       │   │   ├── tmux_utils.sh
│       │   │       │   │   └── utility.sh
│       │   │       │   ├── install_plugins.sh
│       │   │       │   ├── source_plugins.sh
│       │   │       │   ├── update_plugin.sh
│       │   │       │   ├── update_plugin_prompt_handler.sh
│       │   │       │   └── variables.sh
│       │   │       ├── tests
│       │   │       │   ├── expect_failed_plugin_download
│       │   │       │   ├── expect_successful_clean_plugins
│       │   │       │   ├── expect_successful_multiple_plugins_download
│       │   │       │   ├── expect_successful_plugin_download
│       │   │       │   ├── expect_successful_update_of_a_single_plugin
│       │   │       │   ├── expect_successful_update_of_all_plugins
│       │   │       │   ├── helpers
│       │   │       │   │   └── tpm.sh
│       │   │       │   ├── test_plugin_clean.sh
│       │   │       │   ├── test_plugin_installation.sh
│       │   │       │   ├── test_plugin_installation_legacy.sh
│       │   │       │   ├── test_plugin_sourcing.sh
│       │   │       │   └── test_plugin_update.sh
│       │   │       └── tpm
│       │   ├── resurrect
        │   └── tmux.macos.conf
│       ├── tmux-256color.terminfo
│       ├── tmux.conf
│       └── xterm-256color-italic.terminfo
└── tmp

705 directories, 3022 files

</pre>
</details>

<a href="useful-links"></a>

## Useful Links ___in no particular order___
- [Github - philtr/dotfiles](https://github.com/philtr/dotfiles)
- [Github - wincent/wincent](https://github.com/wincent/wincent)
- [Github - mathiasbynenes/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Github - Awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)

<a href="todos"></a>

## TODOs
- [x] ~~migrate all installed apps to be installed using homebrew / linuxbrew~~
- [ ] spend some time working with hammerspoon
- [x] ~~troubleshoot why italics isn't working in (n)vim.~~
- [ ] Write an install script for easy installation of dotfiles.
- [x] ~~Add a collection of inspirational dotfile repos.~~
- [x] ~~Add images in the lib dir of this repo to the .wiki submodule repo.~~
- [x] ~~Figure out why cloning the dotfiles repo is cloning the submodules with detached heads~~ see [this](https://stackoverflow.com/a/20797186/70880) for detailed explanation.
### Neovim
  - [ ] Figure out a way to save fold settings across all open buffers when quiting Vim.
  - [ ] Figure out why folds are only being saved / preserved for the last open buffer when quiting Vim 🤔
  - [ ] Vim Sesssions, Folds, and Conceals will be the death of me 💀
  - [x] ~~don't create session files when launching a man page~~
  - [x] ~~Figure out a sane solution for previewing markdown ie. .md documents~~
  - [x] ~~Figure out what is causing lines to be hard wrapped! 😖~~
### Fish
  - [x] ~~Figure out why `grc` is borking PATH on Linux 😑~~

<a href="contact"></a>

## Contact
- GithHub: [@ipatch](https://github.com/ipatch)<br />
- Twitter: [@truckmonth](https://twitter.com/truckmonth)
- GitLab: [@truckmonth](https://gitlab.com/truckmonth)

