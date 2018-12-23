# Vim & Neovim Setup & Tooling

<a id="contents"></a>

## Contents

- [Neovim](#neovim)
  - [Neovim Boot Time](#neovim-boot-time)

> For an exhaustive collection of notes I have taken while actively working with these dotfiles using Vim and Neovim [click me](https://github.com/ipatch/dotfiles/wiki/vim-neovim-Notes) 👈

## General Notes

I use the same vimrc file for both Vim 8 and Neovim on macOS and GNU+Linux distros.  That said there are a few specific settings related to Neovim contained with the `.init.vim`

I use a custom code fold function provided by wincent's [dotfiles](https://github.com/wincent/wincent) for customizing the display output chars for code folds throughout various source files.  The file that contains the settings related to custom code fold settings is located below

```shell
./editors/vim/vim/autoload/settings.vim
```

I use minpac to install and update various Vim and Neovim Plugins, and the list of plugins I have installed can be found within my **vimrc**.

**autocmds.vim** found in `./editors/vim/vim/plugin` contains a few autocmds, ie. functions for various tasks, ie. there is an autocmd that places the cursor at the previous position when reopening a file / buffer after it has been closed.  There is another useful autocmd that will refresh / update a buffer when the buffer regains focus, ie. move focus away from current Vim / Neovim buffer, make some changes to the file that is current open in Vim via another Vim buffer or other form of file manipulation, and when putting focus back in the buffer the changes made by the external command should be present in the Vim buffer.

**mappings.vim** found in `./editors/vim/vim/plugin` contains various mappings for making life easier while using Vim and Neovim, some useful mappings are those for opening files, creating horizontal and vertical empty buffer splits for viewing different files within the same pane / window of a Vim / Neovim session, and a few different mappings for chaning the **lcd** and exiting the **insert** mode.

**settings.vim** found in `./editors/vim/vim/plugin` contains settings related to configuring Vim and Neovim, ie. enabling mouse support, incremental searching through files.  Sets up directories where swap, undo, session, and view files should be saved when working with Vim and Neovim.

<a id="neovim"></a>

## Neovim

<details>
<summary>Screenshot 📸</summary>
<img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/Neovim-2018-april-late.png" alt="nvim-screenshot">
</details>

- ___Plugin Manager___ [minpac](https://github.com/k-takataminpac) This particular Neovim setup requires Vim >= 8.0 to be installed, and all plugins are loaded using minpac from the `.vimrc` within the home directory.

1. To get python 2 & 3 support working with Neovim, refer to [these steps](https://github.com/ipatch/dotfiles/wiki/Neovim-Vim-Notes#python-support-setting-up-python-23)

2. To verify Python 2 & 3 support has been setup and working properly within Neovim

```vim
:CheckHealth
```

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
