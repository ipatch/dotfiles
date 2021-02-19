# Vim & Neovim / Setup & Tooling

## Contents

<a id="contents"></a>

- [Example](#example)
- [General Notes](#general-notes)
  - [../ Troublehsooting](#troubleshooting)
    - [../../ vim-commentary](#tshoot-vim-commentary)
- [Neovim](#neovim)
  - [Neovim Boot Time](#neovim-boot-time)
- [Useful Links](#useful-links)
- [TODOs](#todos)

> For an exhaustive collection of notes I have taken while actively working with these dotfiles using Vim and Neovim [click me](https://github.com/ipatch/dotfiles/wiki/vim-neovim-Notes) 👈


## Example

<a id="example"></a>

[_see below todo item_](#todos)


## General Notes

<a id="general-notes"></a>

❗️ **June 11, 2019** Load **vim-jsx-pretty** before **vim-polyglot** to avoid this [issue](https://github.com/MaxMEllon/vim-jsx-pretty/issues/69)

I use the same `vimrc` for both Vim 8 and Neovim on macOS and GNU+Linux distros.  That said there are a few specific settings related to Neovim contained within the `init.vim`

I use a [modified version](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/autoload/settings.vim) of a code fold function provided by wincent's [dotfiles](https://github.com/wincent/wincent) for customizing the display output chars for code folds throughout various source files.

```shell
./vim/autoload/settings.vim
```

I use minpac to install and update various Vim and Neovim Plugins, which are listed in my `vimrc`.

[`autocmds.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/autocmds.vim) found in `./vim/plugin` contains a few autocmds, ie. functions for various tasks, ie. there is an autocmd that places the cursor at the previous position when reopening a file / buffer after it has been closed.  Another useful autocmd that will refresh / update a buffer when the buffer regains focus, ie. _move focus away from current Vim / Neovim buffer, make some changes to the file that is currently open in Vim via another Vim buffer or other form of file manipulation, and when putting focus back in the buffer the changes made by the external command should be present in the Vim buffer_ (this really needs to worded better).

[`mappings.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/mappings.vim) found in `./vim/plugin` contains various mappings for making life easier while using Vim and Neovim, useful mappings include opening files, creating horizontal and vertical empty buffer splits for viewing different files within the same pane / window of a Vim / Neovim session, and a few different mappings for changing the **lcd** and exiting **insert** mode.

[`settings.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/settings.vim) found in `./vim/plugin` contains settings related to configuring Vim and Neovim, ie. enabling mouse support, incremental searching through files, setting up directories for _swap, undo, session, and view_ files. 

[`./vim/after/plugin`]( https://github.com/ipatch/dotfiles/tree/master/editors/vim/vim/after/plugin) contains all the `.vim` files for configuring plugins for Vim and Neovim, ie. deoplete, lightline, indentLine, and what not.


### General Notes / Troubleshooting

<a id="troubleshooting"></a>

When problems arise, _(and they will)_ with configuration settings a good place to start to launch Vim or Neovim without a configuration, and then gradually test such problematic setting or vim file

```shell
nvim -u NONE
```

The above command will launch Neovim with no RC file defined and all settings will be their defaults, and any user defined settings within a `~/.vimrc` etc will be ignored for the session unless they are loaded manually.

For my recent case of troubleshooting `FoldColumn` highlighting / colors for my current configuration, I launched Neovim with above command and then changed certain `highlight` settings.

FWR, the version of Neovim I'm using respects the `guifg` and `guibg` so use those instead of ~~ctermfg~~ and ~~ctermbg~~.


#### General Notes / Troubleshooting / vim-commentary

<a id="tshoot-vim-commentary"></a>

I use a vim plugin known as **vim-commentary** to set / toggle comment strings for various filetypes, ie. markdown files and what not.  The default Neovim syntax file uses `>` as the commentstring for markdown documents which github flavored markdown does not use. ie. github flavored markdown uses HTML commentstring, ie. `<!-- comment -->`

I set a custom `commentstring` for markdown files to use the HTML commentstring, however changing the `commentstring` can be problematic because if a _view_ vim file is set, the commentstring will be read from the _view_ file even though if a vim sytnax file is updated, for that reason delete the _view_ file generally located within the `./vim/tmp` directory, then set the commentstring. Finally, close & reopen vim to see if commentstring is set appropriately.  I set the `commenstring` for markdown files located within the [`plugin_vim-commentary.vim`](https://github.com/ipatch/dotfiles/commit/596936)

To see where the commentstring is being set for a particular file [learn more](https://github.com/tpope/vim-commentary/issues/90)

```vim
:verbose set commentstring?
```

#### troubleshooting / linting / coc-eslint

see the [following section][link1] related to troubleshooting eslint with coc

[link1]: #linting-coc-eslint

## Neovim

<a id="neovim"></a>

<details>
<summary>Screenshot 📸</summary>
<img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/Neovim-2018-april-late.png" alt="nvim-screenshot">
</details>

- To get python 2 & 3 support working with Neovim, refer to [these steps](https://github.com/ipatch/dotfiles/wiki/Neovim-Vim-Notes#python-support-setting-up-python-23)
- To verify Python 2 & 3 support has been setup and working properly within Neovim

```vim
:CheckHealth
```


### plugin manager / Minpac

<a id="plugin-manager"></a>

- ___Plugin Manager___ [minpac](https://github.com/k-takataminpac) This particular Neovim setup requires Vim >= 8.0 to be installed, and all plugins are loaded using minpac from the `.vimrc` within the home directory.
- **minpac** stores the source for Vim and Neovim plugins in the below directory

```shell
$HOME/.vim/vim/pack/minpac/start
```

> ❗️ If **.vim** is symlinked then the above directory might be different.


### Neovim Boot Time

<a id="neovim-boot-time"></a>

![Neovim boot time June](https://i.imgur.com/8UAyTlC.png)


## Linting source files

<a id="linting-source-files"></a>

> I have stopped using ALE for linting and have been experimenting using CoC along various CoC plugins, ie. coc-eslint to lint javascript & related files, in conjunction with various language linters.

🚨 I have not setup tidy, shellcheck, or markdownlint yet with coc, as I believe that would require loading the appropriate coc related language linter in order to lint those specific source files.

- **HTML** tidy
- **shell** shellcheck
- **markdown** markdownlint
- **javascript** eslint

### linting source files / javacript with coc-eslint

<a id="linting-coc-eslint"></a>

when updating a eslint configuration file, _say_ disabling the _no unused vars_ while drafting the file, and one wants to reload the current buffer after making changes to a eslint configuration file, just reload the buffer and making the changes. ie. `e` coc-eslint should pickup on the latest eslintrc configuration changes. if that fails for whatever reason, then restart the coc server.

```vim
CocRestart
```

#### troubleshooting coc with eslint

- error msg,

```
[coc.nvim] Failed to load the ESLint library for the document /opt/code/typescript/index.ts
```

to fix the above error msg, for my particular use case _dec 9, 2020_ all that was required was running,

```vim
CocUpdate
```

> i did resolve some path issues related to global yarn pkgs bin the other day so that may be related to addressing the above issue as well.

### Working with HTML tidy

<a id="working-with-html-tidy"></a>

To invoke HTML 5 tidy from a CLI

```shell
tidy [FILE.html]
```

To **not** show any output, and only errors & warning if there are any present in an HTML file

```shell
tidy -eq [FILE.html]
```

## Working with markdown `.md` documents

> **search query** hot reload/hotreload markdown/md documents in browser

There is a chrome extension **markdown-viewer** that allows rendering of markdown documents using the `file` URL to access local markdown documents, and provides hot reloading of the documents on save along with other assorted features [**learn more**][lnk1]

[lnk1]: <https://github.com/simov/markdown-viewer>

The above method comes across as the easiest way to render markdown documents locally while still editing the markdown file in vim, and yes there are JS and vim solutions to spin a web server and serve the document, but the above mentioned chrome extension is quite painless and gets the job done.


## Useful Links

<a id="useful-links"></a>

- [my github issue comment on installing uctags on macOS](https://github.com/universal-ctags/homebrew-universal-ctags/issues/23#issuecomment-583781848)

## TODOs

<a id="todos"></a>

- [ ] add a little animated gif or asciicast for showing some of the features I've setup and link to it in this README
