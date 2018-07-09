<!-- -->

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

### [Fish Shell](https://github.com/fish-shell/fish-shell)

> To symlink the fish-shell configuration directory with supporting files.

```sh
ln -sf $dots/config/fish $HOME/.config/fish
```

<a href="file-structure"></a>

## File Structure

> Certain files and folders have been omitted for brevity and security

<details>
<summary>File Structure</summary>
<pre>
.
├── .git-crypt
│   ├── .gitattributes
│   └── keys
│       └── default
│           └── 0
├── .gitattributes
├── .github
│   ├── CONTRIBUTING.md
│   ├── ISSUE_TEMPLATE.md
│   └── PULL_REQUEST_TEMPLATE.md
├── .gitignore
├── .gitmodules
├── .wiki
│   ├── .gitignore
│   ├── Home.md
│   ├── _Footer.md
│   ├── _Sidebar.md
│   ├── asdf-version-manager-Notes.md
│   ├── bind9-Notes.md
│   ├── creating-a-custom-motd-on-Debian-Jessie.md
│   ├── email-client-Notes.md
│   ├── email-server-setup-Notes.md
│   ├── emoji-side-quest.md
│   ├── fish-shell-Notes.md
│   ├── git-Notes.md
│   ├── git-it-got-it-good.md
│   ├── graphics-and-image-processing.md
│   ├── gui-text-editor-Notes.md
│   ├── homebrew-and-linuxbrew-formula-Notes.md
│   ├── lib
│   │   ├── Neovim-2018-april-late.png
│   │   ├── Neovim-2018-april.png
│   │   ├── abe.circle.png
│   │   ├── abe.png
│   │   ├── abe.tmp.png
│   │   ├── abe.tmp.xcf
│   │   ├── custom-motd.png
│   │   ├── fish-tab-completions.png
│   │   └── vim-2017.png
│   ├── linux-macos-administration-Notes.md
│   ├── linux-macos-troubleshooting-Notes.md
│   ├── macbookpro-late-2013-Notes.md
│   ├── nodejs-Notes.md
│   ├── python-Notes.md
│   ├── qemu-Notes.md
│   ├── radare-Notes.md
│   ├── raspberry-pi-Notes.md
│   ├── tags
│   ├── terminal-emulators.md
│   ├── tmux-Notes.md
│   ├── vim-neovim-Notes.md
│   ├── web-browser-Notes.md
│   ├── weechat-Notes.md
│   ├── windows-Notes.md
│   ├── working-with-video.md
│   └── yarn-notes.md
├── LICENSE
├── README.md
├── asdf
│   ├── .default-npm-packages
│   ├── .tool-versions.nathan.capin
│   ├── .tool-versions.nathan.root
│   ├── README.md
│   └── tool-versions.rogue.capin
├── config
│   ├── OS
│   │   ├── Debian
│   │   │   └── etc
│   │   │       └── profile
│   │   └── macOS
│   │       └── 10.13
│   │           └── etc
│   │               └── profile
│   ├── apt
│   │   └── nathan.stretch.package-list.txt
│   ├── atom
│   │   └── packages.list
│   ├── base16-shell -> /opt/code/github/base16-shell/
│   ├── bash
│   │   ├── .gitkeep
│   │   ├── bash_profile
│   │   ├── bashrc
│   │   └── functions
│   │       ├── .gitkeep
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
│   │   │       ├── .gitkeep
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
│   │       │   ├── gnu-coreutils
│   │       │   │   └── dir_colors
│   │       │   └── npm-global-packages.txt
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
│   │   │   ├── docker.fish
│   │   │   └── rustup.fish
│   │   ├── conf.d
│   │   │   ├── 001_load_paths.fish
│   │   │   ├── 002_load_ls_colors.fish
│   │   │   ├── 005_omf.fish
│   │   │   ├── 007_load_pyen.fish
│   │   │   └── 008_load_gpg-agent.fish
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
│   │   │               └── lib
│   │   │                   ├── fish-shell-lambda-theme.png
│   │   │                   ├── virtualenv-double-prompt.png
│   │   │                   └── virtualenv.png
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
│   │   │           ├── .travis.yml
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
│   │   ├── git-templates
│   │   │   └── hooks
│   │   │       ├── legacy.pre-commit
│   │   │       ├── post-checkout
│   │   │       ├── pre-commit
│   │   │       └── pre-commit.d
│   │   │           └── 01-crypto.sh
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
│   │   │       └── .gitkeep
│   │   └── karabiner.json
│   ├── mpv
│   │   ├── input.conf
│   │   ├── mpv.conf
│   │   └── watch_later
│   ├── nvim
│   │   ├── autoload
│   │   │   └── .gitkeep
│   │   ├── init.vim
│   │   └── pack
│   │       └── minpac
│   │           ├── opt
│   │           │   └── .gitkeep
│   │           └── start
│   │               └── .gitkeep
│   ├── pt
│   │   └── config.toml
│   ├── vscode
│   │   ├── keybindings.json
│   │   └── settings.json
│   └── zsh
│       ├── functions
│       │   └── .fzf.zsh
│       ├── zlogin
│       ├── zshenv
│       └── zshrc
├── editors
│   ├── atom -> /opt/Code/dotfiles/config/atom
│   ├── code -> /opt/Code/dotfiles/config/code
│   ├── ctags
│   ├── nvim -> /opt/Code/dotfiles/config/nvim
│   └── vim
│       ├── README.md
│       ├── editorconfig
│       ├── init.vim -> /opt/Code/dotfiles/config/nvim/init.vim
│       ├── vim
│       │   ├── .base16
│       │   ├── .base16.previous
│       │   ├── after
│       │   │   ├── .gitkeep
│       │   │   ├── ftplugin
│       │   │   │   ├── bash
│       │   │   │   │   └── bash.vim
│       │   │   │   ├── fish
│       │   │   │   │   └── fish.vim
│       │   │   │   ├── html.vim
│       │   │   │   ├── javascript
│       │   │   │   │   ├── folding.vim
│       │   │   │   │   └── javascript.vim
│       │   │   │   ├── markdown
│       │   │   │   │   ├── folding.vim
│       │   │   │   │   └── markdown.vim
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
│       │   │   └── .gitkeep
│       │   ├── pack
│       │   │   ├── .gitkeep
│       │   │   └── minpac
│       │   │       ├── .gitkeep
│       │   │       ├── opt
│       │   │       │   ├── .gitkeep
│       │   │       │   └── minpac
│       │   │       │       ├── .gitignore
│       │   │       │       ├── .travis.yml
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
│       │   │       │       │   ├── .gitignore
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
│       │   │           ├── LanguageClient-neovim
│       │   │           │   ├── .circleci
│       │   │           │   │   └── config.yml
│       │   │           │   ├── .github
│       │   │           │   │   ├── CONTRIBUTING.md
│       │   │           │   │   └── ISSUE_TEMPLATE.md
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
│       │   │           │   ├── .vim
│       │   │           │   │   └── settings.json
│       │   │           │   ├── Cargo.lock
│       │   │           │   ├── Cargo.toml
│       │   │           │   ├── INSTALL.md
│       │   │           │   ├── LICENSE.txt
│       │   │           │   ├── Makefile
│       │   │           │   ├── README.md
│       │   │           │   ├── TODO.md
│       │   │           │   ├── autoload
│       │   │           │   │   ├── LSP.vim
│       │   │           │   │   ├── LanguageClient.vim
│       │   │           │   │   └── health
│       │   │           │   │       └── LanguageClient.vim
│       │   │           │   ├── bin
│       │   │           │   │   ├── .gitignore
│       │   │           │   │   └── languageclient
│       │   │           │   ├── build.rs
│       │   │           │   ├── ci
│       │   │           │   │   ├── Dockerfile
│       │   │           │   │   ├── before_deploy.sh
│       │   │           │   │   ├── cleanup-binary-tags.py
│       │   │           │   │   ├── install.sh
│       │   │           │   │   └── script.sh
│       │   │           │   ├── doc
│       │   │           │   │   ├── LanguageClient.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── install.ps1
│       │   │           │   ├── install.sh
│       │   │           │   ├── min-init.vim
│       │   │           │   ├── plugin
│       │   │           │   │   └── LanguageClient.vim
│       │   │           │   ├── rplugin
│       │   │           │   │   └── python3
│       │   │           │   │       ├── .gitignore
│       │   │           │   │       ├── denite
│       │   │           │   │       │   └── source
│       │   │           │   │       │       ├── codeAction.py
│       │   │           │   │       │       ├── contextMenu.py
│       │   │           │   │       │       ├── documentSymbol.py
│       │   │           │   │       │       ├── references.py
│       │   │           │   │       │       └── workspaceSymbol.py
│       │   │           │   │       └── deoplete
│       │   │           │   │           └── sources
│       │   │           │   │               ├── LanguageClientSource.py
│       │   │           │   │               └── __pycache__
│       │   │           │   ├── src
│       │   │           │   │   ├── languageclient.rs
│       │   │           │   │   ├── logger.rs
│       │   │           │   │   ├── main.rs
│       │   │           │   │   ├── rpchandler.rs
│       │   │           │   │   ├── types.rs
│       │   │           │   │   ├── utils.rs
│       │   │           │   │   └── vim.rs
│       │   │           │   └── tests
│       │   │           │       ├── LanguageClient_test.py
│       │   │           │       ├── data
│       │   │           │       │   ├── .vim
│       │   │           │       │   │   └── autoload
│       │   │           │       │   │       └── .gitignore
│       │   │           │       │   ├── sample-cpp
│       │   │           │       │   │   ├── .gitignore
│       │   │           │       │   │   ├── .vim
│       │   │           │       │   │   │   └── settings.json
│       │   │           │       │   │   ├── CMakeLists.txt
│       │   │           │       │   │   ├── compile_commands.json
│       │   │           │       │   │   ├── glfwtest.cpp
│       │   │           │       │   │   ├── include-completion.c
│       │   │           │       │   │   └── main.cpp
│       │   │           │       │   ├── sample-cs
│       │   │           │       │   │   ├── Solution.cs
│       │   │           │       │   │   └── Solution.csproj
│       │   │           │       │   ├── sample-go
│       │   │           │       │   │   └── simple.go
│       │   │           │       │   ├── sample-hs
│       │   │           │       │   │   └── main.hs
│       │   │           │       │   ├── sample-java
│       │   │           │       │   │   ├── .gitignore
│       │   │           │       │   │   ├── pom.xml
│       │   │           │       │   │   └── src
│       │   │           │       │   │       ├── main
│       │   │           │       │   │       │   └── java
│       │   │           │       │   │       │       └── app
│       │   │           │       │   │       │           └── App.java
│       │   │           │       │   │       └── test
│       │   │           │       │   │           └── java
│       │   │           │       │   │               └── app
│       │   │           │       │   │                   └── AppTest.java
│       │   │           │       │   ├── sample-js
│       │   │           │       │   │   ├── package.json
│       │   │           │       │   │   └── src
│       │   │           │       │   │       ├── index.js
│       │   │           │       │   │       └── libs.js
│       │   │           │       │   ├── sample-php
│       │   │           │       │   │   ├── composer.json
│       │   │           │       │   │   └── main.php
│       │   │           │       │   ├── sample-py
│       │   │           │       │   │   ├── sample.py
│       │   │           │       │   │   └── setup.py
│       │   │           │       │   ├── sample-rs
│       │   │           │       │   │   ├── .gitignore
│       │   │           │       │   │   ├── .vim
│       │   │           │       │   │   │   └── settings.json
│       │   │           │       │   │   ├── Cargo.toml
│       │   │           │       │   │   └── src
│       │   │           │       │   │       ├── libs.rs
│       │   │           │       │   │       └── main.rs
│       │   │           │       │   ├── sample-ts
│       │   │           │       │   │   ├── index.ts
│       │   │           │       │   │   ├── package.json
│       │   │           │       │   │   └── src
│       │   │           │       │   │       └── codeAction.ts
│       │   │           │       │   ├── sample-yaml
│       │   │           │       │   │   └── ansible.yaml
│       │   │           │       │   └── vimrc
│       │   │           │       ├── test.sh
│       │   │           │       └── wrapper-server.sh
│       │   │           ├── ale
│       │   │           │   ├── .appveyor.yml
│       │   │           │   ├── .editorconfig
│       │   │           │   ├── .gitattributes
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
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
│       │   │           │   │   ├── cloudformation
│       │   │           │   │   │   └── cfn_python_lint.vim
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
│       │   │           │   │   │   ├── dogma.vim
│       │   │           │   │   │   └── mix.vim
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
│       │   │           │   │   │   ├── tsserver.vim
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
│       │   │           │   │   │   │   ├── qmlfmt.vim
│       │   │           │   │   │   │   ├── refmt.vim
│       │   │           │   │   │   │   ├── rubocop.vim
│       │   │           │   │   │   │   ├── rufo.vim
│       │   │           │   │   │   │   ├── rustfmt.vim
│       │   │           │   │   │   │   ├── scalafmt.vim
│       │   │           │   │   │   │   ├── shfmt.vim
│       │   │           │   │   │   │   ├── standard.vim
│       │   │           │   │   │   │   ├── stylelint.vim
│       │   │           │   │   │   │   ├── swiftformat.vim
│       │   │           │   │   │   │   ├── tidy.vim
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
│       │   │           │   │   │   ├── lsp_linter.vim
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
│       │   │           │   │   ├── ale-cloudformation.txt
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
│       │   │           │       ├── .config
│       │   │           │       │   └── nvim
│       │   │           │       │       └── init.vim -> ../../vimrc
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
│       │   │           │       │   │   └── .packages
│       │   │           │       │   ├── htmlhint_paths
│       │   │           │       │   │   ├── node_modules
│       │   │           │       │   │   │   └── .bin
│       │   │           │       │   │   │       └── htmlhint
│       │   │           │       │   │   └── with_config
│       │   │           │       │   │       └── .htmlhintrc
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
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── lessc
│       │   │           │       │   ├── mix_paths
│       │   │           │       │   │   └── wrapped_project
│       │   │           │       │   │       └── mix.exs
│       │   │           │       │   ├── ols_paths
│       │   │           │       │   │   ├── .merlin
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── ocaml-language-server
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
│       │   │           │       │   │   │   └── .bin
│       │   │           │       │   │   │       └── pug-lint
│       │   │           │       │   │   ├── package.json
│       │   │           │       │   │   ├── puglint_rc_dir
│       │   │           │       │   │   │   └── .pug-lintrc
│       │   │           │       │   │   ├── puglint_rc_js_dir
│       │   │           │       │   │   │   └── .pug-lintrc.js
│       │   │           │       │   │   └── puglint_rc_json_dir
│       │   │           │       │   │       └── .pug-lintrc.json
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
│       │   │           │       │   │       │   └── .style.yapf
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
│       │   │           │       │   │       └── .rubocop.yml
│       │   │           │       │   ├── rust-rls-project
│       │   │           │       │   │   └── Cargo.toml
│       │   │           │       │   ├── scala_paths
│       │   │           │       │   │   └── dummy.scala
│       │   │           │       │   ├── standard-test-files
│       │   │           │       │   │   ├── with-bin
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   │       └── .bin
│       │   │           │       │   │   │           └── standard
│       │   │           │       │   │   └── with-cmd
│       │   │           │       │   │       └── node_modules
│       │   │           │       │   │           └── standard
│       │   │           │       │   │               └── bin
│       │   │           │       │   │                   └── cmd.js
│       │   │           │       │   ├── stylelint_paths
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── stylelint
│       │   │           │       │   ├── swaglint_paths
│       │   │           │       │   │   ├── docs
│       │   │           │       │   │   │   └── swagger.yaml
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── swaglint
│       │   │           │       │   ├── swift_paths
│       │   │           │       │   │   └── dummy.swift
│       │   │           │       │   ├── textlint_paths
│       │   │           │       │   │   ├── with_bin_path
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   │       └── .bin
│       │   │           │       │   │   │           └── textlint
│       │   │           │       │   │   └── with_textlint_bin_path
│       │   │           │       │   │       └── node_modules
│       │   │           │       │   │           └── textlint
│       │   │           │       │   │               └── bin
│       │   │           │       │   │                   └── textlint.js
│       │   │           │       │   ├── tidy_paths
│       │   │           │       │   │   ├── .tidyrc
│       │   │           │       │   │   ├── test.html
│       │   │           │       │   │   ├── tidy
│       │   │           │       │   │   └── tidy.exe
│       │   │           │       │   ├── write-good-node-modules
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── write-good
│       │   │           │       │   └── write-good-node-modules-2
│       │   │           │       │       └── node_modules
│       │   │           │       │           └── write-good
│       │   │           │       │               └── bin
│       │   │           │       │                   └── write-good.js
│       │   │           │       ├── completion
│       │   │           │       ├── csslint-test-files
│       │   │           │       │   ├── other-app
│       │   │           │       │   │   └── testfile.css
│       │   │           │       │   └── some-app
│       │   │           │       │       ├── .csslintrc
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
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── elm
│       │   │           │       │   ├── node_modules
│       │   │           │       │   │   └── .bin
│       │   │           │       │   │       └── elm-format
│       │   │           │       │   └── src
│       │   │           │       │       └── subdir
│       │   │           │       │           └── testfile.elm
│       │   │           │       ├── eslint-test-files
│       │   │           │       │   ├── app-with-eslint-d
│       │   │           │       │   │   └── node_modules
│       │   │           │       │   │       └── .bin
│       │   │           │       │   │           └── eslint_d
│       │   │           │       │   ├── node_modules
│       │   │           │       │   │   └── .bin
│       │   │           │       │   │       └── eslint
│       │   │           │       │   ├── other-app
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── testfile.js
│       │   │           │       │   ├── package.json
│       │   │           │       │   └── react-app
│       │   │           │       │       ├── .eslintrc.js
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
│       │   │           │       │       │   └── .eslintrc
│       │   │           │       │       └── subdir-with-package-json
│       │   │           │       │           └── package.json
│       │   │           │       ├── fix
│       │   │           │       ├── fixers
│       │   │           │       │   ├── eslint-test-files
│       │   │           │       │   │   ├── app-with-eslint-d
│       │   │           │       │   │   │   └── node_modules
│       │   │           │       │   │   │       └── .bin
│       │   │           │       │   │   │           └── eslint_d
│       │   │           │       │   │   ├── node_modules
│       │   │           │       │   │   │   └── .bin
│       │   │           │       │   │   │       └── eslint
│       │   │           │       │   │   ├── other-app
│       │   │           │       │   │   │   └── subdir
│       │   │           │       │   │   │       └── testfile.js
│       │   │           │       │   │   └── react-app
│       │   │           │       │   │       ├── .eslintrc.js
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
│       │   │           │       │   └── long-line-project
│       │   │           │       │       └── setup.cfg
│       │   │           │       ├── flow
│       │   │           │       │   ├── a
│       │   │           │       │   │   ├── .flowconfig
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
│       │   │           │       │   │   ├── .haml-lint.yml
│       │   │           │       │   │   ├── .rubocop.yml
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── file.haml
│       │   │           │       │   ├── haml-lint-yml
│       │   │           │       │   │   ├── .haml-lint.yml
│       │   │           │       │   │   └── subdir
│       │   │           │       │   │       └── file.haml
│       │   │           │       │   └── rubocop-yml
│       │   │           │       │       ├── .rubocop.yml
│       │   │           │       │       └── subdir
│       │   │           │       │           └── file.haml
│       │   │           │       ├── handler
│       │   │           │       ├── javascript_files
│       │   │           │       │   └── test.js
│       │   │           │       ├── json_files
│       │   │           │       │   └── testfile.json
│       │   │           │       ├── lsp
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
│       │   │           │       │   ├── testfile
│       │   │           │       │   ├── testfile.css
│       │   │           │       │   ├── testfile.js
│       │   │           │       │   ├── testfile.json
│       │   │           │       │   ├── testfile.scss
│       │   │           │       │   ├── testfile.ts
│       │   │           │       │   └── with_config
│       │   │           │       │       ├── .prettierrc
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
│       │   │           │       ├── slimlint-test-files
│       │   │           │       │   ├── .rubocop.yml
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
│       │   │           │       ├── tflint-test-files
│       │   │           │       │   └── foo
│       │   │           │       │       ├── .tflint.hcl
│       │   │           │       │       └── bar.tf
│       │   │           │       ├── top
│       │   │           │       │   ├── ale-special-directory-name-dont-use-this-please
│       │   │           │       │   │   └── empty-file
│       │   │           │       │   ├── example.ini
│       │   │           │       │   └── middle
│       │   │           │       │       └── bottom
│       │   │           │       │           └── dummy.txt
│       │   │           │       ├── util
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
│       │   │           │   ├── .github
│       │   │           │   │   └── ISSUE_TEMPLATE.md
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
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
│       │   │           │   │           ├── child.py
│       │   │           │   │           ├── deoplete.py
│       │   │           │   │           ├── dp_main.py
│       │   │           │   │           ├── exceptions.py
│       │   │           │   │           ├── filter
│       │   │           │   │           │   ├── __pycache__
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
│       │   │           │   ├── .github
│       │   │           │   │   └── ISSUE_TEMPLATE.md
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
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
│       │   │           │   │   └── test_go.rb
│       │   │           │   └── uninstall
│       │   │           ├── fzf.vim
│       │   │           │   ├── .github
│       │   │           │   │   └── ISSUE_TEMPLATE.md
│       │   │           │   ├── .gitignore
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
│       │   │           │   ├── .gitattributes
│       │   │           │   ├── .gitignore
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
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
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
│       │   │           │       ├── .themisrc
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
│       │   │           ├── rust.vim
│       │   │           │   ├── .gitignore
│       │   │           │   ├── LICENSE-APACHE
│       │   │           │   ├── LICENSE-MIT
│       │   │           │   ├── README.md
│       │   │           │   ├── after
│       │   │           │   │   └── syntax
│       │   │           │   │       └── rust.vim
│       │   │           │   ├── autoload
│       │   │           │   │   ├── cargo.vim
│       │   │           │   │   ├── rust.vim
│       │   │           │   │   └── rustfmt.vim
│       │   │           │   ├── compiler
│       │   │           │   │   ├── cargo.vim
│       │   │           │   │   └── rustc.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── rust.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── ftdetect
│       │   │           │   │   └── rust.vim
│       │   │           │   ├── ftplugin
│       │   │           │   │   └── rust.vim
│       │   │           │   ├── indent
│       │   │           │   │   └── rust.vim
│       │   │           │   ├── plugin
│       │   │           │   │   └── rust.vim
│       │   │           │   ├── syntax
│       │   │           │   │   └── rust.vim
│       │   │           │   └── syntax_checkers
│       │   │           │       └── rust
│       │   │           │           ├── cargo.vim
│       │   │           │           └── rustc.vim
│       │   │           ├── vim-commentary
│       │   │           │   ├── .gitignore
│       │   │           │   ├── CONTRIBUTING.markdown
│       │   │           │   ├── README.markdown
│       │   │           │   ├── doc
│       │   │           │   │   ├── commentary.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── commentary.vim
│       │   │           ├── vim-fugitive
│       │   │           │   ├── .gitattributes
│       │   │           │   ├── .gitignore
│       │   │           │   ├── CONTRIBUTING.markdown
│       │   │           │   ├── README.markdown
│       │   │           │   ├── autoload
│       │   │           │   │   └── fugitive.vim
│       │   │           │   ├── doc
│       │   │           │   │   ├── fugitive.txt
│       │   │           │   │   └── tags
│       │   │           │   ├── ftdetect
│       │   │           │   │   └── fugitive.vim
│       │   │           │   └── plugin
│       │   │           │       └── fugitive.vim
│       │   │           ├── vim-highlightedyank
│       │   │           │   ├── .gitignore
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
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .gitmodules
│       │   │           │   ├── .travis.yml
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
│       │   │           │   └── src
│       │   │           │       └── main.rs
│       │   │           ├── vim-polyglot
│       │   │           │   ├── .gitattributes
│       │   │           │   ├── .gitignore
│       │   │           │   ├── .travis.yml
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
│       │   │               ├── .gitignore
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
│       │   │   ├── mappings.vim
│       │   │   ├── plugin_ale.vim
│       │   │   ├── plugin_deoplete.vim
│       │   │   ├── plugin_fzf.vim
│       │   │   ├── plugin_indent_line.vim
│       │   │   ├── plugin_language_client.vim
│       │   │   ├── plugin_lightline.vim
│       │   │   ├── plugin_vim_commentary.vim
│       │   │   ├── sessions.vim
│       │   │   └── settings.vim
│       │   └── spell
│       │       ├── en.utf-8.add
│       │       ├── en.utf-8.add.spl
│       │       ├── en.utf-8.spl
│       │       └── en.utf-8.sug
│       ├── vimrc
│       └── vimrc.pre-feb-26-2018
├── install.sh
├── jobs
│   ├── Linux
│   │   ├── etc
│   │   │   ├── .gitkeep
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
│   │   ├── brew-updatedb.sh
│   │   ├── colors-fish
│   │   ├── colors-lencioni
│   │   ├── colors-lencioni.orig
│   │   ├── colors-wincent
│   │   ├── colors-wincent.orig
│   │   ├── colors-zsh
│   │   ├── colortest -> /opt/Code/dotfiles/config/base16-shell/colortest
│   │   ├── defunct
│   │   │   └── tmux_session.sh
│   │   ├── docker-uninstall-on-macos.sh
│   │   ├── dots.sh -> /opt/Code/dotfiles/terms/tmux/bin/dots.sh
│   │   ├── dpkg-gettext.pl
│   │   ├── dpkg-scanpackages-cydia
│   │   ├── jtool -> /opt/code/ios-dev/tools/jtool/jtool
│   │   ├── print_ls_colors
│   │   └── rm_ds_store_files.sh
│   ├── macOS
│   │   ├── com.chrisrjones.brew-updateb.plist
│   │   └── com.chrisrjones.rm_ds_store_files.plist
│   └── scripts
├── lang
│   ├── elixir
│   │   └── iex.exs
│   ├── javascript
│   │   └── eslintrc
│   ├── python
│   │   ├── pyenv
│   │   │   └── .gitkeep
│   │   └── pystartup
│   └── ruby
│       └── irbrc
├── mutt
│   └── muttrc
├── re
│   ├── gdb
│   │   └── .gdbinit
│   ├── lldb
│   │   └── lldbinit
│   └── radare
│       └── radare2rc
├── shells
│   ├── bash -> /opt/Code/dotfiles/config/bash
│   ├── fish -> /opt/Code/dotfiles/config/fish
│   └── zsh -> /opt/Code/dotfiles/config/zsh
├── tags
└── terms
    ├── Terminal-app
    │   └── macOS-10.13.terminal
    ├── alacritty
    │   └── alacritty.yml
    ├── hyper
    │   └── hyper.js
    ├── iterm2
    │   └── com.googlecode.iterm2.plist
    └── tmux
        ├── bin
        │   ├── battery
        │   └── dots.sh
        ├── tmux
        │   ├── plugins
        │   │   ├── .gitkeep
        │   │   ├── tmux-resurrect
        │   │   │   ├── .gitattributes
        │   │   │   ├── .gitignore
        │   │   │   ├── .gitmodules
        │   │   │   ├── .travis.yml
        │   │   │   ├── CHANGELOG.md
        │   │   │   ├── CONTRIBUTING.md
        │   │   │   ├── LICENSE.md
        │   │   │   ├── README.md
        │   │   │   ├── docs
        │   │   │   │   ├── custom_key_bindings.md
        │   │   │   │   ├── migrating_from_tmuxinator.md
        │   │   │   │   ├── restoring_pane_contents.md
        │   │   │   │   ├── restoring_programs.md
        │   │   │   │   ├── restoring_shell_history.md
        │   │   │   │   ├── restoring_vim_and_neovim_sessions.md
        │   │   │   │   └── save_dir.md
        │   │   │   ├── lib
        │   │   │   │   └── tmux-test
        │   │   │   │       ├── .gitignore
        │   │   │   │       ├── .travis.yml
        │   │   │   │       ├── CHANGELOG.md
        │   │   │   │       ├── LICENSE.md
        │   │   │   │       ├── README.md
        │   │   │   │       ├── Vagrantfile
        │   │   │   │       ├── run_framework_tests
        │   │   │   │       ├── run_tests
        │   │   │   │       ├── setup
        │   │   │   │       ├── tests
        │   │   │   │       │   ├── helpers
        │   │   │   │       │   │   └── helpers.sh
        │   │   │   │       │   ├── run_tests_in_isolation
        │   │   │   │       │   ├── test_basic_script_execution.sh
        │   │   │   │       │   ├── test_default_session_name.sh
        │   │   │   │       │   └── test_tmux_scripting.sh
        │   │   │   │       ├── vagrant_centos_provisioning.sh
        │   │   │   │       └── vagrant_ubuntu_provisioning.sh
        │   │   │   ├── resurrect.tmux
        │   │   │   ├── run_tests -> lib/tmux-test/run_tests
        │   │   │   ├── save_command_strategies
        │   │   │   │   ├── gdb.sh
        │   │   │   │   ├── pgrep.sh
        │   │   │   │   └── ps.sh
        │   │   │   ├── scripts
        │   │   │   │   ├── check_tmux_version.sh
        │   │   │   │   ├── helpers.sh
        │   │   │   │   ├── process_restore_helpers.sh
        │   │   │   │   ├── restore.exp
        │   │   │   │   ├── restore.sh
        │   │   │   │   ├── save.sh
        │   │   │   │   ├── spinner_helpers.sh
        │   │   │   │   ├── tmux_spinner.sh
        │   │   │   │   └── variables.sh
        │   │   │   ├── strategies
        │   │   │   │   ├── irb_default_strategy.sh
        │   │   │   │   ├── nvim_session.sh
        │   │   │   │   └── vim_session.sh
        │   │   │   ├── tests
        │   │   │   │   ├── fixtures
        │   │   │   │   │   ├── restore_file.txt
        │   │   │   │   │   └── save_file.txt
        │   │   │   │   ├── helpers
        │   │   │   │   │   ├── create_and_save_tmux_test_environment.exp
        │   │   │   │   │   ├── expect_helpers.exp
        │   │   │   │   │   ├── helpers.sh -> ../../lib/tmux-test/tests/helpers/helpers.sh
        │   │   │   │   │   ├── restore_and_save_tmux_test_environment.exp
        │   │   │   │   │   └── resurrect_helpers.sh
        │   │   │   │   ├── run_tests_in_isolation -> ../lib/tmux-test/tests/run_tests_in_isolation
        │   │   │   │   ├── test_resurrect_restore.sh
        │   │   │   │   └── test_resurrect_save.sh
        │   │   │   └── video
        │   │   │       ├── issue_vid.png
        │   │   │       ├── screencast_img.png
        │   │   │       └── script.md
        │   │   └── tpm
        │   │       ├── .gitattributes
        │   │       ├── .gitignore
        │   │       ├── .gitmodules
        │   │       ├── .travis.yml
        │   │       ├── CHANGELOG.md
        │   │       ├── HOW_TO_PLUGIN.md
        │   │       ├── LICENSE.md
        │   │       ├── README.md
        │   │       ├── bin
        │   │       │   ├── clean_plugins
        │   │       │   ├── install_plugins
        │   │       │   └── update_plugins
        │   │       ├── bindings
        │   │       │   ├── clean_plugins
        │   │       │   ├── install_plugins
        │   │       │   └── update_plugins
        │   │       ├── docs
        │   │       │   ├── automatic_tpm_installation.md
        │   │       │   ├── changing_plugins_install_dir.md
        │   │       │   ├── how_to_create_plugin.md
        │   │       │   ├── managing_plugins_via_cmd_line.md
        │   │       │   └── tpm_not_working.md
        │   │       ├── lib
        │   │       │   └── tmux-test
        │   │       ├── scripts
        │   │       │   ├── check_tmux_version.sh
        │   │       │   ├── clean_plugins.sh
        │   │       │   ├── helpers
        │   │       │   │   ├── plugin_functions.sh
        │   │       │   │   ├── shell_echo_functions.sh
        │   │       │   │   ├── tmux_echo_functions.sh
        │   │       │   │   ├── tmux_utils.sh
        │   │       │   │   └── utility.sh
        │   │       │   ├── install_plugins.sh
        │   │       │   ├── source_plugins.sh
        │   │       │   ├── update_plugin.sh
        │   │       │   ├── update_plugin_prompt_handler.sh
        │   │       │   └── variables.sh
        │   │       ├── tests
        │   │       │   ├── expect_failed_plugin_download
        │   │       │   ├── expect_successful_clean_plugins
        │   │       │   ├── expect_successful_multiple_plugins_download
        │   │       │   ├── expect_successful_plugin_download
        │   │       │   ├── expect_successful_update_of_a_single_plugin
        │   │       │   ├── expect_successful_update_of_all_plugins
        │   │       │   ├── helpers
        │   │       │   │   └── tpm.sh
        │   │       │   ├── test_plugin_clean.sh
        │   │       │   ├── test_plugin_installation.sh
        │   │       │   ├── test_plugin_installation_legacy.sh
        │   │       │   ├── test_plugin_sourcing.sh
        │   │       │   └── test_plugin_update.sh
        │   │       └── tpm
        │   ├── resurrect
        │   │   ├── .gitkeep
        │   │   └── last -> tmux_resurrect_2018-07-05T13:23:04.txt
        │   └── tmux.macos.conf
        ├── tmux-256color.terminfo
        ├── tmux.conf
        └── xterm-256color-italic.terminfo

743 directories, 1974 files
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
  - [x] ~~~Figure out a way to save fold settings across all open buffers when quiting Vim.~~~
  - [x] ~~~Figure out why folds are only being saved / preserved for the last open buffer when quiting Vim 🤔~~~
  - [ ] Vim Sesssions, ~~~Folds,~~~ and Conceals will be the death of me 💀
  - [x] ~~don't create session files when launching a man page~~
  - [x] ~~Figure out a sane solution for previewing markdown ie. .md documents~~
  - [x] ~~Figure out what is causing lines to be hard wrapped! 😖~~
### Fish
  - [x] ~~Figure out why `grc` is borking PATH on Linux 😑~~

<a href="contact"></a>

## Contact
- **GithHub** [@ipatch](https://github.com/ipatch)
- **Twitter** [@truckmonth](https://twitter.com/truckmonth)
- **GitLab** [@truckmonth](https://gitlab.com/truckmonth)

