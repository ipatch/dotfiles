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

<!-- first day of spring, march 20, 2021 -->

## Installation

<a id="installation"></a>

<!-- github flavored markdown presently doesnot support `target="_blank"` -->

<blockquote>
👷 install script is incomplete, do the good ol <a href="https://i.imgur.com/QZj4hxp.jpg" target="_blank" "rel="noopener noreferrer">StackOverflow <img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/nearr.svg"></a> to experiment with repo files. 🚧
</blockquote>

```sh
curl https://raw.githubusercontent.com/ipatch/dotfiles/master/install.sh | /bin/sh

echo "quickly add tmux configuration file, in a pinch"
curl https://raw.githubusercontent.com/ipatch/dotfiles/master/terms/tmux/tmux.conf > ~/.tmux.conf
```


## File Structure

<a id="file-structure"></a>

> Certain files and folders are omitted for brevity & security, most notably the `pack` directory polluting the **File Structure** with vim plugin files.

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


## Useful Links ___no particular order___

<a id="useful-links"></a>

- [**Github** wincent/wincent](https://github.com/wincent/wincent)
- [**Github** mathiasbynenes/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [**Github** Awesome-dotfiles](https://github.com/webpro/awesome-dotfiles)
- [cool looking **badges** for github readme's](https://github.com/ryanoasis/nerd-fonts)

<!-- <h3>TODOs</h3> -->

##  <a id="todos"></a> TODOs

<details>

<summary>Uncompleted</summary>

- [ ] [vim] [nvim] when toggling the tagbar <kbd>leader+\\</kbd> move the cursor/focus to the tagbar buffer automatically.
- [ ] [tmux] [fish] possible to restore scroll back history after closing tmux server and terminal _alacritty_
- [ ] [neovim], 0.5.0, updating neovim to latest release
    - breaks my custom cursor color
    - ~~my <kbd>esc</kbd> binding when fzf terminal window is open does not work, boo 👻~~ appears to be working as intended now 🤔
- [ ] [arch], device a more elegant way to fix the `can't read temp` in the i3 status bar after reboots
- [ ] [arch], set lshift+rshift to toggle caps-lock on/off
- [ ] [arch], set timeout for git credential cache so i don't have to keep inputting github username/password
- [ ] [fish], possible to detach current pane in a tmux window from shell history, or write commands run from certain directory to specific history file to keep commands ran in a specific directory quickly accessible, ie. useful when working with a node or ruby based project.
- [ ] [vim] [nvim], set default filetype for JSON files to `jsonc`
- [ ] [tmux] use vivaldi keybinding for switching between windows as opposed to using shift+arrow keys
- [ ] [alacritty] [fish] [tmux] [karabiner] [hammerspoon] _double tap esc_, ie. esc², to run the keyboard shortcut of clearing the scree, ie. prefix (tmux), then control+l
- [ ] [vim] [nvim] [coc] [eslint] gutter warn glyph appeares to be `>>` in the color red, would much prefer to keep warning color consistent with the color of the warning text, and same with error text, keep that the color red.
- [ ] [macos] [afloat] [ke] [hammerspoon] double tap right shift, toggle keep window atop
- [ ] [fish] followup on my reddit question about suggestions / completions when writing fish scripts
- [ ] [vim] device func / stript to decrypt / encrypt GPG files
- [ ] [phys] reapply liquid metal to local cpu and gpu, run geekbench test before after, and exp with copper shims for gpu + cpu
- [ ] [macos] [homebrew] howto search for homebrew taps
- [ ] [neovim] review the below highlight settings, obviously time permitting of course
  - Folded
  - GitGutterAdd
  - GitGutterChange
  - GitGutterDelete
  - LineNr
  - Number
- [ ] [fish] add a keyboard shortcut to toggle the right prompt **on** / **off**
- [ ] [fish, dots] # TODO: migrate all `mac, mac-` related abbrs, alias, shell scripts to use `apl` prefix
- [ ] [vim, tmux, or macos] some form of icon / notification of **caps lock** being enabled
- [ ] [tmux] add space at the end of window names to prevent moving of text in status bar
- [ ] [fish] detach fish shell instance from command history
  - **Q** can tmux separate all panes within a window from the global command history _fish shell_
- [ ] [nvim] **references** text when working with JS files, toggle with _leader+h_ as other hidden chars are toggled
- [ ] [vim] jump to open curly brace then jump back to close curly brace
- [ ] [vim, json] adjust default conceal settings for json files
- [ ] [vim, javascript] **Q** how to make certain javascript lang _keywords_ appear in italics using color / font scheme
    - **className, const, return, this.state, onClick, import**
- [ ] [vim, markdown] have basic code folding for certain HTML tags when editing markdown documents
- [ ] [macos] what is the procedure macos uses to mount a file system when a usb drive is plugged into a macos system
- [ ] [tmux] instead <kbd>prefix</kbd> then <kbd>control+l</kbd> to clear the screen, try using <kbd>control+l followed by l</kbd>, no good, try using <kbd>super + l</kbd>
- [ ] [macos] look into creating a _lazy mouse hover_ function, if the mouse is hovering a application specific window for a certain period of time (threshold) bring that application to focus, ie. a pseudo auto hover.
- [ ] [tmux] put short synopsis of current weather in tmux status bar, _right side_
- [ ] **vivaldi** / **voilentmonkey**
  - youtube script, to switch view mode on viewer window hover with mouse or mash a key to bring focus to viewer window so playback shortcuts become active.
- [ ] [vim] navigating documents with line wraps makes jumping through buffer by line number inaccurate, wrapped lines are displayed as one line, but the jump cmd treats them as multiple
- [ ] [tmux] **getting closer** it'd be nice to have a quick double tap of either <kbd>shift</kbd>key then<kbd>shift</kbd> to toggle between remote and local tmux sessions 
  - [learn more][lm1]
  - [and more][lm2] 

  [lm1]: <https://gist.github.com/samoshkin/05e65f7f1c9b55d3fc7690b59d678734>
  [lm2]: <https://www.freecodecamp.org/news/tmux-in-practice-local-and-nested-remote-tmux-sessions-4f7ba5db8795/>

- [ ] [karabiner], toggle function keys on a macbook with double tap of <kbd>fn</kbd>
- [ ] [python] [fish] [virtualenv] setup keybinding <kbd>control</kbd>+<kbd>d</kbd> to exit virtualenv but not exit terminal / shell session, ie. make control+d local to the virtualenv
- [ ] [python] [fish] [neolambda] update prompt to remove ~λ~ and put name of virtualenv instead
- [ ] see if there is a fish function of _omf_ or _fisher_ plugin that supports sharing command history between bash and fish
- [ ] make abe graphic more personal.
- [ ] spend an hour or two working on install script for aiding the process of setting up my dotfiles on fresh box 📦.

</details> <!-- end of uncompleted todo items -->

<!-- <h3>TODOs completed</h3> -->

##

<details>
<summary><strong>TODOs completed</strong></summary>

- [ ] [vim] #vim, using my <kbd>cmd</kbd>+</kbd>v</kbd> in vim/neovim always adds an extra line 👿
- [x] ~~[hardware] [keytron] [k6], remamp <kbd>esc</kbd> to <kbd>`</kbd> as my caps lock key is already mapped to esc on tap~~
- [x] ~~[fish] exp with using colors for `brew.fish` function to distinguish misspelling of word~~
- [x] ~~[vim] [neovim] keep the `lcd` / `pwd` to the directory nvim was launched from **especially** if nvim was launched with no args~~
    - disabled `autochdir`, check with `:verbose set autochdir?`
- [x] [macos, wm, spectacle] ~~<kbd>cmd,option,+</kbd> have to mash <kbd>+</kbd> multiple times to increase window size, would like _hold the key down to increase size_, looking at your karabiner-elements / hammerspoon~~ [out of my control][lm3]

[lm3]: <https://github.com/rxhanson/Rectangle/discussions/346>

- [x] [tmux] [ke] ~~left double tap shift, toggle max/min pane within window~~
- [x] ~~[vim] change commenting for `.gitignore` files from `/* wrong */` to `# right`~~
- [x] ~~[vim] update colorscheme to see if it solves the neovim gutter white colored pipes for code folds.~~ [**neovim folding doc**](https://neovim.io/doc/user/usr_28.html)
    - **did not** update the gutter symbol colors related to code folds. booo
- [x] ~~[vim] keybinding: use `ctrl+w, z` to maximize / minimize split~~
- [x] ~~[vim] remamp split command key bindings to use similar keys as tmux pane splitting, ie. <kbd>|</kbd> and <kbd>-</kbd>~~
- [x] ~~pack up `spring-dev` branch into a release and begin `summer-dev` branch~~
- [x] ~~[vim] figure out why _colorscheme_ or _syntax_ file is causing red block backgrounds~~
- [x] [tmux] ~~search and see if it supports key chord style shortcuts, tired of using <kbd>shift</kbd>+<kbd>arrow keys</kbd> to navigate between windows, prefer <kbd>ctrl</kbd>+<kbd>l</kbd> then <kbd>l</kbd>~~
- [x] ~~[fish] come up with sane way to check for misspelling of `brew cask outdated --greddy`~~
- [x] ~~Vim Sesssions, Folds, and Conceals will be the death of me~~ 💀

</details>


<div align="center">

## Contact [🔝](#contents)

<a id="contact"></a>

• [**GithHub**](https://github.com/ipatch) • [**Twitter**](https://twitter.com/truckmonth) • [**GitLab**](https://gitlab.com/truckmonth) •

</div>

## 

<details>

<summary>scratchpad</summary>

<!-- In 2021, the first day of fall is on Wednesday, September 22.  -->

</details>

