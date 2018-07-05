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
  - [ ] Figure out a way to save fold settings across all open buffers when quiting Vim.
  - [ ] Figure out why folds are only being saved / preserved for the last open buffer when quiting Vim 🤔
  - [ ] Vim Sesssions, Folds, and Conceals will be the death of me 💀
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

