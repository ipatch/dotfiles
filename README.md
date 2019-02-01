<h2 align="center">dotfiles for Chris Jones</h2>

<div align="center">
<em>Give me six hours to chop down a tree and I will spend the first four sharpening the axe.</em>
</div>

<img align="right" src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/abe.circle.png">

<br>

<h3 align="center">Drink Responsibly™ 🥃 while configuring dot files.</h3>

<h6 align="center"><em>These dotfiles have been known to stop working at a moments notice, so buyer beware.</em></h6>

<div align="center">

<a id="contents"></a>

• [**wiki**](https://github.com/ipatch/dotfiles/wiki) • [Installation](#installation) • [File Structure](#file-structure) • [Useful Links](#useful-links) • [TODOs](#todos) • [Contact](#contact) •

</div>

<a id="installation"></a>

## Installation

> 👷 The below install script has not been completed, so you'll have to do the good ol [StackOverflow](https://i.imgur.com/QZj4hxp.jpg) if you want to expierment with any of the settings from this repo. 🚧

```sh
curl https://raw.githubusercontent.com/ipatch/dotfiles/master/install.sh | /bin/sh
```

<a id="file-structure"></a>

## File Structure

> Certain files and folders have been omitted for brevity and security, most notably the `pack` directory that was polluting the **File Structure** with plugin files.

<details>
<summary>File Structure</summary>
<pre>
.
├── .git-crypt/
│   ├── .gitattributes
│   └── keys/
│       └── default/
│           └── 0/
├── .gitattributes
├── .github/
│   ├── CONTRIBUTING.md
│   ├── ISSUE_TEMPLATE.md
│   └── PULL_REQUEST_TEMPLATE.md
├── .gitignore
├── .gitmodules
├── .wiki/
│   ├── .gitignore
│   ├── Home.md
│   ├── _Footer.md
│   ├── _Sidebar.md
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
│   ├── lib/
│   │   ├── Neovim-2018-april-late.png
│   │   ├── Neovim-2018-april.png
│   │   ├── abe.circle.png
│   │   ├── abe.png
│   │   ├── abe.tmp.png
│   │   ├── abe.tmp.xcf
│   │   ├── custom-motd.png
│   │   ├── fish-tab-completions.png
│   │   ├── macos-opengl-support.png
│   │   ├── merica.gif
│   │   ├── restore-app-windows.png
│   │   ├── vim-2017.png
│   │   └── windows-10-boot-time.png
│   ├── linux-macos-administration-Notes.md
│   ├── linux-macos-troubleshooting-Notes.md
│   ├── macbookpro-late-2013-Notes.md
│   ├── radare-Notes.md
│   ├── raspberry-pi-Notes.md
│   ├── tags
│   ├── terminal-emulators.md
│   ├── tmux-Notes.md
│   ├── vim-neovim-Notes.md
│   ├── web-browser-Notes.md
│   ├── weechat-Notes.md
│   ├── windows-Notes.md
│   └── working-with-video.md
├── LICENSE
├── README.md
├── asdf/
│   ├── .default-gems
│   ├── .default-npm-packages
│   ├── .tool-versions.nathan.capin
│   ├── .tool-versions.nathan.root
│   ├── README.md
│   └── tool-versions.rogue.capin
├── config/
│   ├── README.md
│   ├── alacritty/
│   │   └── alacritty.yml
│   ├── asciinema/
│   │   ├── config
│   │   ├── install-id
│   │   └── install-id.shu
│   ├── atom/
│   │   └── packages.list
│   ├── base16-shell -> /opt/code/github/PUBLIC/base16-shell/
│   ├── bash/
│   │   ├── .gitkeep
│   │   ├── bash_completion/
│   │   │   └── alacritty-completions.bash
│   │   ├── bash_profile
│   │   ├── bashrc
│   │   └── functions/
│   │       ├── .fzf.bash
│   │       ├── .gitkeep
│   │       ├── README.md
│   │       ├── debug.bash*
│   │       ├── foobar.bash
│   │       └── print_256_colors.bash*
│   ├── bitbar/
│   │   ├── cpu-temperature.5s.sh*
│   │   ├── fan-speed.5s.sh*
│   │   └── spotify.10s.sh*
│   ├── brew/
│   │   ├── Debian/
│   │   │   └── stretch/
│   │   │       ├── .gitkeep
│   │   │       ├── Brewfile
│   │   │       ├── dir_colors -> /opt/Code/dotfiles/config/brew/macOS/10.13/gnu-coreutils/dir_colors
│   │   │       └── nathan.stretch.package-list.txt -> /opt/Code/dotfiles/jobs/Linux/Debian/etc/apt/nathan.stretch.package-list.txt
│   │   ├── grc/
│   │   │   └── grc.conf
│   │   └── macOS/
│   │       ├── 10.12 -> Sierra//
│   │       ├── 10.13 -> High\ Sierra//
│   │       ├── High\ Sierra/
│   │       │   ├── Brewfile
│   │       │   ├── Library -> /opt/Code/dotfiles/config/brew/macOS/Sierra/Library/
│   │       │   ├── config/
│   │       │   │   └── karabiner -> /opt/Code/dotfiles/config/karabiner/
│   │       │   ├── etc -> /opt/Code/dotfiles/config/brew/macOS/Sierra/etc/
│   │       │   └── gnu-coreutils/
│   │       │       └── dir_colors
│   │       └── Sierra/
│   │           ├── Brewfile
│   │           ├── Library/
│   │           │   ├── LaunchAgents/
│   │           │   │   └── com.chrisrjones.ssh-agent.plist
│   │           │   └── LaunchDaemons/
│   │           │       └── com.chrisrjones.sshd.plist
│   │           └── etc/
│   │               └── ssh/
│   │                   ├── ssh_config
│   │                   └── sshd_config
│   ├── code -> vscode/
│   ├── firefox/
│   │   └── chrome/
│   │       └── userChrome.css
│   ├── fish/
│   │   ├── abbreviations.fish
│   │   ├── aliases.fish
│   │   ├── completions/
│   │   │   ├── alacritty.fish
│   │   │   ├── asdf.fish
│   │   │   ├── docker.fish
│   │   │   └── rustup.fish
│   │   ├── conf.d/
│   │   │   ├── 001_load_paths.fish
│   │   │   ├── 002_load_ls_colors.fish
│   │   │   ├── 005_omf.fish
│   │   │   ├── 007_load_pyen.fish
│   │   │   └── 008_load_gpg-agent.fish
│   │   ├── config.fish
│   │   ├── config.fish.bkup
│   │   ├── fish_universal_variables
│   │   ├── frameworks/
│   │   │   └── omf/
│   │   │       ├── bundle
│   │   │       ├── channel
│   │   │       ├── theme
│   │   │       └── themes/
│   │   │           └── theme-neolambda/
│   │   │               ├── LICENSE
│   │   │               ├── README.md
│   │   │               ├── fish_prompt.fish
│   │   │               ├── fish_right_prompt.fish
│   │   │               └── lib/
│   │   │                   ├── fish-shell-lambda-theme.png
│   │   │                   ├── virtualenv-double-prompt.png
│   │   │                   └── virtualenv.png
│   │   ├── functions/
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
│   │   │   ├── fzf_key_bindings.fish -> /usr/local/opt/fzf/shell/key-bindings.fish
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
│   │   │   ├── print_cpu_code_name.fish
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
│   │   ├── fundle/
│   │   │   └── edc/
│   │   │       └── bass/
│   │   │           ├── .travis.yml
│   │   │           ├── LICENSE
│   │   │           ├── Makefile
│   │   │           ├── README.md
│   │   │           ├── functions/
│   │   │           │   ├── __bass.py
│   │   │           │   └── bass.fish
│   │   │           └── test/
│   │   │               ├── fixtures/
│   │   │               │   └── dollar_output.sh*
│   │   │               ├── test_bass.fish
│   │   │               └── test_dollar_on_output.fish
│   │   └── interactive.fish
│   ├── git/
│   │   ├── git-templates/
│   │   │   └── hooks/
│   │   │       ├── legacy.pre-commit*
│   │   │       ├── post-checkout*
│   │   │       ├── pre-commit*
│   │   │       └── pre-commit.d/
│   │   │           └── 01-crypto.sh*
│   │   ├── gitattributes
│   │   ├── gitconfig
│   │   └── gitexcludes
│   ├── htop/
│   │   └── htoprc
│   ├── inputrc
│   ├── irc-clients/
│   │   └── weechat/
│   │       ├── alias.conf
│   │       ├── aspell.conf
│   │       ├── buffers.conf
│   │       ├── buflist.conf
│   │       ├── charset.conf
│   │       ├── colorize_nicks.conf
│   │       ├── exec.conf
│   │       ├── fifo.conf
│   │       ├── fset.conf
│   │       ├── irc.conf.shu
│   │       ├── iset.conf
│   │       ├── logger.conf
│   │       ├── logs/
│   │       │   └── .gitkeep
│   │       ├── lua/
│   │       │   └── autoload/
│   │       ├── perl/
│   │       │   ├── autoload/
│   │       │   │   ├── iset.pl -> ../iset.pl
│   │       │   │   ├── multiline.pl -> ../multiline.pl
│   │       │   │   └── nickregain.pl -> ../nickregain.pl
│   │       │   ├── iset.pl
│   │       │   ├── multiline.pl
│   │       │   └── nickregain.pl
│   │       ├── perl.conf
│   │       ├── plugins.conf
│   │       ├── python/
│   │       │   ├── autojoin.py
│   │       │   ├── autoload/
│   │       │   │   ├── autojoin.py -> ../autojoin.py
│   │       │   │   ├── colorize_nicks.py -> ../colorize_nicks.py
│   │       │   │   ├── histsearch.py -> ../histsearch.py
│   │       │   │   └── pyrnotify.py -> ../pyrnotify.py
│   │       │   ├── colorize_nicks.py
│   │       │   ├── histsearch.py
│   │       │   └── pyrnotify.py
│   │       ├── python.conf
│   │       ├── relay.conf
│   │       ├── ruby/
│   │       │   └── autoload/
│   │       ├── ruby.conf
│   │       ├── script/
│   │       │   └── plugins.xml.gz
│   │       ├── script.conf
│   │       ├── sec.conf.shu
│   │       ├── tcl/
│   │       │   └── autoload/
│   │       ├── trigger.conf
│   │       ├── weechat.conf.shu
│   │       ├── weechat.log
│   │       ├── weechat.png
│   │       ├── xfer/
│   │       │   └── .gitkeep
│   │       └── xfer.conf
│   ├── karabiner/
│   │   ├── assets/
│   │   │   └── complex_modifications/
│   │   │       ├── .gitkeep
│   │   │       └── 1531852685.json
│   │   └── karabiner.json
│   ├── minicom/
│   │   ├── minirc.bp-apex2g
│   │   ├── minirc.dfl
│   │   ├── minirc.minicom-bp-ap-express-2G
│   │   └── minirc.minicom-bp-ap2g
│   ├── mpv/
│   │   ├── input.conf
│   │   ├── mpv.conf
│   │   ├── mpv_history.log
│   │   ├── scripts/
│   │   │   └── history.lua
│   │   └── watch_later/
│   │       ├── .gitkeep
│   │       ├── 16BDAD0EF35D15879302723703612C96
│   │       ├── 183D4B3B19174B54291AECC845FC12C4
│   │       └── 6267CB20C03F5A5634589F80ED8FD6E5
│   ├── mutt/
│   │   └── muttrc
│   ├── nvim/
│   │   ├── autoload/
│   │   │   └── .gitkeep
│   │   └── init.vim
│   ├── pt/
│   │   └── config.toml
│   ├── vscode/
│   │   ├── keybindings.json
│   │   └── settings.json
│   └── zsh/
│       ├── functions/
│       │   └── .fzf.zsh
│       ├── zlogin
│       ├── zshenv
│       └── zshrc
├── editors/
│   ├── atom -> /opt/Code/dotfiles/config/atom/
│   ├── code -> /opt/Code/dotfiles/config/code/
│   ├── ctags
│   ├── nvim -> /opt/Code/dotfiles/config/nvim/
│   └── vim/
│       ├── README.md
│       ├── editorconfig
│       ├── init.vim -> /opt/Code/dotfiles/config/nvim/init.vim
│       ├── vim/
│       │   ├── .base16
│       │   ├── .base16.previous
│       │   ├── after/
│       │   │   ├── .gitkeep
│       │   │   ├── ftplugin/
│       │   │   │   ├── bash/
│       │   │   │   │   └── bash.vim
│       │   │   │   ├── fish/
│       │   │   │   │   └── fish.vim
│       │   │   │   ├── html.vim
│       │   │   │   ├── javascript/
│       │   │   │   │   ├── folding.vim
│       │   │   │   │   └── javascript.vim
│       │   │   │   ├── markdown/
│       │   │   │   │   ├── folding.vim
│       │   │   │   │   └── markdown.vim
│       │   │   │   ├── python.vim
│       │   │   │   └── vim/
│       │   │   │       ├── folding.vim
│       │   │   │       └── vim.vim
│       │   │   └── plugin/
│       │   │       ├── plugin_ale.vim
│       │   │       ├── plugin_deoplete.vim
│       │   │       ├── plugin_fzf.vim
│       │   │       ├── plugin_identLine.vim
│       │   │       ├── plugin_indent_line.vim
│       │   │       ├── plugin_language_client.vim
│       │   │       ├── plugin_lightline.vim
│       │   │       └── plugin_vim_commentary.vim
│       │   ├── autoload/
│       │   │   └── wincent/
│       │   │       ├── autocmds.vim
│       │   │       ├── mappings/
│       │   │       │   └── visual.vim
│       │   │       └── settings.vim
│       │   ├── colors/
│       │   │   └── .gitkeep
│       │   ├── plugin/
│       │   │   ├── autocmds.vim
│       │   │   ├── mappings.vim
│       │   │   ├── sessions.vim
│       │   │   └── settings.vim
│       │   └── spell/
│       │       ├── en.utf-8.add
│       │       ├── en.utf-8.add.spl
│       │       ├── en.utf-8.spl
│       │       └── en.utf-8.sug
│       ├── vimrc
│       └── vimrc.pre-feb-26-2018
├── install/
│   ├── install-alpha.sh*
│   ├── install-alpha02.sh*
│   └── prompt.sh*
├── install.sh*
├── jobs/
│   ├── Linux/
│   │   ├── Debian/
│   │   │   ├── _load_selinux_policy
│   │   │   └── etc/
│   │   │       ├── apt/
│   │   │       │   ├── Brewfile -> /opt/Code/dotfiles/config/brew/Debian/stretch/Brewfile
│   │   │       │   ├── nathan.stretch.package-list.txt
│   │   │       │   └── sources.list.d/
│   │   │       │       ├── .gitkeep
│   │   │       │       └── debian-stretch-backports.list
│   │   │       ├── bash.bashrc
│   │   │       ├── profile
│   │   │       └── systemd/
│   │   │           ├── journald.conf
│   │   │           └── system/
│   │   │               ├── bitlbee.service
│   │   │               ├── postgresql.service
│   │   │               ├── xclip.socket
│   │   │               └── xclip@.service
│   │   ├── Raspbian/
│   │   │   └── lib/
│   │   │       └── systemd/
│   │   │           └── system/
│   │   │               └── transmission-daemon.service
│   │   ├── pg_backup.config
│   │   ├── pg_backup.sh*
│   │   ├── pg_backup_borked.sh*
│   │   └── pg_backup_rotated.sh*
│   ├── bin/
│   │   ├── airport -> /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport*
│   │   ├── battery -> /opt/Code/dotfiles/terms/tmux/bin/battery*
│   │   ├── brew-update-Brewfile.sh*
│   │   ├── brew-updatedb.sh*
│   │   ├── color-spaces.pl*
│   │   ├── colors-fish*
│   │   ├── colors-lencioni*
│   │   ├── colors-lencioni.orig*
│   │   ├── colors-wincent*
│   │   ├── colors-wincent.orig*
│   │   ├── colors-zsh*
│   │   ├── colortest -> /opt/Code/dotfiles/config/base16-shell/colortest*
│   │   ├── dd_ibs_test.sh*
│   │   ├── dd_obs_test.sh*
│   │   ├── defunct/
│   │   │   └── tmux_session.sh*
│   │   ├── docker-uninstall-on-macos.sh*
│   │   ├── dots.sh -> /opt/Code/dotfiles/terms/tmux/bin/dots.sh*
│   │   ├── dpkg-gettext.pl
│   │   ├── dpkg-scanpackages-cydia*
│   │   ├── git-gc-all-ferocious.sh*
│   │   ├── git-grab-all-the-branches.sh*
│   │   ├── git-large-files.sh*
│   │   ├── git_find_big.sh*
│   │   ├── jtool -> /opt/code/ios-dev/tools/jtool/jtool*
│   │   ├── launchd-setup-env-vars.sh
│   │   ├── macos-bp-ln.sh*
│   │   ├── macos-ls-usb.sh*
│   │   ├── macos-notif-center-test.sh*
│   │   ├── objconv*
│   │   ├── openvpn/
│   │   │   └── test-routes.sh*
│   │   ├── print_ls_colors*
│   │   ├── rm_ds_store_files.sh*
│   │   └── sysbenc-cpu-temp.sh*
│   ├── macOS/
│   │   ├── System/
│   │   │   └── Library/
│   │   │       └── LaunchDaemons/
│   │   │           └── com.apple.nfsd.plist
│   │   ├── Users/
│   │   │   └── mr-fancy/
│   │   │       └── Library/
│   │   │           ├── LaunchAgents/
│   │   │           │   ├── com.chrisrjones.brew-update-Brewfile.plist
│   │   │           │   ├── com.chrisrjones.brew-updatedb.plist
│   │   │           │   ├── com.chrisrjones.ln_bus_pirate.plist
│   │   │           │   ├── com.chrisrjones.rm_ds_store_files.plist
│   │   │           │   └── com.chrisrjones.test.launchd-notif-center.plist
│   │   │           └── Preferences/
│   │   │               └── .gitkeep
│   │   ├── etc -> /opt/Code/dotfiles/jobs/macOS/private/
│   │   ├── private/
│   │   │   └── etc/
│   │   │       ├── autofs.conf
│   │   │       ├── paths.default
│   │   │       └── profile
│   │   └── usr/
│   │       └── local/
│   │           ├── xpc_set_event_stream_handler.m
│   │           └── xpc_set_event_stream_handler.o
│   └── scripts/
│       └── .gitkeep
├── lang/
│   ├── cpp/
│   │   └── README.md
│   ├── elixir/
│   │   ├── README.md
│   │   └── iex.exs
│   ├── java/
│   │   └── README.md
│   ├── javascript/
│   │   ├── README.md
│   │   ├── eslintrc
│   │   ├── npm-global-packages.txt
│   │   ├── npm-install.sh*
│   │   ├── npmrc
│   │   └── yarnrc.rogue.capin
│   ├── js -> /opt/Code/dotfiles/lang/javascript/
│   ├── lua/
│   │   └── README.md
│   ├── python/
│   │   ├── README.md
│   │   ├── pyenv/
│   │   │   └── .gitkeep
│   │   └── pystartup
│   ├── ruby/
│   │   ├── README.md
│   │   ├── gemrc
│   │   └── irbrc
│   └── rust/
│       └── README.md
├── re/
│   ├── gdb/
│   │   └── .gdbinit
│   ├── lldb/
│   │   └── lldbinit
│   └── radare/
│       └── radare2rc
├── shells/
│   ├── bash -> /opt/Code/dotfiles/config/bash/
│   ├── fish -> /opt/Code/dotfiles/config/fish/
│   └── zsh -> /opt/Code/dotfiles/config/zsh/
├── tags
└── terms/
    ├── Terminal-app/
    │   └── macOS-10.13.terminal
    ├── alacritty/
    │   └── alacritty.yml
    ├── hyper/
    │   └── hyper.js
    ├── iterm2/
    │   └── com.googlecode.iterm2.plist
    └── tmux/
        ├── bin/
        │   ├── battery*
        │   └── dots.sh*
        ├── tmux/
        │   ├── plugins/
        │   │   ├── .gitkeep
        │   │   ├── tmux-resurrect/
        │   │   │   ├── .gitattributes
        │   │   │   ├── .gitignore
        │   │   │   ├── .gitmodules
        │   │   │   ├── .travis.yml
        │   │   │   ├── CHANGELOG.md
        │   │   │   ├── CONTRIBUTING.md
        │   │   │   ├── LICENSE.md
        │   │   │   ├── README.md
        │   │   │   ├── docs/
        │   │   │   │   ├── custom_key_bindings.md
        │   │   │   │   ├── migrating_from_tmuxinator.md
        │   │   │   │   ├── restoring_pane_contents.md
        │   │   │   │   ├── restoring_programs.md
        │   │   │   │   ├── restoring_shell_history.md
        │   │   │   │   ├── restoring_vim_and_neovim_sessions.md
        │   │   │   │   └── save_dir.md
        │   │   │   ├── lib/
        │   │   │   │   └── tmux-test/
        │   │   │   │       ├── .gitignore
        │   │   │   │       ├── .travis.yml
        │   │   │   │       ├── CHANGELOG.md
        │   │   │   │       ├── LICENSE.md
        │   │   │   │       ├── README.md
        │   │   │   │       ├── Vagrantfile
        │   │   │   │       ├── run_framework_tests*
        │   │   │   │       ├── run_tests*
        │   │   │   │       ├── setup*
        │   │   │   │       ├── tests/
        │   │   │   │       │   ├── helpers/
        │   │   │   │       │   │   └── helpers.sh
        │   │   │   │       │   ├── run_tests_in_isolation*
        │   │   │   │       │   ├── test_basic_script_execution.sh*
        │   │   │   │       │   ├── test_default_session_name.sh*
        │   │   │   │       │   └── test_tmux_scripting.sh*
        │   │   │   │       ├── vagrant_centos_provisioning.sh
        │   │   │   │       └── vagrant_ubuntu_provisioning.sh
        │   │   │   ├── resurrect.tmux*
        │   │   │   ├── run_tests -> lib/tmux-test/run_tests*
        │   │   │   ├── save_command_strategies/
        │   │   │   │   ├── gdb.sh*
        │   │   │   │   ├── pgrep.sh*
        │   │   │   │   └── ps.sh*
        │   │   │   ├── scripts/
        │   │   │   │   ├── check_tmux_version.sh*
        │   │   │   │   ├── helpers.sh
        │   │   │   │   ├── process_restore_helpers.sh
        │   │   │   │   ├── restore.exp*
        │   │   │   │   ├── restore.sh*
        │   │   │   │   ├── save.sh*
        │   │   │   │   ├── spinner_helpers.sh
        │   │   │   │   ├── tmux_spinner.sh*
        │   │   │   │   └── variables.sh
        │   │   │   ├── strategies/
        │   │   │   │   ├── irb_default_strategy.sh*
        │   │   │   │   ├── nvim_session.sh*
        │   │   │   │   └── vim_session.sh*
        │   │   │   ├── tests/
        │   │   │   │   ├── fixtures/
        │   │   │   │   │   ├── restore_file.txt
        │   │   │   │   │   └── save_file.txt
        │   │   │   │   ├── helpers/
        │   │   │   │   │   ├── create_and_save_tmux_test_environment.exp*
        │   │   │   │   │   ├── expect_helpers.exp
        │   │   │   │   │   ├── helpers.sh -> ../../lib/tmux-test/tests/helpers/helpers.sh
        │   │   │   │   │   ├── restore_and_save_tmux_test_environment.exp*
        │   │   │   │   │   └── resurrect_helpers.sh
        │   │   │   │   ├── run_tests_in_isolation -> ../lib/tmux-test/tests/run_tests_in_isolation*
        │   │   │   │   ├── test_resurrect_restore.sh*
        │   │   │   │   └── test_resurrect_save.sh*
        │   │   │   └── video/
        │   │   │       ├── issue_vid.png
        │   │   │       ├── screencast_img.png
        │   │   │       └── script.md
        │   │   └── tpm/
        │   │       ├── .gitattributes
        │   │       ├── .gitignore
        │   │       ├── .gitmodules
        │   │       ├── .travis.yml
        │   │       ├── CHANGELOG.md
        │   │       ├── HOW_TO_PLUGIN.md
        │   │       ├── LICENSE.md
        │   │       ├── README.md
        │   │       ├── bin/
        │   │       │   ├── clean_plugins*
        │   │       │   ├── install_plugins*
        │   │       │   └── update_plugins*
        │   │       ├── bindings/
        │   │       │   ├── clean_plugins*
        │   │       │   ├── install_plugins*
        │   │       │   └── update_plugins*
        │   │       ├── docs/
        │   │       │   ├── automatic_tpm_installation.md
        │   │       │   ├── changing_plugins_install_dir.md
        │   │       │   ├── how_to_create_plugin.md
        │   │       │   ├── managing_plugins_via_cmd_line.md
        │   │       │   └── tpm_not_working.md
        │   │       ├── lib/
        │   │       │   └── tmux-test/
        │   │       ├── scripts/
        │   │       │   ├── check_tmux_version.sh*
        │   │       │   ├── clean_plugins.sh*
        │   │       │   ├── helpers/
        │   │       │   │   ├── plugin_functions.sh
        │   │       │   │   ├── shell_echo_functions.sh
        │   │       │   │   ├── tmux_echo_functions.sh
        │   │       │   │   ├── tmux_utils.sh
        │   │       │   │   └── utility.sh
        │   │       │   ├── install_plugins.sh*
        │   │       │   ├── source_plugins.sh*
        │   │       │   ├── update_plugin.sh*
        │   │       │   ├── update_plugin_prompt_handler.sh*
        │   │       │   └── variables.sh
        │   │       ├── tests/
        │   │       │   ├── expect_failed_plugin_download*
        │   │       │   ├── expect_successful_clean_plugins*
        │   │       │   ├── expect_successful_multiple_plugins_download*
        │   │       │   ├── expect_successful_plugin_download*
        │   │       │   ├── expect_successful_update_of_a_single_plugin*
        │   │       │   ├── expect_successful_update_of_all_plugins*
        │   │       │   ├── helpers/
        │   │       │   │   └── tpm.sh
        │   │       │   ├── test_plugin_clean.sh*
        │   │       │   ├── test_plugin_installation.sh*
        │   │       │   ├── test_plugin_installation_legacy.sh*
        │   │       │   ├── test_plugin_sourcing.sh*
        │   │       │   └── test_plugin_update.sh*
        │   │       └── tpm*
        │   ├── resurrect/
        │   │   ├── .gitkeep
        │   │   └── last -> tmux_resurrect_2018-09-19T13:56:22.txt
        │   └── tmux.macos.conf
        ├── tmux-256color.terminfo
        ├── tmux.conf
        └── xterm-256color-italic.terminfo

191 directories, 488 files

</pre>
</details>

<a id="useful-links"></a>

## Useful Links ___no particular order___

- [**Github** wincent/wincent](https://github.com/wincent/wincent)
- [**Github** mathiasbynenes/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [**Github** Awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)

<a id="todos"></a>

## TODOs

- [ ] Write an install script for easy installation of dotfiles.

### Neovim

- [x] ~~Vim Sesssions, Folds, and Conceals will be the death of me~~ 💀

<a id="contact"></a>

## Contact [🔝](#contents)

<div align="center">

• [**GithHub**](https://github.com/ipatch) • [**Twitter**](https://twitter.com/truckmonth) • [**GitLab**](https://gitlab.com/truckmonth) •

</div>
