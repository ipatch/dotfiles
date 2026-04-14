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

• [**wiki**](https://github.com/ipatch/dotfiles/wiki) • [Installation](#installation) • [apps](#apps) •  [File Structure](#file-structure) • [Useful Links](#useful-links) • [arch][ul1] • [TODOs](#todos) • [Contact](#contact) •

[ul1]: <https://github.com/ipatch/dotfiles/tree/dev.evergreen/jobs/Linux/arch/>

</div>

## Installation

<a name="installation"></a>

<!-- NOTE: ipatch, github flavored markdown presently does not support `target="_blank"` -->

<blockquote>

**Warning** 🚧 👷 install script is incomplete, do the good ol [StackOverflow][lnk.funny1] <img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/nearr.svg"> to experiment with repo files. 

</blockquote>

[lnk.funny1]: <https://i.imgur.com/QZj4hxp.jpg>

```sh
curl \
https://raw.githubusercontent.com/ipatch/dotfiles/master/install.sh \
| /bin/sh;

echo "quickly add tmux configuration file, in a pinch 🤏";
curl \
https://raw.githubusercontent.com/ipatch/dotfiles/master/terms/tmux/tmux.conf \
> ~/.tmux.conf;
```

## apps

<a name="apps"></a>

> 🌹🪨 apps i use on various operating systems

|apps| macos              | gnu+linux                                       | windows  |
|----|--------------------|-------------------------------------------------|----------|
| wm | spectacle          | i3                                              | default  |
| 📸 | builtin            | flameshot + [script][script-link]               | default  |
| 🎧️ | background music   | ???                                             | ???      |
| fe | Finder.app         | thunar                                          | explorer |
| 💬 | iMessage           | bluebubbles                                     | ???      |
| ⌨️ | karabiner elements | interception / [dual function keys][apps-lnk1]  | ???      |
| ✂️ | clipy              | copyq                                           | copyq    |
| 📺️ | default            | arandr                                          | default  |
| 🖱️ | ???                | showmethekey, obs overlay                       | ???      |

[apps-lnk1]: <https://gitlab.com/interception/linux/plugins/dual-function-keys> 
[script-link]: <https://github.com/ipatch/dotfiles/blob/dev.evergreen/jobs/bin/screenshot-mon-with-cursor.sh>

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

## <a name="todos"></a> TODOs

<details>

<summary>Uncompleted</summary>

- [ ] #neovim working with python files and indention is let than ideal, usually with other filetypes i can use the command `==` to fix the indentation of a line thanks to treesitter, however it appears treesitter support for python files sucks. ie. `==` just plain out does **NOT** work. however `<<` and `>>` still can adjust a line. i also tested `==` in vscode because i have a plugin / extension with (n)vim bindings but even then `==` still does not proper indent the line.
- [ ] #arch #linux figure out how to load `~/.Xresources` on login. as of right now i'm having to manually load after login
  - obviously i could just add the command in my i3 `config` file, but i wonder if there is a more proper load procedure 🤔
- [ ] #neovim when the key binding `gcc` use `//` style comments instead of `/* */` the later being block level
  - this was probably related to c / cpp files (i've slept since then).
- [ ] #fish #theme #neolambda, if origin is the same _git remote_ as another _remote_ name then update _git status prompt_ for both, **not** just _origin_
- [ ] #nvim #neovim is there an elegant way to switch a word from single quotes `'` to double quotes `"` and vise versa
    - still have not found one without doing finger gymnastics unfortunately
- [ ] #linux #screencasting #i3, setup binding to toggle showkey, and auto launch showkey after i3 starts ala copyq
- [ ] #tmux how not move window title names when prefix key is pressed and label `^S` is shown in the left side of the status bar.
- [ ] #tmux only display window index numbers after the pressing prefix key (this gunna be a tricky one) 🤔
- [ ] #i3 #polybar put cpu / gpu fan speeds in my bar
- [ ] #nvim WTF, when i've been running `:e` on my open buffer (config.fish) it's been resetting my `foldlevel=2` 😡
  - auto commands will need to be setup to work around this.
- [ ] #arch xrandr + arandr is it possible to have auto probe monitors to load layouts on the fly a la how macos does it
- [ ] #arch #emote how to make the gui for my emoji picker larger 👩‍🦯
- [ ] #nvim plugin / #nvim-ufo can not fold html tags contained with a markdown document out of the box
- [ ] #i3 when launching an app that is defined for a specific workspace and already on that workspace the app launches on the previously active workspace WTF?
- [ ] a much better solution for ricing my arch install ie. editing config files that require a reboot would be to edit in a virtual machine or even using a docker container to not require a full reboot  🤦‍♂️
- [ ] #arch #i3, how to change the outline color of the active window on the screen?
- [ ] #webdev, side quest, 🤺 figure out reimp search so a site such autozone can find `b12 chemtool` instead having to type `b-12`
- [ ] #arch map left control key on keychron to `fn` key ala macbook builtin keyboard
- [ ] #milliondollaridea 🤑, some way to search the youtube transcript in browser to find a specific spot of a video
- [ ] #arch #tmux add key binding to toggle window display numbers
- [ ] ~~#hammerspoon~~ ~~#karabiner~~ #cmake it'd be nice to swap the `[]` with the `{}` when capslock is activated similiar to how i swapped underbar `_` with hyphen `-`
- [ ] #fish it'd be cool to remove all entries from my fish history that were invalid commands thus when searching through history, so i don't repeat the same mistake
- [ ] #alacritty does **not** properly highlight, select URLs when wrapped
- [ ] #freecad create asciinema of configuring and building freecad from source on macos
    - [ ] #freecad make an additional cast of runing through the test suite after building/installing freecad
- [ ] #mpv #hammerspoon, setup a env var for `mpvsocket` to make interacting the mpv socket a little less brittle 🧊
- [ ] #arch #archlinux #linux go through the following procedures to see if the intel crystalwell igpu is properly being used on my archbox
    - https://wiki.archlinux.org/title/Hardware_video_acceleration#Verification 
    - https://linux-hardware.org/?id=pci:8086-0d22-106b-0122
    - https://wiki.gentoo.org/wiki/Intel#Feature_support
    - https://wiki.gentoo.org/wiki/Intel#Feature_support
    - https://wiki.gentoo.org/wiki/Intel#Modesetting_DDX
    - https://www.reddit.com/r/Tdarr/comments/hy7slr/use_i965_hw_encodingdecoding_driver_instead_of_ihd/
    - https://www.reddit.com/r/PleX/comments/n913ui/hw_transcoding_vaapi_intel_not_working/
    - https://01.org/linuxmedia/vaapi
    - https://01.org/linuxgraphics/downloads/2018q1-intel-graphics-stack-recipe
    - https://bbs.archlinux.org/viewtopic.php?id=186501
- [ ] #vim #neovim #nvim, specific, add or implement _goto definition_ function when editing homebrew formula files to have a go to definition when cursor is on a `depends_on` block, ie. open that respected formula file
- [ ] display some sort message, alert, or menubar icon when caps lock is activated "for all that is sane" 👩🏻‍⚕️
- [ ] [vnc viewer] using _vnc viewer.app_ on macos sucks when using an external mouse to scroll through the terminal history.
    - is there some setting where the sensitivity can be set, so scroll begins with one click of the mouse wheel.
- [ ] #vim #nvim when toggling the tagbar <kbd>leader+\\</kbd> move the cursor/focus to the tagbar buffer automatically.
- [ ] #tmux #fish possible to restore scroll back history after closing tmux server and terminal _alacritty_
- [ ] #arch, set lshift+rshift to toggle caps-lock on/off
- [ ] #fish, possible to detach current pane in a tmux window from shell history, or write commands run from certain directory to specific history file to keep commands ran in a specific directory quickly accessible, ie. useful when working with a node or ruby based project.
- [ ] [alacritty] [fish] [tmux] [karabiner] [hammerspoon] _double tap esc_, ie. esc², to run the keyboard shortcut of clearing the scree, ie. prefix (tmux), then control+l
- [ ] #vim implement func to decrypt / encrypt GPG files
- [ ] #macos #homebrew howto search for homebrew taps
- [ ] #neovim review the below highlight settings, obviously time permitting of course
  - Folded
  - GitGutterAdd
  - GitGutterChange
  - GitGutterDelete
  - LineNr
  - Number
- [ ] [fish, dots] # TODO: migrate all `mac, mac-` related abbrs, alias, shell scripts to use `apl` prefix
- [ ] [vim, tmux, or macos] some form of icon / notification of **caps lock** being enabled
- [ ] [tmux] add space at the end of window names to prevent moving of text in status bar
  - **Q** can tmux separate all panes within a window from the global command history _fish shell_
- [ ] [nvim] **references** text when working with JS files, toggle with _leader+h_ as other hidden chars are toggled
- [ ] [vim, javascript] **Q** how to make certain javascript lang _keywords_ appear in italics using color / font scheme
    - **className, const, return, this.state, onClick, import**
- [ ] [tmux] put short synopsis of current weather in tmux status bar, _right side_
- [ ] **vivaldi** / **voilentmonkey**
  - youtube script, to switch view mode on viewer window hover with mouse or mash a key to bring focus to viewer window so playback shortcuts become active.
- [ ] #tmux **getting closer** it'd be nice to have a quick double tap of either <kbd>shift</kbd>key then<kbd>shift</kbd> to toggle between remote and local tmux sessions 
  - [learn more][lm1]
  - [and more][lm2] 
- [ ] [python] [fish] [virtualenv] setup keybinding <kbd>control</kbd>+<kbd>d</kbd> to exit virtualenv but not exit terminal / shell session, ie. make control+d local to the virtualenv
- [ ] #python #fish #neolambda update prompt to remove ~λ~ and put name of virtualenv instead
- [ ] see if there is a fish function of _omf_ or _fisher_ plugin that supports sharing command history between bash and fish
- [ ] make abe graphic more personal.
- [ ] spend an hour or two working on install script for aiding the process of setting up my dotfiles on fresh box 📦.

  [lm1]: <https://gist.github.com/samoshkin/05e65f7f1c9b55d3fc7690b59d678734>
  [lm2]: <https://www.freecodecamp.org/news/tmux-in-practice-local-and-nested-remote-tmux-sessions-4f7ba5db8795/>

</details> <!-- end of uncompleted todo items -->

<!-- <h3>TODOs completed</h3> -->

##

<details>
<summary><strong>TODOs completed</strong></summary>

- [x] #tmux setup a custom code fold function using vimscript or possible lua for my `tmux.conf` reference the stock `html` and `c` lang syntax files for how the use different types of expressions for code folds 🤔
    - thanks to the following [github gist][lm4], i've learned to live with `zf#j` for my user defined code folds
- [x] #arch #systemd, come to a peaceful solution on why i can't set the perms i want for my log files
    - https://github.com/systemd/systemd/issues/28302
- [x] #neovim, update config _init.lua_ when using `control+p` to search for files in _cwd_ to work with both git repos and non git repo dirs. as of right now i have use `<leader>p+f` to search / list files in a non git dir (repo)
- [x] #arch #i3 #lightdm on my current 2015 mbp when i have the thunderbolt to ethernet dongle plugged in when booting up there is an extended delay ~ 2 minutes before i can interact with i3 after inputting my password. if i disconnect my thunderbolt to ethernet dongle when booting there is no delay, and then i just plug the dongle after seeing the polybar load
    - at some point (not sure when) this "error" / "slown down" stopped happening with no config changes on my end
- [x] #fish #neovim #tree-sitter properly highlight the word `NOTE:`
- [x] #arch #linux #rofi figure out how to add additional directories to search path
    - see: https://github.com/davatorium/rofi/discussions/2002
- [x] #gitsecret reencodes secret files on every commit, **boo** 👻 WHY
- [x] #nvim RIP 🪦 `packer.nvim` looks i need to migrate to `lazy.nvim` sooner than later 😑
- [x] [fish] detach fish shell instance from command history
    - prefix commands with a <space> ie. ` ls` instead of `ls`
- [x] [vim, json] adjust default conceal settings for json files
- [x] #arch how to side scroll with standard wired USB mouse with only a vertical scroll wheel 🤔 ?
    - <kbd>shift</kbd>+<kbd>wheel</kbd> works well enough with firefox
- [x] #fish, possible to add a key binding to toggle the display of the right side prompt?
- [x] #fish add a keyboard shortcut to toggle the right prompt **on** / **off**
- [x] #nvim, using `gcc` in normal mode to toggle code comments in a `tsconfig.json` file inserts `//` instead of `/* */`
- [x] #nvim need to disable highlight color for markdown docs
- [x] [vim, markdown] have basic code folding for certain HTML tags when editing markdown documents
    > nvim-ufo FTW 🥳
- [x] [phys] reapply liquid metal to local cpu and gpu, run geekbench test before after, and exp with copper shims for gpu + cpu
    > shits old what can i say™️, cleaned main box **aug 24 2023**, applied new liquid metal
- [ ] ~~[macos] [afloat] [ke] [hammerspoon] double tap right shift, toggle keep window atop~~
- [x] [vim] navigating documents with line wraps makes jumping through buffer by line number inaccurate, wrapped lines are displayed as one line, but the jump cmd treats them as multiple
- [x] [vim] jump to open curly brace then jump back to close curly brace
    > in **normal** mode press `%` to jump from opening to closing brace
- [x] #rice, created a new branch _firewood_ for place to store things that are no longer required
- [x] #webdev #react #nvim properly setup `comment.nvim` to make the correct comments using `:gcc` in JSX
- [x] #tmux change the format of the tmux clock from 24 to 12 hour
- [x] #copypasta #fish #tmux, when logged in to a remote system via ssh, and running tmux locally and on a remote system copying the STDOUT to the local clipboard DOES NOT WORK!!!!!, **need that**
- [x] #tmux since working with multiple sessions it'd be nice to have tmux present a modal to quickly show all windows in all sessions and type the name of the window to quickly jump between tmux windows that aren't presently visible in the current tmux session. (one can dream™)
- [x] #nvim put `:yy` in system clipboard
- [x] [macos] look into creating a _lazy mouse hover_ function, if the mouse is hovering a application specific window for a certain period of time (threshold) bring that application to focus, ie. a pseudo auto hover.
- [x] [tmux] nesting tmux sessions, finish exploring (if possilbe) get a working tmux setup that allows nesting sessions.
    - https://github.com/aleclearmind/nested-tmux
    - https://forum.upcase.com/t/managing-local-and-remote-nested-tmux-sessions/7601
- [x] `init.lua` remember _code fold_ settings when closing then reopening a buffer
- [x] #ssh #tmux copy/paste it seems using my fish abbr on a remote box (arch) `pbpaste` is unable to paste the contents of my local clipboard it'd be much cooler™️ if clipboard worked seemlessly across ssh (one can dream 🦄)
- [x] #neovim Question, why does neovim always open new files with all code folds collapased?
- [x] #arch #emojis some how my key binding for launching my emoji picker emote NO LONGER WORKS!!!!!
- [x] #arch enable inteliommu as a grub boot line param
- [x] #treesitter, how to add a commentstring for a specific file ie. `polybar.ini`
- [x] **Q** does changing path to open buffers within a saved session file find new buffers with **old** neovim configuration files
    - short answer, **no** there's some automagic inside the `init.lua` either setting or plugin
- [x] #treesitter, #tmux config, `tmux.config` needs same love as `polybar.ini`
- [x] #arch how to print the battery level of BT headphones, and BT keyboard
  > TL;DR `upower -d`
- [x] #arch when generating a list of installed packages from aur, only put packages that were specifically specified, ie. dont put deps of top level packages, ie. just but _cheat_ and not all the haskell deps
  > List all explicitly installed packages: `pacman -Qe`
- [x] #arch #i3 when i3 starts firefox loads on 2nd workspace labled `1` instead of `2:web`
  - ...need to wait for al to finish loading or something of that nature 🤔
- [x] ~~#nvim, code folds in this readme `%` do not work when relaunching nvim, have to change html tag for them to work 👎~~
 > not sure what the fix was but since relaunching nvim and loading session, code folds seem to be working with markdown files 🤞
- [x] [arch], set timeout for git credential cache so i don't have to keep inputting github username/password
- [x] #alacritty #macos for the love g0d, can we please support the emoji context menu ..."we can have nice things™️"
    - ended up forking alacritty myself and pulling a PR that allow emoji context menu 🎉
- [x] #arch #linux #archlinux, `git push` always prompts for username / password, boooooo 👻
  - TODO: will credentials be persisted through reboots and into ∞ and beyond
  - will this work ...yay it worked (w00t) no more having to input PAT
  - update notes related to gpg and how i'm now storing credentials on my archbox
  - see: https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md#gpgpass-compatible-files
  - i ended up using the tool `gitcredentialmanager` installed via `yay` then installed `pass` to persist my key through reboots 
- [x] [mpv] #mpv, add global shortcuts for pausing and muting mpv regardless of the front most application, use karabiner elements for macos
    - use <kbd>fn+option+f8</kbd> for pause and <kbd>fn+option+f10</kbd> for mute
- [x] ~~[vim] [neovim] [vnc] how to paste from local to remote host when using _vnc viewer.app_ on macos~~
    - okay, my vim chops are rusty, when using terminal vim/neovim make sure `mouse=` and view the registers with `:reg` and locate the text that you'd like to paste, ie. `"*p"` is a common register that holds copied text
- [x] ~~[keyboard] [keytron] remap <kbd>control_l</kbd> <kbd>fn1</kbd> because i already have mapped <kbd>caps lock</kbd> to <kbd>control_l</kbd> no need to two left controls. [insert emoji of person wearing eyepatch, ...ohhh wait there isn't one]~~
- [x] ~~[hardware] [keytron] [k6], remamp <kbd>esc</kbd> to <kbd>`</kbd> as my caps lock key is already mapped to esc on tap~~
- [x] ~~[fish] exp with using colors for `brew.fish` function to distinguish misspelling of word~~
- [x] ~~[vim] [neovim] keep the `lcd` / `pwd` to the directory nvim was launched from **especially** if nvim was launched with no args~~
    - disabled `autochdir`, check with `:verbose set autochdir?`
- [x] [macos, wm, spectacle] ~~<kbd>cmd,option,+</kbd> have to mash <kbd>+</kbd> multiple times to increase window size, would like _hold the key down to increase size_, looking at your karabiner-elements / hammerspoon~~ [out of my control][lm3]

[lm3]: <https://github.com/rxhanson/Rectangle/discussions/346>

- [ ] [vim] #vim, using my <kbd>cmd</kbd>+</kbd>v</kbd> in vim/neovim always adds an extra line 👿
- [ ] [tmux] [ke] left double tap shift, toggle max/min pane within window [shit broke with tmux update at some point]
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

  [lm4]: <https://gist.github.com/lestoni/8c74da455cce3d36eb68>

</details>


<div align="center">

## Contact [🔝](#contents)

<a name="contact"></a>

• [**GithHub**](https://github.com/ipatch) • [**Twitter**](https://twitter.com/truckmonth) • [**GitLab**](https://gitlab.com/truckmonth) •

</div>

## 

<details>

<summary>scratchpad</summary>

> **Warning**

> **Arrow**: booooooo!

<!-- might behoove me to add a note about adding secret private files into my dotfiles repo -->
<!-- more behoovement -->

</details>

