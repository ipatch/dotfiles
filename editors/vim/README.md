# Vim & Neovim / Setup & Tooling

<a id="contents"></a>

## Contents

- [Example](#example)
- [Neovim](#neovim)
  - [Neovim Boot Time](#neovim-boot-time)
- [Useful Links](#useful-links)
- [TODOs](#todos)

> For an exhaustive collection of notes I have taken while actively working with these dotfiles using Vim and Neovim [click me](https://github.com/ipatch/dotfiles/wiki/vim-neovim-Notes) 👈

<a id="example"></a>

## Example

[_see below todo item_](#todos)

<a id="general-notes"></a>

## General Notes

❗️ **June 11, 2019** Load **vim-jsx-pretty** before **vim-polyglot** to avoid this [issue](https://github.com/MaxMEllon/vim-jsx-pretty/issues/69)

I use the same `vimrc` for both Vim 8 and Neovim on macOS and GNU+Linux distros.  That said there are a few specific settings related to Neovim contained within the `init.vim`

I use a [modified version](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/autoload/settings.vim) of a code fold function provided by wincent's [dotfiles](https://github.com/wincent/wincent) for customizing the display output chars for code folds throughout various source files.

```shell
./vim/autoload/settings.vim
```

I use minpac to install and update various Vim and Neovim Plugins, which are listed in my `vimrc`.

[`autocmds.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/autocmds.vim) found in `./vim/plugin` contains a few autocmds, ie. functions for various tasks, ie. there is an autocmd that places the cursor at the previous position when reopening a file / buffer after it has been closed.  Another useful autocmd that will refresh / update a buffer when the buffer regains focus, ie. _move focus away from current Vim / Neovim buffer, make some changes to the file that is currently open in Vim via another Vim buffer or other form of file manipulation, and when putting focus back in the buffer the changes made by the external command should be present in the Vim buffer_ (this really needs to worded better).

[`mappings.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/mappings.vim) found in `./vim/plugin` contains various mappings for making life easier while using Vim and Neovim, useful mappings include opening files, creating horizontal and vertical empty buffer splits for viewing different files within the same pane / window of a Vim / Neovim session, and a few different mappings for chaning the **lcd** and exiting **insert** mode.

[`settings.vim`](https://github.com/ipatch/dotfiles/blob/master/editors/vim/vim/plugin/settings.vim) found in `./vim/plugin` contains settings related to configuring Vim and Neovim, ie. enabling mouse support, incremental searching through files, setting up directories for _swap, undo, session, and view_ files. 

[`./vim/after/plugin`]( https://github.com/ipatch/dotfiles/tree/master/editors/vim/vim/after/plugin) contains all the `.vim` files for configuring plugins for Vim and Neovim, ie. deoplete, lightline, indentLine, and what not.

<a id="neovim"></a>

## Neovim

<details>
<summary>Screenshot 📸</summary>
<img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/Neovim-2018-april-late.png" alt="nvim-screenshot">
</details>

- To get python 2 & 3 support working with Neovim, refer to [these steps](https://github.com/ipatch/dotfiles/wiki/Neovim-Vim-Notes#python-support-setting-up-python-23)
- To verify Python 2 & 3 support has been setup and working properly within Neovim

```vim
:CheckHealth
```

<a id="plugin-manager"></a>

### plugin manager / Minpac

- ___Plugin Manager___ [minpac](https://github.com/k-takataminpac) This particular Neovim setup requires Vim >= 8.0 to be installed, and all plugins are loaded using minpac from the `.vimrc` within the home directory.
- **minpac** stores the source for Vim and Neovim plugins in the below directory

```shell
$HOME/.vim/vim/pack/minpac/start
```

> ❗️ If **.vim** is symlinked then the above directory might be different.

<a id="neovim-boot-time"></a>

### Neovim Boot Time

![Neovim boot time June](https://i.imgur.com/8UAyTlC.png)

<a id="linting-source-files"></a>

## Linting source files

> I use ALE, in conjunction with various language linters
- **HTML** tidy
- **shell** shellcheck
- **markdown** markdownlint
- **javascript** eslint

<a id="working-with-html-tidy"></a>

### Working with HTML tidy

To invoke HTML 5 tidy from a CLI

```shell
tidy [FILE.html]
```

To **not** show any output, and only errors & warning if there are any present in an HTML file

```shell
tidy -eq [FILE.html]
```

<a id="useful-links"></a>

## Useful Links

- [my github issue comment on installing uctags on macOS](https://github.com/universal-ctags/homebrew-universal-ctags/issues/23#issuecomment-583781848)

<a id="todos"></a>

## TODOs

- [ ] add a little animated gif or asciicast for showing some of the features I've setup and link to it in this README
