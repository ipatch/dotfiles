<h2 align="center">dotfiles for Chris Jones</h2>

<h3 align="center">🚨 Don't 🍺🍺🍺 and configure dotfiles.🚨</h3>

<h6 align="center">Note: These dotfiles can stop working at any time so use at your own risk.😬</h6>

#### [🐟🐚](https://github.com/fish-shell/fish-shell)

> NOTE: run the below command to symlink the fish-shell configuration directory and all files.

```shell
ln -sf $DOTFILES/config/fish/ $HOME/.config/fish
```

#### Neovim

##### Screenshot 📸
![nvim-screenshot](https://github.com/ipatch/dotfiles/blob/master/lib/vim-2017.png "nvim-screenshot")

To utilize [this Neovim configuration](https://github.com/ipatch/dotfiles/blob/master/config/nvim/init.vim) to its full potential, [vim-plug](https://github.com/junegunn/vim-plug) will need to be installed along with Python 2 or 3.

To install vim-plug copy & paste the below command in your terminal.

```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

...and once you have Python 2 or 3 installed run the below command.

```shell
pip install neovim
```

#### [Atom](http://atom.io)

To get Atom up and running 🏃 run the below commad after you have it installed<br />

```shell
apm install --packages-file /path/to/where/you/saved/packages.list
```
<p>Giving credit where credit is due. <a href="https://discuss.atom.io/t/how-to-backup-all-your-settings/15674/3">💳</a></p>

It can be beneficial to add a custom filetype for files ending with `.fish` to have syntax highlighting for fish functions files, and not having to manually set the file type in the lower right hand corner of the atom editor.

To accomplish the above mentioned task, open the atom preferences with <kbd>command</kbd>+<kbd>,</kbd> on macOS. Then look for a button labeled `Open Config Folder`.

Add the below lines to the `config.cson` file.
> customFileTypes:<br />
>   "source.shell": [<br />
>      "fish"<br />
>    ]<br />

within the below block,
> core:

Credit: [💳]( https://github.com/atom/atom/issues/1718#issuecomment-162242357)

<details>
<summary>File Structure</summary>
<pre>
├── README.md
├── asdf
├── config
│   ├── atom
│   │   └── packages.list
│   ├── fish
│   │   ├── abbreviations.fish
│   │   ├── completions
│   │   │   ├── asdf.fish
│   │   │   └── docker.fish
│   │   ├── conf.d
│   │   │   └── omf.fish
│   │   ├── config.fish
│   │   ├── config.fish.bkup
│   │   ├── fishd.7a3857f3e8b0
│   │   ├── fishd.b8e85636f766
│   │   ├── functions
│   │   │   ├── editfish.fish
│   │   │   ├── erl_cmd_his.fish
│   │   │   ├── fish_prompt.fish -> /Users/capin/.local/share/omf/themes/lambda/fish_prompt.fish
│   │   │   ├── ln_asdf_man_pages.fish
│   │   │   ├── ln_dotfiles.fish
│   │   │   ├── lsusers.fish
│   │   │   ├── mk_asdf_bins.fish
│   │   │   └── mkd.fish
│   │   └── interactive.fish
│   ├── inputrc
│   ├── irc-clients
│   │   └── weechat
│   │       ├── alias.conf
│   │       ├── buflist.conf
│   │       ├── charset.conf
│   │       ├── exec.conf
│   │       ├── fifo.conf
│   │       ├── fset.conf
│   │       ├── irc.conf
│   │       ├── logger.conf
│   │       ├── logs
│   │       │   └── core.weechat.weechatlog
│   │       ├── plugins.conf
│   │       ├── python
│   │       │   └── autoload
│   │       │       └── notification_center.py -> /opt/Code/python/weechat-notification-center/notification_center.py
│   │       ├── relay.conf
│   │       ├── script
│   │       │   └── plugins.xml.gz
│   │       ├── script.conf
│   │       ├── sec.conf
│   │       ├── tcl
│   │       │   └── autoload
│   │       ├── trigger.conf
│   │       ├── weechat.conf
│   │       ├── weechat.png
│   │       ├── xfer
│   │       └── xfer.conf
│   └── nvim
│       └── init.vim
├── editors
│   ├── atom -> /opt/Code/dotfiles/config/atom
│   ├── nvim -> /opt/Code/dotfiles/config/nvim
│   └── vim
│       ├── editorconfig
│       └── vimrc
├── git
│   └── gitconfig
├── lang
│   └── elixir
│       └── iex.exs
├── lib
│   └── custom-motd.png
├── mutt
│   └── muttrc
├── radare
│   └── radare2rc
├── shells
│   ├── bash
│   │   ├── bash_profile
│   │   └── bashrc
│   ├── fish -> /opt/Code/dotfiles/config/fish
│   └── zsh
│       ├── zlogin
│       └── zshrc
├── terms
│   ├── hyper
│   │   └── hyper.js
│   └── iterm2
│       └── com.googlecode.iterm2.plist
└── tmux
    └── tmux.conf

35 directories, 54 files
</pre>
</details>

---
[@truckmonth](https://twitter.com/truckmonth)

