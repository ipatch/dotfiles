# Vim & Neovim Setup

<a id="contents"></a>

## Contents

- [Neovim](#neovim)
  - [Neovim Boot Time](#neovim-boot-time)

> For an exhaustive collection of notes I have taken while actively working with these dotfiles using Vim and Neovim 👉 [click me](https://github.com/ipatch/dotfiles/wiki/vim-neovim-Notes) 👈

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
