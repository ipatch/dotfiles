<h2 align="center">dotfiles for Chris Jones</h2>

<h3 align="center">🚨 Don't 🍺🍺🍺 and configure dotfiles.🚨</h3>

<h6 align="center">Note: These dotfiles can stop working at any time so use at your own risk.😬</h6>

#### [🐟🐚](https://github.com/fish-shell/fish-shell)

> NOTE: run the below command to symlink the fish-shell configuration directory and all files.

```shell
ln -sf $DOTFILES/config/fish/ $HOME/.config/fish
```

#### Neovim

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
> customFileTypes:
>   "source.shell": [
>      "fish"
>    ]

within the below block,
> core:

Credit: 💳 https://github.com/atom/atom/issues/1718#issuecomment-162242357

---
[@truckmonth](https://twitter.com/truckmonth)
