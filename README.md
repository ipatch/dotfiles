<h2 align="center">dotfiles for Chris Jones</h2>

> Give me six hours to chop down a tree and I will spend the first four sharpening the axe.

![abe](https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/abe.circle.png)

<h3 align="center">Drink Responsibly™ 🥃 while configuring dot files.</h3>

<h6 align="center"><em>These dotfiles have been known to stop working at a moments notice, so buyer beware.</em></h6>

# Table of Contents

- [the dotfiles wiki](https://github.com/ipatch/dotfiles/wiki)
> A collection of useful pages that complements 👏🏾 these dotfiles.
- [Installation](#installation)
  - [Fish shell setup](#fish-shell-setup)
  - [Neovim setup](#neovim-setup)
  - [Atom setup](#atom-setup)
- [File Structure](#file-structure)
- [Useful Links](#useful-links)
- [TODOs](#todos)

<a href="installation"></a>

## Installation

```shell
git clone --recursive git@github.com:ipatch/dotfiles.git
```

> The above shell command will clone this repo and all submodule related repos.  🤙.  To find out more about git submodules, click [here](https://github.com/ipatch/dotfiles/wiki/git-Notes#git-submodules)

<a href="fish-shell-setup"></a>

### [🐟🐚 _Fish Shell_](https://github.com/fish-shell/fish-shell)

> Run the below command to symlink the fish-shell configuration directory and all files.

```shell
ln -sf $DOTFILES/config/fish/ $HOME/.config/fish
```

<a href="neovim-setup"></a>

### Neovim

<details>
<summary>Screenshot 📸</summary>
<img src="https://raw.githubusercontent.com/wiki/ipatch/dotfiles/lib/vim-2017.png" alt="nvim-screenshot">
</details>

As of March 16, 2018, I have migrated all plugins to to use [minpac](https://github.com/k-takataminpac) This particular Neovim setup requires Vim >= 8.0 to be installed, and all plugins are loaded using minpac from the `.vimrc` in the home directory.

To get python support working with Neovim

```shell
pip3 install --user --upgrade neovim
```

To verify if python support is working

```vim
: echo has('python3')
```

<a href="atom-setup"></a>

### [Atom](http://atom.io)

To get Atom up and running 🏃 run the below commad after you have it installed<br />

```shell
apm install --packages-file /path/to/where/you/saved/packages.list
```

<p>Giving credit where credit is due. <a href="https://discuss.atom.io/t/how-to-backup-all-your-settings/15674/3">💳</a></p>

It can be beneficial to add a custom filetype for files ending with `.fish` to have syntax highlighting for fish functions files, and not having to manually set the file type in the lower right hand corner of the atom editor.

To accomplish the above mentioned task, open the atom preferences with <kbd>command</kbd>+<kbd>,</kbd> on macOS. Then look for a button labeled `Open Config Folder`.

Add the below lines to the `config.cson` file.

> customFileTypes:<br />
> "source.shell": [<br />
>
> > "fish"<br />
> > ]<br />

within the below block,

> core:

Credit: [💳](https://github.com/atom/atom/issues/1718#issuecomment-162242357)

<a href="file-structure"></a>

## File Structure

<details>
<summary>File Structure</summary>
<pre>
.
├── LICENSE
├── README.md
├── asdf
├── config
│   ├── atom
│   │   └── packages.list
│   ├── base16-iterm2
│   │   ├── LICENSE
│   │   ├── Makefile
│   │   ├── README.md
│   │   ├── base16-iterm2-256.png
│   │   ├── base16-iterm2.png
│   │   ├── itermcolors
│   │   │   ├── base16-3024-256.itermcolors
│   │   │   ├── base16-3024.itermcolors
│   │   │   ├── base16-apathy-256.itermcolors
│   │   │   ├── base16-apathy.itermcolors
│   │   │   ├── base16-ashes-256.itermcolors
│   │   │   ├── base16-ashes.itermcolors
│   │   │   ├── base16-atelier-cave-256.itermcolors
│   │   │   ├── base16-atelier-cave-light-256.itermcolors
│   │   │   ├── base16-atelier-cave-light.itermcolors
│   │   │   ├── base16-atelier-cave.itermcolors
│   │   │   ├── base16-atelier-dune-256.itermcolors
│   │   │   ├── base16-atelier-dune-light-256.itermcolors
│   │   │   ├── base16-atelier-dune-light.itermcolors
│   │   │   ├── base16-atelier-dune.itermcolors
│   │   │   ├── base16-atelier-estuary-256.itermcolors
│   │   │   ├── base16-atelier-estuary-light-256.itermcolors
│   │   │   ├── base16-atelier-estuary-light.itermcolors
│   │   │   ├── base16-atelier-estuary.itermcolors
│   │   │   ├── base16-atelier-forest-256.itermcolors
│   │   │   ├── base16-atelier-forest-light-256.itermcolors
│   │   │   ├── base16-atelier-forest-light.itermcolors
│   │   │   ├── base16-atelier-forest.itermcolors
│   │   │   ├── base16-atelier-heath-256.itermcolors
│   │   │   ├── base16-atelier-heath-light-256.itermcolors
│   │   │   ├── base16-atelier-heath-light.itermcolors
│   │   │   ├── base16-atelier-heath.itermcolors
│   │   │   ├── base16-atelier-lakeside-256.itermcolors
│   │   │   ├── base16-atelier-lakeside-light-256.itermcolors
│   │   │   ├── base16-atelier-lakeside-light.itermcolors
│   │   │   ├── base16-atelier-lakeside.itermcolors
│   │   │   ├── base16-atelier-plateau-256.itermcolors
│   │   │   ├── base16-atelier-plateau-light-256.itermcolors
│   │   │   ├── base16-atelier-plateau-light.itermcolors
│   │   │   ├── base16-atelier-plateau.itermcolors
│   │   │   ├── base16-atelier-savanna-256.itermcolors
│   │   │   ├── base16-atelier-savanna-light-256.itermcolors
│   │   │   ├── base16-atelier-savanna-light.itermcolors
│   │   │   ├── base16-atelier-savanna.itermcolors
│   │   │   ├── base16-atelier-seaside-256.itermcolors
│   │   │   ├── base16-atelier-seaside-light-256.itermcolors
│   │   │   ├── base16-atelier-seaside-light.itermcolors
│   │   │   ├── base16-atelier-seaside.itermcolors
│   │   │   ├── base16-atelier-sulphurpool-256.itermcolors
│   │   │   ├── base16-atelier-sulphurpool-light-256.itermcolors
│   │   │   ├── base16-atelier-sulphurpool-light.itermcolors
│   │   │   ├── base16-atelier-sulphurpool.itermcolors
│   │   │   ├── base16-bespin-256.itermcolors
│   │   │   ├── base16-bespin.itermcolors
│   │   │   ├── base16-brewer-256.itermcolors
│   │   │   ├── base16-brewer.itermcolors
│   │   │   ├── base16-bright-256.itermcolors
│   │   │   ├── base16-bright.itermcolors
│   │   │   ├── base16-brushtrees-256.itermcolors
│   │   │   ├── base16-brushtrees-dark-256.itermcolors
│   │   │   ├── base16-brushtrees-dark.itermcolors
│   │   │   ├── base16-brushtrees.itermcolors
│   │   │   ├── base16-chalk-256.itermcolors
│   │   │   ├── base16-chalk.itermcolors
│   │   │   ├── base16-circus-256.itermcolors
│   │   │   ├── base16-circus.itermcolors
│   │   │   ├── base16-classic-dark-256.itermcolors
│   │   │   ├── base16-classic-dark.itermcolors
│   │   │   ├── base16-classic-light-256.itermcolors
│   │   │   ├── base16-classic-light.itermcolors
│   │   │   ├── base16-codeschool-256.itermcolors
│   │   │   ├── base16-codeschool.itermcolors
│   │   │   ├── base16-cupcake-256.itermcolors
│   │   │   ├── base16-cupcake.itermcolors
│   │   │   ├── base16-cupertino-256.itermcolors
│   │   │   ├── base16-cupertino.itermcolors
│   │   │   ├── base16-darktooth-256.itermcolors
│   │   │   ├── base16-darktooth.itermcolors
│   │   │   ├── base16-default-dark-256.itermcolors
│   │   │   ├── base16-default-dark.itermcolors
│   │   │   ├── base16-default-light-256.itermcolors
│   │   │   ├── base16-default-light.itermcolors
│   │   │   ├── base16-dracula-256.itermcolors
│   │   │   ├── base16-dracula.itermcolors
│   │   │   ├── base16-eighties-256.itermcolors
│   │   │   ├── base16-eighties.itermcolors
│   │   │   ├── base16-embers-256.itermcolors
│   │   │   ├── base16-embers.itermcolors
│   │   │   ├── base16-flat-256.itermcolors
│   │   │   ├── base16-flat.itermcolors
│   │   │   ├── base16-github-256.itermcolors
│   │   │   ├── base16-github.itermcolors
│   │   │   ├── base16-google-dark-256.itermcolors
│   │   │   ├── base16-google-dark.itermcolors
│   │   │   ├── base16-google-light-256.itermcolors
│   │   │   ├── base16-google-light.itermcolors
│   │   │   ├── base16-grayscale-dark-256.itermcolors
│   │   │   ├── base16-grayscale-dark.itermcolors
│   │   │   ├── base16-grayscale-light-256.itermcolors
│   │   │   ├── base16-grayscale-light.itermcolors
│   │   │   ├── base16-greenscreen-256.itermcolors
│   │   │   ├── base16-greenscreen.itermcolors
│   │   │   ├── base16-gruvbox-dark-hard-256.itermcolors
│   │   │   ├── base16-gruvbox-dark-hard.itermcolors
│   │   │   ├── base16-gruvbox-dark-medium-256.itermcolors
│   │   │   ├── base16-gruvbox-dark-medium.itermcolors
│   │   │   ├── base16-gruvbox-dark-pale-256.itermcolors
│   │   │   ├── base16-gruvbox-dark-pale.itermcolors
│   │   │   ├── base16-gruvbox-dark-soft-256.itermcolors
│   │   │   ├── base16-gruvbox-dark-soft.itermcolors
│   │   │   ├── base16-gruvbox-light-hard-256.itermcolors
│   │   │   ├── base16-gruvbox-light-hard.itermcolors
│   │   │   ├── base16-gruvbox-light-medium-256.itermcolors
│   │   │   ├── base16-gruvbox-light-medium.itermcolors
│   │   │   ├── base16-gruvbox-light-soft-256.itermcolors
│   │   │   ├── base16-gruvbox-light-soft.itermcolors
│   │   │   ├── base16-harmonic-dark-256.itermcolors
│   │   │   ├── base16-harmonic-dark.itermcolors
│   │   │   ├── base16-harmonic-light-256.itermcolors
│   │   │   ├── base16-harmonic-light.itermcolors
│   │   │   ├── base16-hopscotch-256.itermcolors
│   │   │   ├── base16-hopscotch.itermcolors
│   │   │   ├── base16-irblack-256.itermcolors
│   │   │   ├── base16-irblack.itermcolors
│   │   │   ├── base16-isotope-256.itermcolors
│   │   │   ├── base16-isotope.itermcolors
│   │   │   ├── base16-macintosh-256.itermcolors
│   │   │   ├── base16-macintosh.itermcolors
│   │   │   ├── base16-marrakesh-256.itermcolors
│   │   │   ├── base16-marrakesh.itermcolors
│   │   │   ├── base16-materia-256.itermcolors
│   │   │   ├── base16-materia.itermcolors
│   │   │   ├── base16-material-256.itermcolors
│   │   │   ├── base16-material-darker-256.itermcolors
│   │   │   ├── base16-material-darker.itermcolors
│   │   │   ├── base16-material-lighter-256.itermcolors
│   │   │   ├── base16-material-lighter.itermcolors
│   │   │   ├── base16-material-palenight-256.itermcolors
│   │   │   ├── base16-material-palenight.itermcolors
│   │   │   ├── base16-material.itermcolors
│   │   │   ├── base16-mellow-purple-256.itermcolors
│   │   │   ├── base16-mellow-purple.itermcolors
│   │   │   ├── base16-mexico-light-256.itermcolors
│   │   │   ├── base16-mexico-light.itermcolors
│   │   │   ├── base16-mocha-256.itermcolors
│   │   │   ├── base16-mocha.itermcolors
│   │   │   ├── base16-monokai-256.itermcolors
│   │   │   ├── base16-monokai.itermcolors
│   │   │   ├── base16-nord-256.itermcolors
│   │   │   ├── base16-nord.itermcolors
│   │   │   ├── base16-ocean-256.itermcolors
│   │   │   ├── base16-ocean.itermcolors
│   │   │   ├── base16-oceanicnext-256.itermcolors
│   │   │   ├── base16-oceanicnext.itermcolors
│   │   │   ├── base16-one-light-256.itermcolors
│   │   │   ├── base16-one-light.itermcolors
│   │   │   ├── base16-onedark-256.itermcolors
│   │   │   ├── base16-onedark.itermcolors
│   │   │   ├── base16-paraiso-256.itermcolors
│   │   │   ├── base16-paraiso.itermcolors
│   │   │   ├── base16-phd-256.itermcolors
│   │   │   ├── base16-phd.itermcolors
│   │   │   ├── base16-pico-256.itermcolors
│   │   │   ├── base16-pico.itermcolors
│   │   │   ├── base16-pop-256.itermcolors
│   │   │   ├── base16-pop.itermcolors
│   │   │   ├── base16-railscasts-256.itermcolors
│   │   │   ├── base16-railscasts.itermcolors
│   │   │   ├── base16-rebecca-256.itermcolors
│   │   │   ├── base16-rebecca.itermcolors
│   │   │   ├── base16-seti-256.itermcolors
│   │   │   ├── base16-seti.itermcolors
│   │   │   ├── base16-shapeshifter-256.itermcolors
│   │   │   ├── base16-shapeshifter.itermcolors
│   │   │   ├── base16-solarflare-256.itermcolors
│   │   │   ├── base16-solarflare.itermcolors
│   │   │   ├── base16-solarized-dark-256.itermcolors
│   │   │   ├── base16-solarized-dark.itermcolors
│   │   │   ├── base16-solarized-light-256.itermcolors
│   │   │   ├── base16-solarized-light.itermcolors
│   │   │   ├── base16-spacemacs-256.itermcolors
│   │   │   ├── base16-spacemacs.itermcolors
│   │   │   ├── base16-summerfruit-dark-256.itermcolors
│   │   │   ├── base16-summerfruit-dark.itermcolors
│   │   │   ├── base16-summerfruit-light-256.itermcolors
│   │   │   ├── base16-summerfruit-light.itermcolors
│   │   │   ├── base16-tomorrow-256.itermcolors
│   │   │   ├── base16-tomorrow-night-256.itermcolors
│   │   │   ├── base16-tomorrow-night.itermcolors
│   │   │   ├── base16-tomorrow.itermcolors
│   │   │   ├── base16-tube-256.itermcolors
│   │   │   ├── base16-tube.itermcolors
│   │   │   ├── base16-twilight-256.itermcolors
│   │   │   ├── base16-twilight.itermcolors
│   │   │   ├── base16-unikitty-dark-256.itermcolors
│   │   │   ├── base16-unikitty-dark.itermcolors
│   │   │   ├── base16-unikitty-light-256.itermcolors
│   │   │   ├── base16-unikitty-light.itermcolors
│   │   │   ├── base16-woodland-256.itermcolors
│   │   │   ├── base16-woodland.itermcolors
│   │   │   ├── base16-zenburn-256.itermcolors
│   │   │   └── base16-zenburn.itermcolors
│   │   └── templates
│   │       ├── config.yaml
│   │       ├── default-256.mustache
│   │       └── default.mustache
│   ├── base16-shell
│   │   ├── LICENSE.md
│   │   ├── README.md
│   │   ├── base16-shell.plugin.zsh
│   │   ├── base16-shell.png
│   │   ├── colortest
│   │   ├── profile_helper.fish
│   │   ├── profile_helper.sh
│   │   ├── realpath
│   │   │   ├── LICENSE.txt
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── realpath.sh
│   │   │   └── t
│   │   │       ├── test_canonicalize_path
│   │   │       ├── test_readlink_emulation
│   │   │       ├── test_realpath_integration
│   │   │       └── test_resolve_symlinks
│   │   ├── scripts
│   │   │   ├── base16-3024.sh
│   │   │   ├── base16-apathy.sh
│   │   │   ├── base16-ashes.sh
│   │   │   ├── base16-atelier-cave-light.sh
│   │   │   ├── base16-atelier-cave.sh
│   │   │   ├── base16-atelier-dune-light.sh
│   │   │   ├── base16-atelier-dune.sh
│   │   │   ├── base16-atelier-estuary-light.sh
│   │   │   ├── base16-atelier-estuary.sh
│   │   │   ├── base16-atelier-forest-light.sh
│   │   │   ├── base16-atelier-forest.sh
│   │   │   ├── base16-atelier-heath-light.sh
│   │   │   ├── base16-atelier-heath.sh
│   │   │   ├── base16-atelier-lakeside-light.sh
│   │   │   ├── base16-atelier-lakeside.sh
│   │   │   ├── base16-atelier-plateau-light.sh
│   │   │   ├── base16-atelier-plateau.sh
│   │   │   ├── base16-atelier-savanna-light.sh
│   │   │   ├── base16-atelier-savanna.sh
│   │   │   ├── base16-atelier-seaside-light.sh
│   │   │   ├── base16-atelier-seaside.sh
│   │   │   ├── base16-atelier-sulphurpool-light.sh
│   │   │   ├── base16-atelier-sulphurpool.sh
│   │   │   ├── base16-bespin.sh
│   │   │   ├── base16-brewer.sh
│   │   │   ├── base16-bright.sh
│   │   │   ├── base16-brushtrees-dark.sh
│   │   │   ├── base16-brushtrees.sh
│   │   │   ├── base16-chalk.sh
│   │   │   ├── base16-circus.sh
│   │   │   ├── base16-classic-dark.sh
│   │   │   ├── base16-classic-light.sh
│   │   │   ├── base16-codeschool.sh
│   │   │   ├── base16-cupcake.sh
│   │   │   ├── base16-cupertino.sh
│   │   │   ├── base16-darktooth.sh
│   │   │   ├── base16-default-dark.sh
│   │   │   ├── base16-default-light.sh
│   │   │   ├── base16-dracula.sh
│   │   │   ├── base16-eighties.sh
│   │   │   ├── base16-embers.sh
│   │   │   ├── base16-flat.sh
│   │   │   ├── base16-github.sh
│   │   │   ├── base16-google-dark.sh
│   │   │   ├── base16-google-light.sh
│   │   │   ├── base16-grayscale-dark.sh
│   │   │   ├── base16-grayscale-light.sh
│   │   │   ├── base16-greenscreen.sh
│   │   │   ├── base16-gruvbox-dark-hard.sh
│   │   │   ├── base16-gruvbox-dark-medium.sh
│   │   │   ├── base16-gruvbox-dark-pale.sh
│   │   │   ├── base16-gruvbox-dark-soft.sh
│   │   │   ├── base16-gruvbox-light-hard.sh
│   │   │   ├── base16-gruvbox-light-medium.sh
│   │   │   ├── base16-gruvbox-light-soft.sh
│   │   │   ├── base16-harmonic-dark.sh
│   │   │   ├── base16-harmonic-light.sh
│   │   │   ├── base16-hopscotch.sh
│   │   │   ├── base16-icy.sh
│   │   │   ├── base16-irblack.sh
│   │   │   ├── base16-isotope.sh
│   │   │   ├── base16-macintosh.sh
│   │   │   ├── base16-marrakesh.sh
│   │   │   ├── base16-materia.sh
│   │   │   ├── base16-material-darker.sh
│   │   │   ├── base16-material-lighter.sh
│   │   │   ├── base16-material-palenight.sh
│   │   │   ├── base16-material.sh
│   │   │   ├── base16-mellow-purple.sh
│   │   │   ├── base16-mexico-light.sh
│   │   │   ├── base16-mocha.sh
│   │   │   ├── base16-monokai.sh
│   │   │   ├── base16-nord.sh
│   │   │   ├── base16-ocean.sh
│   │   │   ├── base16-oceanicnext.sh
│   │   │   ├── base16-one-light.sh
│   │   │   ├── base16-onedark.sh
│   │   │   ├── base16-paraiso.sh
│   │   │   ├── base16-phd.sh
│   │   │   ├── base16-pico.sh
│   │   │   ├── base16-pop.sh
│   │   │   ├── base16-porple.sh
│   │   │   ├── base16-railscasts.sh
│   │   │   ├── base16-rebecca.sh
│   │   │   ├── base16-seti.sh
│   │   │   ├── base16-shapeshifter.sh
│   │   │   ├── base16-solarflare.sh
│   │   │   ├── base16-solarized-dark.sh
│   │   │   ├── base16-solarized-light.sh
│   │   │   ├── base16-spacemacs.sh
│   │   │   ├── base16-summerfruit-dark.sh
│   │   │   ├── base16-summerfruit-light.sh
│   │   │   ├── base16-tomorrow-night.sh
│   │   │   ├── base16-tomorrow.sh
│   │   │   ├── base16-tube.sh
│   │   │   ├── base16-twilight.sh
│   │   │   ├── base16-unikitty-dark.sh
│   │   │   ├── base16-unikitty-light.sh
│   │   │   ├── base16-woodland.sh
│   │   │   ├── base16-xcode-dusk.sh
│   │   │   └── base16-zenburn.sh
│   │   ├── setting-256-colourspace-not-supported.png
│   │   └── templates
│   │       ├── config.yaml
│   │       └── default.mustache
│   ├── bitbar
│   │   └── spotify.10s.sh
│   ├── brew
│   │   ├── brew.cask.list
│   │   └── brew.list
│   ├── code -> vscode
│   ├── fish
│   │   ├── abbreviations.fish
│   │   ├── aliases.fish
│   │   ├── completions
│   │   │   ├── asdf.fish
│   │   │   └── docker.fish
│   │   ├── conf.d
│   │   │   ├── grc.fish
│   │   │   └── omf.fish
│   │   ├── config.fish
│   │   ├── config.fish.bkup
│   │   ├── fishd.b8e85636f766
│   │   ├── frameworks
│   │   │   └── omf
│   │   │       ├── bundle
│   │   │       ├── channel
│   │   │       └── theme
│   │   ├── functions
│   │   │   ├── bases.fish
│   │   │   ├── brew_find_pkg.fish
│   │   │   ├── dbus_launch.fish
│   │   │   ├── editfish.fish
│   │   │   ├── emoji.fish
│   │   │   ├── erl_cmd_his.fish
│   │   │   ├── fish_prompt.fish -> /Users/capin/.local/share/omf/themes/lambda/fish_prompt.fish
│   │   │   ├── fish_term_wrap.fish
│   │   │   ├── fish_title.fish
│   │   │   ├── fundle.fish
│   │   │   ├── git_submodule_add_commit.fish
│   │   │   ├── ln_asdf_man_pages.fish
│   │   │   ├── ln_dotfiles.fish
│   │   │   ├── mac_lsusers.fish
│   │   │   ├── mac_useradd.fish
│   │   │   ├── mk_asdf_bins.fish
│   │   │   ├── mkcd.fish
│   │   │   ├── path_add.fish
│   │   │   ├── path_pretty.fish
│   │   │   ├── path_remove.fish
│   │   │   ├── perl_print_emoji.fish
│   │   │   ├── print_fish.fish
│   │   │   ├── print_wan_ip.fish
│   │   │   ├── rtail.fish
│   │   │   ├── rvm.fish
│   │   │   ├── rvm_toggle.fish
│   │   │   ├── shell_color_palette.fish
│   │   │   ├── show_256_colors.fish
│   │   │   ├── test_true_color.fish
│   │   │   ├── toggle_anaconda_pythons.fish
│   │   │   ├── toggle_asdf_shims_and_bins.fish
│   │   │   ├── toggle_hidden_files.fish
│   │   │   ├── toggle_homebrew_python_path.fish
│   │   │   ├── toggle_homebrew_ruby.fish
│   │   │   └── vman.fish
│   │   ├── fundle
│   │   │   ├── edc
│   │   │   │   └── bass
│   │   │   │       ├── LICENSE
│   │   │   │       ├── Makefile
│   │   │   │       ├── README.md
│   │   │   │       ├── functions
│   │   │   │       │   ├── __bass.py
│   │   │   │       │   └── bass.fish
│   │   │   │       └── test
│   │   │   │           ├── fixtures
│   │   │   │           │   └── dollar_output.sh
│   │   │   │           ├── test_bass.fish
│   │   │   │           └── test_dollar_on_output.fish
│   │   │   └── tuvistavie
│   │   │       └── fish-ssh-agent
│   │   │           ├── README.md
│   │   │           ├── functions
│   │   │           │   ├── __ssh_agent_is_started.fish
│   │   │           │   └── __ssh_agent_start.fish
│   │   │           └── init.fish
│   │   └── interactive.fish
│   ├── inputrc
│   ├── irc-clients
│   │   └── weechat
│   │       ├── alias.conf
│   │       ├── aspell.conf
│   │       ├── buffers.conf
│   │       ├── buflist.conf
│   │       ├── charset.conf
│   │       ├── colorize_nicks.conf
│   │       ├── exec.conf
│   │       ├── fifo.conf
│   │       ├── fset.conf
│   │       ├── irc.conf
│   │       ├── iset.conf
│   │       ├── logger.conf
│   │       ├── logs
│   │       │   ├── core.weechat.weechatlog
│   │       │   ├── irc.efnet.#netbsd.weechatlog
│   │       │   ├── irc.freenode.##homebrew.weechatlog
│   │       │   ├── irc.freenode.##sed.weechatlog
│   │       │   ├── irc.freenode.#applescript.weechatlog
│   │       │   ├── irc.freenode.#atom.weechatlog
│   │       │   ├── irc.freenode.#blahblah.weechatlog
│   │       │   ├── irc.freenode.#chromium-support.weechatlog
│   │       │   ├── irc.freenode.#chromium.weechatlog
│   │       │   ├── irc.freenode.#cmake.weechatlog
│   │       │   ├── irc.freenode.#debian.weechatlog
│   │       │   ├── irc.freenode.#facetimehd.weechatlog
│   │       │   ├── irc.freenode.#filmsbykris.weechatlog
│   │       │   ├── irc.freenode.#firefox-unregistered.weechatlog
│   │       │   ├── irc.freenode.#fish.weechatlog
│   │       │   ├── irc.freenode.#freenode.weechatlog
│   │       │   ├── irc.freenode.#gcc.weechatlog
│   │       │   ├── irc.freenode.#gdb.weechatlog
│   │       │   ├── irc.freenode.#git.weechatlog
│   │       │   ├── irc.freenode.#github.weechatlog
│   │       │   ├── irc.freenode.#iterm2.weechatlog
│   │       │   ├── irc.freenode.#kegbot.weechatlog
│   │       │   ├── irc.freenode.#lfs-support.weechatlog
│   │       │   ├── irc.freenode.#machomebrew.weechatlog
│   │       │   ├── irc.freenode.#mipslinux.weechatlog
│   │       │   ├── irc.freenode.#mpv.weechatlog
│   │       │   ├── irc.freenode.#my-super-fancy-test-channel.weechatlog
│   │       │   ├── irc.freenode.#my_super_fancy_test_channel.weechatlog
│   │       │   ├── irc.freenode.#neomutt.weechatlog
│   │       │   ├── irc.freenode.#netbsd.weechatlog
│   │       │   ├── irc.freenode.#openjtag.weechatlog
│   │       │   ├── irc.freenode.#openocd.weechatlog
│   │       │   ├── irc.freenode.#openwrt.weechatlog
│   │       │   ├── irc.freenode.#osxre.weechatlog
│   │       │   ├── irc.freenode.#python-unregistered.weechatlog
│   │       │   ├── irc.freenode.#radare.weechatlog
│   │       │   ├── irc.freenode.#rsync.weechatlog
│   │       │   ├── irc.freenode.#ruby.weechatlog
│   │       │   ├── irc.freenode.#test-channel.weechatlog
│   │       │   ├── irc.freenode.#theairportwiki.weechatlog
│   │       │   ├── irc.freenode.#tmux.weechatlog
│   │       │   ├── irc.freenode.#weechat.weechatlog
│   │       │   ├── irc.freenode.#xorg.weechatlog
│   │       │   ├── irc.freenode.capin.weechatlog
│   │       │   ├── irc.freenode.capin1.weechatlog
│   │       │   ├── irc.oftc.#fish.weechatlog
│   │       │   ├── irc.oftc.#qemu.weechatlog
│   │       │   ├── irc.server.efnet.weechatlog
│   │       │   ├── irc.server.freenode.weechatlog
│   │       │   └── irc.server.oftc.weechatlog
│   │       ├── lua
│   │       │   └── autoload
│   │       ├── perl
│   │       │   ├── autoload
│   │       │   │   ├── iset.pl -> ../iset.pl
│   │       │   │   ├── multiline.pl -> ../multiline.pl
│   │       │   │   └── nickregain.pl -> ../nickregain.pl
│   │       │   ├── iset.pl
│   │       │   ├── multiline.pl
│   │       │   └── nickregain.pl
│   │       ├── plugins.conf
│   │       ├── python
│   │       │   ├── autojoin.py
│   │       │   ├── autoload
│   │       │   │   ├── autojoin.py -> ../autojoin.py
│   │       │   │   ├── colorize_nicks.py -> ../colorize_nicks.py
│   │       │   │   ├── histsearch.py -> ../histsearch.py
│   │       │   │   └── pyrnotify.py -> ../pyrnotify.py
│   │       │   ├── colorize_nicks.py
│   │       │   ├── histsearch.py
│   │       │   └── pyrnotify.py
│   │       ├── relay.conf
│   │       ├── ruby
│   │       │   └── autoload
│   │       ├── script
│   │       │   └── plugins.xml.gz
│   │       ├── script.conf
│   │       ├── sec.conf
│   │       ├── tcl
│   │       │   └── autoload
│   │       ├── trigger.conf
│   │       ├── weechat.conf
│   │       ├── weechat.log
│   │       ├── weechat.png
│   │       ├── xfer
│   │       └── xfer.conf
│   ├── mpv
│   │   ├── input.conf
│   │   ├── mpv.conf
│   │   └── watch_later
│   ├── nvim
│   │   └── init.vim
│   └── vscode
│       ├── keybindings.json
│       └── settings.json
├── editors
│   ├── atom -> /opt/Code/dotfiles/config/atom
│   ├── code -> /opt/Code/dotfiles/config/code
│   ├── nvim -> /opt/Code/dotfiles/config/nvim
│   └── vim
│       ├── editorconfig
│       ├── vim
│       │   ├── bundle
│       │   │   ├── Vundle.vim
│       │   │   │   ├── CONTRIBUTING.md
│       │   │   │   ├── LICENSE-MIT.txt
│       │   │   │   ├── README.md
│       │   │   │   ├── README_ZH_CN.md
│       │   │   │   ├── README_ZH_TW.md
│       │   │   │   ├── autoload
│       │   │   │   │   ├── vundle
│       │   │   │   │   │   ├── config.vim
│       │   │   │   │   │   ├── installer.vim
│       │   │   │   │   │   └── scripts.vim
│       │   │   │   │   └── vundle.vim
│       │   │   │   ├── changelog.md
│       │   │   │   ├── doc
│       │   │   │   │   ├── tags
│       │   │   │   │   └── vundle.txt
│       │   │   │   ├── ftplugin
│       │   │   │   │   └── vundlelog.vim
│       │   │   │   ├── syntax
│       │   │   │   │   └── vundlelog.vim
│       │   │   │   └── test
│       │   │   │       ├── files
│       │   │   │       │   └── test.erl
│       │   │   │       ├── minirc.vim
│       │   │   │       └── vimrc
│       │   │   ├── ctrlp.vim
│       │   │   │   ├── autoload
│       │   │   │   │   ├── ctrlp
│       │   │   │   │   │   ├── autoignore.vim
│       │   │   │   │   │   ├── bookmarkdir.vim
│       │   │   │   │   │   ├── buffertag.vim
│       │   │   │   │   │   ├── changes.vim
│       │   │   │   │   │   ├── dir.vim
│       │   │   │   │   │   ├── line.vim
│       │   │   │   │   │   ├── mixed.vim
│       │   │   │   │   │   ├── mrufiles.vim
│       │   │   │   │   │   ├── quickfix.vim
│       │   │   │   │   │   ├── rtscript.vim
│       │   │   │   │   │   ├── tag.vim
│       │   │   │   │   │   ├── undo.vim
│       │   │   │   │   │   └── utils.vim
│       │   │   │   │   └── ctrlp.vim
│       │   │   │   ├── doc
│       │   │   │   │   ├── ctrlp.cnx
│       │   │   │   │   ├── ctrlp.txt
│       │   │   │   │   ├── tags
│       │   │   │   │   └── tags-cn
│       │   │   │   ├── plugin
│       │   │   │   │   └── ctrlp.vim
│       │   │   │   └── readme.md
│       │   │   ├── editorconfig-vim
│       │   │   │   ├── CONTRIBUTORS
│       │   │   │   ├── LICENSE
│       │   │   │   ├── README.md
│       │   │   │   ├── autoload
│       │   │   │   │   └── editorconfig.vim
│       │   │   │   ├── doc
│       │   │   │   │   ├── editorconfig.txt
│       │   │   │   │   └── tags
│       │   │   │   ├── mkzip.sh
│       │   │   │   ├── plugin
│       │   │   │   │   ├── editorconfig-core-py
│       │   │   │   │   │   ├── CMakeLists.txt
│       │   │   │   │   │   ├── LICENSE.txt
│       │   │   │   │   │   ├── MANIFEST.in
│       │   │   │   │   │   ├── README.rst
│       │   │   │   │   │   ├── docs
│       │   │   │   │   │   │   ├── Makefile
│       │   │   │   │   │   │   ├── command_line_usage.rst
│       │   │   │   │   │   │   ├── conf.py
│       │   │   │   │   │   │   ├── index.rst
│       │   │   │   │   │   │   ├── make.bat
│       │   │   │   │   │   │   ├── plugins.rst
│       │   │   │   │   │   │   └── usage.rst
│       │   │   │   │   │   ├── editorconfig
│       │   │   │   │   │   │   ├── __init__.py
│       │   │   │   │   │   │   ├── __init__.pyc
│       │   │   │   │   │   │   ├── __pycache__
│       │   │   │   │   │   │   │   ├── __init__.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── compat.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── exceptions.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── fnmatch.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── handler.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── ini.cpython-36.pyc
│       │   │   │   │   │   │   │   ├── odict.cpython-36.pyc
│       │   │   │   │   │   │   │   └── versiontools.cpython-36.pyc
│       │   │   │   │   │   │   ├── compat.py
│       │   │   │   │   │   │   ├── compat.pyc
│       │   │   │   │   │   │   ├── exceptions.py
│       │   │   │   │   │   │   ├── exceptions.pyc
│       │   │   │   │   │   │   ├── fnmatch.py
│       │   │   │   │   │   │   ├── fnmatch.pyc
│       │   │   │   │   │   │   ├── handler.py
│       │   │   │   │   │   │   ├── handler.pyc
│       │   │   │   │   │   │   ├── ini.py
│       │   │   │   │   │   │   ├── ini.pyc
│       │   │   │   │   │   │   ├── main.py
│       │   │   │   │   │   │   ├── odict.py
│       │   │   │   │   │   │   ├── odict.pyc
│       │   │   │   │   │   │   ├── versiontools.py
│       │   │   │   │   │   │   └── versiontools.pyc
│       │   │   │   │   │   ├── main.py
│       │   │   │   │   │   └── setup.py
│       │   │   │   │   ├── editorconfig.py
│       │   │   │   │   └── editorconfig.vim
│       │   │   │   └── tests
│       │   │   │       ├── Gemfile
│       │   │   │       ├── Gemfile.lock
│       │   │   │       ├── Rakefile
│       │   │   │       └── spec
│       │   │   │           ├── editorconfig_spec.rb
│       │   │   │           └── plugin_tests
│       │   │   │               ├── README.rst
│       │   │   │               ├── templates
│       │   │   │               │   └── linux.editorconfig
│       │   │   │               ├── test_files
│       │   │   │               │   ├── 3_space.txt
│       │   │   │               │   ├── 4_space.py
│       │   │   │               │   ├── 4_tab.txt
│       │   │   │               │   ├── 4_tab_width_of_8.txt
│       │   │   │               │   ├── latin1.txt
│       │   │   │               │   ├── no_trim.txt
│       │   │   │               │   ├── space.txt
│       │   │   │               │   ├── tab.txt
│       │   │   │               │   ├── trim.txt
│       │   │   │               │   └── utf-8.txt
│       │   │   │               └── tests
│       │   │   │                   ├── charset.rst
│       │   │   │                   ├── end_of_line.rst
│       │   │   │                   ├── indentation.rst
│       │   │   │                   ├── insert_final_newline.rst
│       │   │   │                   └── trim_trailing_whitespace.rst
│       │   │   ├── nerdcommenter
│       │   │   │   ├── README.md
│       │   │   │   ├── Rakefile
│       │   │   │   ├── doc
│       │   │   │   │   ├── NERD_commenter.txt
│       │   │   │   │   └── tags
│       │   │   │   └── plugin
│       │   │   │       └── NERD_commenter.vim
│       │   │   ├── nerdtree
│       │   │   │   ├── CHANGELOG
│       │   │   │   ├── LICENCE
│       │   │   │   ├── README.markdown
│       │   │   │   ├── autoload
│       │   │   │   │   ├── nerdtree
│       │   │   │   │   │   └── ui_glue.vim
│       │   │   │   │   └── nerdtree.vim
│       │   │   │   ├── doc
│       │   │   │   │   ├── NERD_tree.txt
│       │   │   │   │   └── tags
│       │   │   │   ├── lib
│       │   │   │   │   └── nerdtree
│       │   │   │   │       ├── bookmark.vim
│       │   │   │   │       ├── creator.vim
│       │   │   │   │       ├── event.vim
│       │   │   │   │       ├── flag_set.vim
│       │   │   │   │       ├── key_map.vim
│       │   │   │   │       ├── menu_controller.vim
│       │   │   │   │       ├── menu_item.vim
│       │   │   │   │       ├── nerdtree.vim
│       │   │   │   │       ├── notifier.vim
│       │   │   │   │       ├── opener.vim
│       │   │   │   │       ├── path.vim
│       │   │   │   │       ├── tree_dir_node.vim
│       │   │   │   │       ├── tree_file_node.vim
│       │   │   │   │       └── ui.vim
│       │   │   │   ├── nerdtree_plugin
│       │   │   │   │   ├── exec_menuitem.vim
│       │   │   │   │   └── fs_menu.vim
│       │   │   │   ├── plugin
│       │   │   │   │   └── NERD_tree.vim
│       │   │   │   └── syntax
│       │   │   │       └── nerdtree.vim
│       │   │   ├── vim-airline
│       │   │   │   ├── CHANGELOG.md
│       │   │   │   ├── CONTRIBUTING.md
│       │   │   │   ├── Gemfile
│       │   │   │   ├── ISSUE_TEMPLATE.md
│       │   │   │   ├── LICENSE
│       │   │   │   ├── README.md
│       │   │   │   ├── Rakefile
│       │   │   │   ├── autoload
│       │   │   │   │   ├── airline
│       │   │   │   │   │   ├── builder.vim
│       │   │   │   │   │   ├── debug.vim
│       │   │   │   │   │   ├── extensions
│       │   │   │   │   │   │   ├── branch.vim
│       │   │   │   │   │   │   ├── bufferline.vim
│       │   │   │   │   │   │   ├── capslock.vim
│       │   │   │   │   │   │   ├── commandt.vim
│       │   │   │   │   │   │   ├── csv.vim
│       │   │   │   │   │   │   ├── ctrlp.vim
│       │   │   │   │   │   │   ├── ctrlspace.vim
│       │   │   │   │   │   │   ├── default.vim
│       │   │   │   │   │   │   ├── eclim.vim
│       │   │   │   │   │   │   ├── example.vim
│       │   │   │   │   │   │   ├── hunks.vim
│       │   │   │   │   │   │   ├── netrw.vim
│       │   │   │   │   │   │   ├── nrrwrgn.vim
│       │   │   │   │   │   │   ├── obsession.vim
│       │   │   │   │   │   │   ├── po.vim
│       │   │   │   │   │   │   ├── promptline.vim
│       │   │   │   │   │   │   ├── quickfix.vim
│       │   │   │   │   │   │   ├── syntastic.vim
│       │   │   │   │   │   │   ├── tabline
│       │   │   │   │   │   │   │   ├── autoshow.vim
│       │   │   │   │   │   │   │   ├── buffers.vim
│       │   │   │   │   │   │   │   ├── buflist.vim
│       │   │   │   │   │   │   │   ├── ctrlspace.vim
│       │   │   │   │   │   │   │   ├── formatters
│       │   │   │   │   │   │   │   │   ├── default.vim
│       │   │   │   │   │   │   │   │   ├── unique_tail.vim
│       │   │   │   │   │   │   │   │   └── unique_tail_improved.vim
│       │   │   │   │   │   │   │   └── tabs.vim
│       │   │   │   │   │   │   ├── tabline.vim
│       │   │   │   │   │   │   ├── tagbar.vim
│       │   │   │   │   │   │   ├── tmuxline.vim
│       │   │   │   │   │   │   ├── undotree.vim
│       │   │   │   │   │   │   ├── unicode.vim
│       │   │   │   │   │   │   ├── unite.vim
│       │   │   │   │   │   │   ├── virtualenv.vim
│       │   │   │   │   │   │   ├── whitespace.vim
│       │   │   │   │   │   │   ├── windowswap.vim
│       │   │   │   │   │   │   ├── wordcount
│       │   │   │   │   │   │   │   └── formatters
│       │   │   │   │   │   │   │       └── default.vim
│       │   │   │   │   │   │   ├── wordcount.vim
│       │   │   │   │   │   │   └── ycm.vim
│       │   │   │   │   │   ├── extensions.vim
│       │   │   │   │   │   ├── highlighter.vim
│       │   │   │   │   │   ├── init.vim
│       │   │   │   │   │   ├── msdos.vim
│       │   │   │   │   │   ├── parts.vim
│       │   │   │   │   │   ├── section.vim
│       │   │   │   │   │   ├── themes
│       │   │   │   │   │   │   └── dark.vim
│       │   │   │   │   │   ├── themes.vim
│       │   │   │   │   │   └── util.vim
│       │   │   │   │   └── airline.vim
│       │   │   │   ├── doc
│       │   │   │   │   ├── airline.txt
│       │   │   │   │   └── tags
│       │   │   │   ├── plugin
│       │   │   │   │   └── airline.vim
│       │   │   │   └── t
│       │   │   │       ├── airline.vim
│       │   │   │       ├── builder.vim
│       │   │   │       ├── commands.vim
│       │   │   │       ├── extensions_default.vim
│       │   │   │       ├── highlighter.vim
│       │   │   │       ├── init.vim
│       │   │   │       ├── parts.vim
│       │   │   │       ├── section.vim
│       │   │   │       ├── themes.vim
│       │   │   │       └── util.vim
│       │   │   ├── vim-colorschemes
│       │   │   │   ├── README.md
│       │   │   │   └── colors
│       │   │   │       ├── 0x7A69_dark.vim
│       │   │   │       ├── 1989.vim
│       │   │   │       ├── 256-grayvim.vim
│       │   │   │       ├── 256-jungle.vim
│       │   │   │       ├── 256_noir.vim
│       │   │   │       ├── 3dglasses.vim
│       │   │   │       ├── Benokai.vim
│       │   │   │       ├── BlackSea.vim
│       │   │   │       ├── C64.vim
│       │   │   │       ├── CandyPaper.vim
│       │   │   │       ├── Chasing_Logic.vim
│       │   │   │       ├── ChocolateLiquor.vim
│       │   │   │       ├── ChocolatePapaya.vim
│       │   │   │       ├── CodeFactoryv3.vim
│       │   │   │       ├── DevC++.vim
│       │   │   │       ├── Dev_Delight.vim
│       │   │   │       ├── Monokai.vim
│       │   │   │       ├── MountainDew.vim
│       │   │   │       ├── OceanicNext.vim
│       │   │   │       ├── PapayaWhip.vim
│       │   │   │       ├── PaperColor.vim
│       │   │   │       ├── Revolution.vim
│       │   │   │       ├── SlateDark.vim
│       │   │   │       ├── Spink.vim
│       │   │   │       ├── SweetCandy.vim
│       │   │   │       ├── Tomorrow-Night-Blue.vim
│       │   │   │       ├── Tomorrow-Night-Bright.vim
│       │   │   │       ├── Tomorrow-Night-Eighties.vim
│       │   │   │       ├── Tomorrow-Night.vim
│       │   │   │       ├── Tomorrow.vim
│       │   │   │       ├── VIvid.vim
│       │   │   │       ├── abbott.vim
│       │   │   │       ├── abra.vim
│       │   │   │       ├── adam.vim
│       │   │   │       ├── adaryn.vim
│       │   │   │       ├── adobe.vim
│       │   │   │       ├── adrian.vim
│       │   │   │       ├── advantage.vim
│       │   │   │       ├── af.vim
│       │   │   │       ├── aiseered.vim
│       │   │   │       ├── alduin.vim
│       │   │   │       ├── anderson.vim
│       │   │   │       ├── anotherdark.vim
│       │   │   │       ├── ansi_blows.vim
│       │   │   │       ├── antares.vim
│       │   │   │       ├── apprentice.vim
│       │   │   │       ├── aqua.vim
│       │   │   │       ├── argonaut.vim
│       │   │   │       ├── ashen.vim
│       │   │   │       ├── asmanian_blood.vim
│       │   │   │       ├── astronaut.vim
│       │   │   │       ├── asu1dark.vim
│       │   │   │       ├── atom.vim
│       │   │   │       ├── automation.vim
│       │   │   │       ├── autumn.vim
│       │   │   │       ├── autumnleaf.vim
│       │   │   │       ├── babymate256.vim
│       │   │   │       ├── badwolf.vim
│       │   │   │       ├── base.vim
│       │   │   │       ├── base16-ateliercave.vim
│       │   │   │       ├── base16-atelierdune.vim
│       │   │   │       ├── base16-atelierestuary.vim
│       │   │   │       ├── base16-atelierforest.vim
│       │   │   │       ├── base16-atelierheath.vim
│       │   │   │       ├── base16-atelierlakeside.vim
│       │   │   │       ├── base16-atelierplateau.vim
│       │   │   │       ├── base16-ateliersavanna.vim
│       │   │   │       ├── base16-atelierseaside.vim
│       │   │   │       ├── base16-ateliersulphurpool.vim
│       │   │   │       ├── base16-railscasts.vim
│       │   │   │       ├── basic.vim
│       │   │   │       ├── bayQua.vim
│       │   │   │       ├── baycomb.vim
│       │   │   │       ├── bclear.vim
│       │   │   │       ├── beachcomber.vim
│       │   │   │       ├── beauty256.vim
│       │   │   │       ├── beekai.vim
│       │   │   │       ├── behelit.vim
│       │   │   │       ├── benlight.vim
│       │   │   │       ├── bensday.vim
│       │   │   │       ├── billw.vim
│       │   │   │       ├── biogoo.vim
│       │   │   │       ├── birds-of-paradise.vim
│       │   │   │       ├── black_angus.vim
│       │   │   │       ├── blackbeauty.vim
│       │   │   │       ├── blackboard.vim
│       │   │   │       ├── blackdust.vim
│       │   │   │       ├── blacklight.vim
│       │   │   │       ├── blazer.vim
│       │   │   │       ├── blink.vim
│       │   │   │       ├── blue.vim
│       │   │   │       ├── bluechia.vim
│       │   │   │       ├── bluedrake.vim
│       │   │   │       ├── bluegreen.vim
│       │   │   │       ├── blueprint.vim
│       │   │   │       ├── blueshift.vim
│       │   │   │       ├── bluez.vim
│       │   │   │       ├── blugrine.vim
│       │   │   │       ├── bmichaelsen.vim
│       │   │   │       ├── bocau.vim
│       │   │   │       ├── bog.vim
│       │   │   │       ├── borland.vim
│       │   │   │       ├── breeze.vim
│       │   │   │       ├── brogrammer.vim
│       │   │   │       ├── brookstream.vim
│       │   │   │       ├── brown.vim
│       │   │   │       ├── bubblegum-256-dark.vim
│       │   │   │       ├── bubblegum-256-light.vim
│       │   │   │       ├── bubblegum.vim
│       │   │   │       ├── buddy.vim
│       │   │   │       ├── burnttoast256.vim
│       │   │   │       ├── busierbee.vim
│       │   │   │       ├── busybee.vim
│       │   │   │       ├── buttercream.vim
│       │   │   │       ├── bvemu.vim
│       │   │   │       ├── bw.vim
│       │   │   │       ├── c.vim
│       │   │   │       ├── cabin.vim
│       │   │   │       ├── cake.vim
│       │   │   │       ├── cake16.vim
│       │   │   │       ├── calmar256-light.vim
│       │   │   │       ├── camo.vim
│       │   │   │       ├── campfire.vim
│       │   │   │       ├── candy.vim
│       │   │   │       ├── candycode.vim
│       │   │   │       ├── candyman.vim
│       │   │   │       ├── caramel.vim
│       │   │   │       ├── carrot.vim
│       │   │   │       ├── carvedwood.vim
│       │   │   │       ├── carvedwoodcool.vim
│       │   │   │       ├── cascadia.vim
│       │   │   │       ├── cgpro.vim
│       │   │   │       ├── chance-of-storm.vim
│       │   │   │       ├── charged-256.vim
│       │   │   │       ├── charon.vim
│       │   │   │       ├── chela_light.vim
│       │   │   │       ├── chlordane.vim
│       │   │   │       ├── chocolate.vim
│       │   │   │       ├── chrysoprase.vim
│       │   │   │       ├── ciscoacl.vim
│       │   │   │       ├── clarity.vim
│       │   │   │       ├── cleanphp.vim
│       │   │   │       ├── cleanroom.vim
│       │   │   │       ├── clearance.vim
│       │   │   │       ├── cloudy.vim
│       │   │   │       ├── clue.vim
│       │   │   │       ├── cobalt.vim
│       │   │   │       ├── cobalt2.vim
│       │   │   │       ├── cobaltish.vim
│       │   │   │       ├── coda.vim
│       │   │   │       ├── codeblocks_dark.vim
│       │   │   │       ├── codeburn.vim
│       │   │   │       ├── codeschool.vim
│       │   │   │       ├── coffee.vim
│       │   │   │       ├── coldgreen.vim
│       │   │   │       ├── colorer.vim
│       │   │   │       ├── colorful.vim
│       │   │   │       ├── colorful256.vim
│       │   │   │       ├── colorsbox-faff.vim
│       │   │   │       ├── colorsbox-greenish.vim
│       │   │   │       ├── colorsbox-material.vim
│       │   │   │       ├── colorsbox-stblue.vim
│       │   │   │       ├── colorsbox-stbright.vim
│       │   │   │       ├── colorsbox-steighties.vim
│       │   │   │       ├── colorsbox-stnight.vim
│       │   │   │       ├── colorscheme_template.vim
│       │   │   │       ├── colorzone.vim
│       │   │   │       ├── contrasty.vim
│       │   │   │       ├── cool.vim
│       │   │   │       ├── corn.vim
│       │   │   │       ├── corporation.vim
│       │   │   │       ├── crayon.vim
│       │   │   │       ├── cthulhian.vim
│       │   │   │       ├── custom.vim
│       │   │   │       ├── d8g_01.vim
│       │   │   │       ├── d8g_02.vim
│       │   │   │       ├── d8g_03.vim
│       │   │   │       ├── d8g_04.vim
│       │   │   │       ├── dante.vim
│       │   │   │       ├── dark-ruby.vim
│       │   │   │       ├── darkBlue.vim
│       │   │   │       ├── darkZ.vim
│       │   │   │       ├── darkblack.vim
│       │   │   │       ├── darkblue2.vim
│       │   │   │       ├── darkbone.vim
│       │   │   │       ├── darkburn.vim
│       │   │   │       ├── darkdot.vim
│       │   │   │       ├── darkeclipse.vim
│       │   │   │       ├── darker-robin.vim
│       │   │   │       ├── darkerdesert.vim
│       │   │   │       ├── darkocean.vim
│       │   │   │       ├── darkrobot.vim
│       │   │   │       ├── darkslategray.vim
│       │   │   │       ├── darkspectrum.vim
│       │   │   │       ├── darktango.vim
│       │   │   │       ├── darkzen.vim
│       │   │   │       ├── darth.vim
│       │   │   │       ├── dawn.vim
│       │   │   │       ├── deepsea.vim
│       │   │   │       ├── delek.vim
│       │   │   │       ├── delphi.vim
│       │   │   │       ├── denim.vim
│       │   │   │       ├── derefined.vim
│       │   │   │       ├── desert.vim
│       │   │   │       ├── desert256.vim
│       │   │   │       ├── desert256v2.vim
│       │   │   │       ├── desertEx.vim
│       │   │   │       ├── desertedocean.vim
│       │   │   │       ├── desertedoceanburnt.vim
│       │   │   │       ├── desertink.vim
│       │   │   │       ├── detailed.vim
│       │   │   │       ├── devbox-dark-256.vim
│       │   │   │       ├── deveiate.vim
│       │   │   │       ├── developer.vim
│       │   │   │       ├── disciple.vim
│       │   │   │       ├── distinguished.vim
│       │   │   │       ├── django.vim
│       │   │   │       ├── donbass.vim
│       │   │   │       ├── doorhinge.vim
│       │   │   │       ├── doriath.vim
│       │   │   │       ├── dual.vim
│       │   │   │       ├── dull.vim
│       │   │   │       ├── duotone-dark.vim
│       │   │   │       ├── duotone-darkcave.vim
│       │   │   │       ├── duotone-darkdesert.vim
│       │   │   │       ├── duotone-darkearth.vim
│       │   │   │       ├── duotone-darkforest.vim
│       │   │   │       ├── duotone-darkheath.vim
│       │   │   │       ├── duotone-darklake.vim
│       │   │   │       ├── duotone-darkmeadow.vim
│       │   │   │       ├── duotone-darkpark.vim
│       │   │   │       ├── duotone-darkpool.vim
│       │   │   │       ├── duotone-darksea.vim
│       │   │   │       ├── duotone-darkspace.vim
│       │   │   │       ├── dusk.vim
│       │   │   │       ├── earendel.vim
│       │   │   │       ├── earth.vim
│       │   │   │       ├── earthburn.vim
│       │   │   │       ├── eclipse.vim
│       │   │   │       ├── eclm_wombat.vim
│       │   │   │       ├── ecostation.vim
│       │   │   │       ├── editplus.vim
│       │   │   │       ├── edo_sea.vim
│       │   │   │       ├── ego.vim
│       │   │   │       ├── ekinivim.vim
│       │   │   │       ├── ekvoli.vim
│       │   │   │       ├── elda.vim
│       │   │   │       ├── elise.vim
│       │   │   │       ├── elisex.vim
│       │   │   │       ├── elrodeo.vim
│       │   │   │       ├── elrond.vim
│       │   │   │       ├── emacs.vim
│       │   │   │       ├── enigma.vim
│       │   │   │       ├── enzyme.vim
│       │   │   │       ├── erez.vim
│       │   │   │       ├── eva.vim
│       │   │   │       ├── eva01.vim
│       │   │   │       ├── evening.vim
│       │   │   │       ├── evening_2.vim
│       │   │   │       ├── evolution.vim
│       │   │   │       ├── far.vim
│       │   │   │       ├── felipec.vim
│       │   │   │       ├── feral.vim
│       │   │   │       ├── fine_blue.vim
│       │   │   │       ├── flatcolor.vim
│       │   │   │       ├── flatland.vim
│       │   │   │       ├── flatlandia.vim
│       │   │   │       ├── flattened_dark.vim
│       │   │   │       ├── flattened_light.vim
│       │   │   │       ├── flattown.vim
│       │   │   │       ├── flattr.vim
│       │   │   │       ├── flatui.vim
│       │   │   │       ├── fnaqevan.vim
│       │   │   │       ├── fog.vim
│       │   │   │       ├── fokus.vim
│       │   │   │       ├── forneus.vim
│       │   │   │       ├── freya.vim
│       │   │   │       ├── frood.vim
│       │   │   │       ├── frozen.vim
│       │   │   │       ├── fruidle.vim
│       │   │   │       ├── fruit.vim
│       │   │   │       ├── fruity.vim
│       │   │   │       ├── fu.vim
│       │   │   │       ├── fx.vim
│       │   │   │       ├── gardener.vim
│       │   │   │       ├── gemcolors.vim
│       │   │   │       ├── genericdc-light.vim
│       │   │   │       ├── genericdc.vim
│       │   │   │       ├── gentooish.vim
│       │   │   │       ├── getafe.vim
│       │   │   │       ├── getfresh.vim
│       │   │   │       ├── github.vim
│       │   │   │       ├── gobo.vim
│       │   │   │       ├── golded.vim
│       │   │   │       ├── golden.vim
│       │   │   │       ├── google.vim
│       │   │   │       ├── gor.vim
│       │   │   │       ├── gotham.vim
│       │   │   │       ├── gotham256.vim
│       │   │   │       ├── gothic.vim
│       │   │   │       ├── grape.vim
│       │   │   │       ├── gravity.vim
│       │   │   │       ├── graywh.vim
│       │   │   │       ├── grb256.vim
│       │   │   │       ├── greens.vim
│       │   │   │       ├── greenvision.vim
│       │   │   │       ├── grey2.vim
│       │   │   │       ├── greyblue.vim
│       │   │   │       ├── grishin.vim
│       │   │   │       ├── gruvbox.vim
│       │   │   │       ├── gryffin.vim
│       │   │   │       ├── guardian.vim
│       │   │   │       ├── guepardo.vim
│       │   │   │       ├── h80.vim
│       │   │   │       ├── habiLight.vim
│       │   │   │       ├── harlequin.vim
│       │   │   │       ├── heliotrope.vim
│       │   │   │       ├── hemisu.vim
│       │   │   │       ├── herald.vim
│       │   │   │       ├── heroku-terminal.vim
│       │   │   │       ├── heroku.vim
│       │   │   │       ├── herokudoc-gvim.vim
│       │   │   │       ├── herokudoc.vim
│       │   │   │       ├── hilal.vim
│       │   │   │       ├── holokai.vim
│       │   │   │       ├── hornet.vim
│       │   │   │       ├── hotpot.vim
│       │   │   │       ├── hybrid-light.vim
│       │   │   │       ├── hybrid.vim
│       │   │   │       ├── hybrid_material.vim
│       │   │   │       ├── hybrid_reverse.vim
│       │   │   │       ├── iangenzo.vim
│       │   │   │       ├── ibmedit.vim
│       │   │   │       ├── icansee.vim
│       │   │   │       ├── iceberg.vim
│       │   │   │       ├── impact.vim
│       │   │   │       ├── impactG.vim
│       │   │   │       ├── impactjs.vim
│       │   │   │       ├── industrial.vim
│       │   │   │       ├── industry.vim
│       │   │   │       ├── ingretu.vim
│       │   │   │       ├── inkpot.vim
│       │   │   │       ├── inori.vim
│       │   │   │       ├── ir_black.vim
│       │   │   │       ├── ironman.vim
│       │   │   │       ├── itg_flat.vim
│       │   │   │       ├── jaime.vim
│       │   │   │       ├── jammy.vim
│       │   │   │       ├── janah.vim
│       │   │   │       ├── jelleybeans.vim
│       │   │   │       ├── jellybeans.vim
│       │   │   │       ├── jellyx.vim
│       │   │   │       ├── jhdark.vim
│       │   │   │       ├── jhlight.vim
│       │   │   │       ├── jiks.vim
│       │   │   │       ├── kalahari.vim
│       │   │   │       ├── kalisi.vim
│       │   │   │       ├── kalt.vim
│       │   │   │       ├── kaltex.vim
│       │   │   │       ├── kate.vim
│       │   │   │       ├── kellys.vim
│       │   │   │       ├── khaki.vim
│       │   │   │       ├── kib_darktango.vim
│       │   │   │       ├── kib_plastic.vim
│       │   │   │       ├── kiss.vim
│       │   │   │       ├── kkruby.vim
│       │   │   │       ├── kolor.vim
│       │   │   │       ├── kruby.vim
│       │   │   │       ├── kyle.vim
│       │   │   │       ├── laederon.vim
│       │   │   │       ├── landscape.vim
│       │   │   │       ├── lapis256.vim
│       │   │   │       ├── last256.vim
│       │   │   │       ├── late_evening.vim
│       │   │   │       ├── lazarus.vim
│       │   │   │       ├── legiblelight.vim
│       │   │   │       ├── leglight2.vim
│       │   │   │       ├── leo.vim
│       │   │   │       ├── less.vim
│       │   │   │       ├── lettuce.vim
│       │   │   │       ├── leya.vim
│       │   │   │       ├── lightcolors.vim
│       │   │   │       ├── lightning.vim
│       │   │   │       ├── lilac.vim
│       │   │   │       ├── lilydjwg_dark.vim
│       │   │   │       ├── lilydjwg_green.vim
│       │   │   │       ├── lilypink.vim
│       │   │   │       ├── lingodirector.vim
│       │   │   │       ├── liquidcarbon.vim
│       │   │   │       ├── literal_tango.vim
│       │   │   │       ├── lizard.vim
│       │   │   │       ├── lizard256.vim
│       │   │   │       ├── lodestone.vim
│       │   │   │       ├── loogica.vim
│       │   │   │       ├── louver.vim
│       │   │   │       ├── lucid.vim
│       │   │   │       ├── lucius.vim
│       │   │   │       ├── luinnar.vim
│       │   │   │       ├── lumberjack.vim
│       │   │   │       ├── luna-term.vim
│       │   │   │       ├── luna.vim
│       │   │   │       ├── lxvc.vim
│       │   │   │       ├── mac_classic.vim
│       │   │   │       ├── made_of_code.vim
│       │   │   │       ├── madeofcode.vim
│       │   │   │       ├── magicwb.vim
│       │   │   │       ├── mango.vim
│       │   │   │       ├── manuscript.vim
│       │   │   │       ├── manxome.vim
│       │   │   │       ├── marklar.vim
│       │   │   │       ├── maroloccio.vim
│       │   │   │       ├── mars.vim
│       │   │   │       ├── martin_krischik.vim
│       │   │   │       ├── material-theme.vim
│       │   │   │       ├── material.vim
│       │   │   │       ├── materialbox.vim
│       │   │   │       ├── materialtheme.vim
│       │   │   │       ├── matrix.vim
│       │   │   │       ├── maui.vim
│       │   │   │       ├── mayansmoke.vim
│       │   │   │       ├── mdark.vim
│       │   │   │       ├── mellow.vim
│       │   │   │       ├── meta5.vim
│       │   │   │       ├── metacosm.vim
│       │   │   │       ├── midnight.vim
│       │   │   │       ├── midnight2.vim
│       │   │   │       ├── miko.vim
│       │   │   │       ├── mint.vim
│       │   │   │       ├── mizore.vim
│       │   │   │       ├── mod8.vim
│       │   │   │       ├── mod_tcsoft.vim
│       │   │   │       ├── mojave.vim
│       │   │   │       ├── molokai.vim
│       │   │   │       ├── molokai_dark.vim
│       │   │   │       ├── monoacc.vim
│       │   │   │       ├── monochrome.vim
│       │   │   │       ├── monokai-chris.vim
│       │   │   │       ├── monokain.vim
│       │   │   │       ├── montz.vim
│       │   │   │       ├── moonshine.vim
│       │   │   │       ├── moonshine_lowcontrast.vim
│       │   │   │       ├── mophiaDark.vim
│       │   │   │       ├── mophiaSmoke.vim
│       │   │   │       ├── mopkai.vim
│       │   │   │       ├── moria.vim
│       │   │   │       ├── moss.vim
│       │   │   │       ├── motus.vim
│       │   │   │       ├── mrkn256.vim
│       │   │   │       ├── mrpink.vim
│       │   │   │       ├── mud.vim
│       │   │   │       ├── muon.vim
│       │   │   │       ├── mushroom.vim
│       │   │   │       ├── mustang.vim
│       │   │   │       ├── native.vim
│       │   │   │       ├── nature.vim
│       │   │   │       ├── navajo-night.vim
│       │   │   │       ├── navajo.vim
│       │   │   │       ├── nazca.vim
│       │   │   │       ├── nedit.vim
│       │   │   │       ├── nedit2.vim
│       │   │   │       ├── nefertiti.vim
│       │   │   │       ├── neon.vim
│       │   │   │       ├── neonwave.vim
│       │   │   │       ├── nerv-ous.vim
│       │   │   │       ├── neutron.vim
│       │   │   │       ├── neverland-darker.vim
│       │   │   │       ├── neverland.vim
│       │   │   │       ├── neverland2-darker.vim
│       │   │   │       ├── neverland2.vim
│       │   │   │       ├── neverness.vim
│       │   │   │       ├── nevfn.vim
│       │   │   │       ├── newspaper.vim
│       │   │   │       ├── newsprint.vim
│       │   │   │       ├── nicotine.vim
│       │   │   │       ├── night.vim
│       │   │   │       ├── nightVision.vim
│       │   │   │       ├── night_vision.vim
│       │   │   │       ├── nightflight.vim
│       │   │   │       ├── nightflight2.vim
│       │   │   │       ├── nightshimmer.vim
│       │   │   │       ├── nightsky.vim
│       │   │   │       ├── nightwish.vim
│       │   │   │       ├── no_quarter.vim
│       │   │   │       ├── northland.vim
│       │   │   │       ├── northsky.vim
│       │   │   │       ├── norwaytoday.vim
│       │   │   │       ├── nour.vim
│       │   │   │       ├── nuvola.vim
│       │   │   │       ├── obsidian.vim
│       │   │   │       ├── obsidian2.vim
│       │   │   │       ├── oceanblack.vim
│       │   │   │       ├── oceanblack256.vim
│       │   │   │       ├── oceandeep.vim
│       │   │   │       ├── oceanlight.vim
│       │   │   │       ├── olive.vim
│       │   │   │       ├── onedark.vim
│       │   │   │       ├── orange.vim
│       │   │   │       ├── osx_like.vim
│       │   │   │       ├── otaku.vim
│       │   │   │       ├── oxeded.vim
│       │   │   │       ├── pacific.vim
│       │   │   │       ├── paintbox.vim
│       │   │   │       ├── parsec.vim
│       │   │   │       ├── peaksea.vim
│       │   │   │       ├── pencil.vim
│       │   │   │       ├── penultimate.vim
│       │   │   │       ├── peppers.vim
│       │   │   │       ├── perfect.vim
│       │   │   │       ├── pf_earth.vim
│       │   │   │       ├── phd.vim
│       │   │   │       ├── phoenix.vim
│       │   │   │       ├── phphaxor.vim
│       │   │   │       ├── phpx.vim
│       │   │   │       ├── pic.vim
│       │   │   │       ├── pink.vim
│       │   │   │       ├── playroom.vim
│       │   │   │       ├── pleasant.vim
│       │   │   │       ├── potts.vim
│       │   │   │       ├── predawn.vim
│       │   │   │       ├── preto.vim
│       │   │   │       ├── pride.vim
│       │   │   │       ├── primary.vim
│       │   │   │       ├── print_bw.vim
│       │   │   │       ├── prmths.vim
│       │   │   │       ├── professional.vim
│       │   │   │       ├── proton.vim
│       │   │   │       ├── pspad.vim
│       │   │   │       ├── psql.vim
│       │   │   │       ├── pt_black.vim
│       │   │   │       ├── putty.vim
│       │   │   │       ├── pw.vim
│       │   │   │       ├── pyte.vim
│       │   │   │       ├── python.vim
│       │   │   │       ├── quagmire.vim
│       │   │   │       ├── radicalgoodspeed.vim
│       │   │   │       ├── railscasts.vim
│       │   │   │       ├── rainbow_fine_blue.vim
│       │   │   │       ├── rainbow_fruit.vim
│       │   │   │       ├── rainbow_neon.vim
│       │   │   │       ├── rakr-light.vim
│       │   │   │       ├── random.vim
│       │   │   │       ├── rastafari.vim
│       │   │   │       ├── rcg_gui.vim
│       │   │   │       ├── rcg_term.vim
│       │   │   │       ├── rdark-terminal.vim
│       │   │   │       ├── rdark.vim
│       │   │   │       ├── redblack.vim
│       │   │   │       ├── redstring.vim
│       │   │   │       ├── refactor.vim
│       │   │   │       ├── relaxedgreen.vim
│       │   │   │       ├── reliable.vim
│       │   │   │       ├── reloaded.vim
│       │   │   │       ├── revolutions.vim
│       │   │   │       ├── robinhood.vim
│       │   │   │       ├── rootwater.vim
│       │   │   │       ├── rtl.vim
│       │   │   │       ├── sand.vim
│       │   │   │       ├── sandydune.vim
│       │   │   │       ├── satori.vim
│       │   │   │       ├── saturn.vim
│       │   │   │       ├── scala.vim
│       │   │   │       ├── scheakur.vim
│       │   │   │       ├── scite.vim
│       │   │   │       ├── scooby.vim
│       │   │   │       ├── sea.vim
│       │   │   │       ├── sean.vim
│       │   │   │       ├── seashell.vim
│       │   │   │       ├── selenitic.vim
│       │   │   │       ├── seoul.vim
│       │   │   │       ├── seoul256-light.vim
│       │   │   │       ├── seoul256.vim
│       │   │   │       ├── seti.vim
│       │   │   │       ├── settlemyer.vim
│       │   │   │       ├── sexy-railscasts.vim
│       │   │   │       ├── sf.vim
│       │   │   │       ├── shades-of-teal.vim
│       │   │   │       ├── shadesofamber.vim
│       │   │   │       ├── shobogenzo.vim
│       │   │   │       ├── sienna.vim
│       │   │   │       ├── sierra.vim
│       │   │   │       ├── sift.vim
│       │   │   │       ├── silent.vim
│       │   │   │       ├── simple256.vim
│       │   │   │       ├── simple_b.vim
│       │   │   │       ├── simpleandfriendly.vim
│       │   │   │       ├── simplewhite.vim
│       │   │   │       ├── simplon.vim
│       │   │   │       ├── skittles_berry.vim
│       │   │   │       ├── skittles_dark.vim
│       │   │   │       ├── sky.vim
│       │   │   │       ├── smp.vim
│       │   │   │       ├── smpl.vim
│       │   │   │       ├── smyck.vim
│       │   │   │       ├── soda.vim
│       │   │   │       ├── softblue.vim
│       │   │   │       ├── softbluev2.vim
│       │   │   │       ├── softlight.vim
│       │   │   │       ├── sol-term.vim
│       │   │   │       ├── sol.vim
│       │   │   │       ├── solarized.vim
│       │   │   │       ├── sole.vim
│       │   │   │       ├── sonofobsidian.vim
│       │   │   │       ├── sonoma.vim
│       │   │   │       ├── sorcerer.vim
│       │   │   │       ├── soso.vim
│       │   │   │       ├── sourcerer.vim
│       │   │   │       ├── southernlights.vim
│       │   │   │       ├── southwest-fog.vim
│       │   │   │       ├── spacegray.vim
│       │   │   │       ├── spectro.vim
│       │   │   │       ├── spiderhawk.vim
│       │   │   │       ├── spring.vim
│       │   │   │       ├── sprinkles.vim
│       │   │   │       ├── stackoverflow.vim
│       │   │   │       ├── stingray.vim
│       │   │   │       ├── stonewashed-256.vim
│       │   │   │       ├── stonewashed-gui.vim
│       │   │   │       ├── strange.vim
│       │   │   │       ├── strawimodo.vim
│       │   │   │       ├── summerfruit.vim
│       │   │   │       ├── summerfruit256.vim
│       │   │   │       ├── sunburst.vim
│       │   │   │       ├── surveyor.vim
│       │   │   │       ├── swamplight.vim
│       │   │   │       ├── sweater.vim
│       │   │   │       ├── symfony.vim
│       │   │   │       ├── synic.vim
│       │   │   │       ├── tabula.vim
│       │   │   │       ├── tango-desert.vim
│       │   │   │       ├── tango-morning.vim
│       │   │   │       ├── tango.vim
│       │   │   │       ├── tango2.vim
│       │   │   │       ├── tangoX.vim
│       │   │   │       ├── tangoshady.vim
│       │   │   │       ├── taqua.vim
│       │   │   │       ├── tayra.vim
│       │   │   │       ├── tchaba.vim
│       │   │   │       ├── tchaba2.vim
│       │   │   │       ├── tcsoft.vim
│       │   │   │       ├── telstar.vim
│       │   │   │       ├── termschool.vim
│       │   │   │       ├── tesla.vim
│       │   │   │       ├── tetragrammaton.vim
│       │   │   │       ├── textmate16.vim
│       │   │   │       ├── thegoodluck.vim
│       │   │   │       ├── thestars.vim
│       │   │   │       ├── thor.vim
│       │   │   │       ├── thornbird.vim
│       │   │   │       ├── tibet.vim
│       │   │   │       ├── tidy.vim
│       │   │   │       ├── tir_black.vim
│       │   │   │       ├── tolerable.vim
│       │   │   │       ├── tomatosoup.vim
│       │   │   │       ├── tony_light.vim
│       │   │   │       ├── toothpik.vim
│       │   │   │       ├── torte.vim
│       │   │   │       ├── transparent.vim
│       │   │   │       ├── triplejelly.vim
│       │   │   │       ├── trivial256.vim
│       │   │   │       ├── trogdor.vim
│       │   │   │       ├── tropikos.vim
│       │   │   │       ├── turbo.vim
│       │   │   │       ├── tutticolori.vim
│       │   │   │       ├── twilight.vim
│       │   │   │       ├── twilight256.vim
│       │   │   │       ├── twitchy.vim
│       │   │   │       ├── two2tango.vim
│       │   │   │       ├── ubaryd.vim
│       │   │   │       ├── ubloh.vim
│       │   │   │       ├── umber-green.vim
│       │   │   │       ├── understated.vim
│       │   │   │       ├── underwater-mod.vim
│       │   │   │       ├── underwater.vim
│       │   │   │       ├── up.vim
│       │   │   │       ├── valloric.vim
│       │   │   │       ├── vanzan_color.vim
│       │   │   │       ├── vc.vim
│       │   │   │       ├── vcbc.vim
│       │   │   │       ├── vexorian.vim
│       │   │   │       ├── vibrantink.vim
│       │   │   │       ├── vilight.vim
│       │   │   │       ├── vimbrant.vim
│       │   │   │       ├── visualstudio.vim
│       │   │   │       ├── vividchalk.vim
│       │   │   │       ├── vj.vim
│       │   │   │       ├── void.vim
│       │   │   │       ├── vydark.vim
│       │   │   │       ├── vylight.vim
│       │   │   │       ├── wargrey.vim
│       │   │   │       ├── warm_grey.vim
│       │   │   │       ├── wasabi256.vim
│       │   │   │       ├── watermark.vim
│       │   │   │       ├── wellsokai.vim
│       │   │   │       ├── whitebox.vim
│       │   │   │       ├── whitedust.vim
│       │   │   │       ├── widower.vim
│       │   │   │       ├── win9xblueback.vim
│       │   │   │       ├── winter.vim
│       │   │   │       ├── wintersday.vim
│       │   │   │       ├── woju.vim
│       │   │   │       ├── wolfpack.vim
│       │   │   │       ├── wombat.vim
│       │   │   │       ├── wombat256.vim
│       │   │   │       ├── wombat256i.vim
│       │   │   │       ├── wombat256mod.vim
│       │   │   │       ├── wood.vim
│       │   │   │       ├── wuye.vim
│       │   │   │       ├── xemacs.vim
│       │   │   │       ├── xian.vim
│       │   │   │       ├── xmaslights.vim
│       │   │   │       ├── xoria256.vim
│       │   │   │       ├── xterm16.vim
│       │   │   │       ├── yaml.vim
│       │   │   │       ├── yeller.vim
│       │   │   │       ├── zazen.vim
│       │   │   │       ├── zen.vim
│       │   │   │       ├── zenburn.vim
│       │   │   │       ├── zenesque.vim
│       │   │   │       ├── zephyr.vim
│       │   │   │       ├── zmrok.vim
│       │   │   │       └── znake.vim
│       │   │   ├── vim-commentary
│       │   │   │   ├── CONTRIBUTING.markdown
│       │   │   │   ├── README.markdown
│       │   │   │   ├── doc
│       │   │   │   │   ├── commentary.txt
│       │   │   │   │   └── tags
│       │   │   │   └── plugin
│       │   │   │       └── commentary.vim
│       │   │   ├── vim-elixir
│       │   │   │   ├── Gemfile
│       │   │   │   ├── Gemfile.lock
│       │   │   │   ├── LICENSE
│       │   │   │   ├── README.md
│       │   │   │   ├── autoload
│       │   │   │   │   └── elixir
│       │   │   │   │       ├── indent.vim
│       │   │   │   │       └── util.vim
│       │   │   │   ├── bin
│       │   │   │   │   ├── rspec
│       │   │   │   │   └── spawn_vim
│       │   │   │   ├── compiler
│       │   │   │   │   └── exunit.vim
│       │   │   │   ├── ftdetect
│       │   │   │   │   └── elixir.vim
│       │   │   │   ├── ftplugin
│       │   │   │   │   ├── eelixir.vim
│       │   │   │   │   └── elixir.vim
│       │   │   │   ├── indent
│       │   │   │   │   ├── eelixir.vim
│       │   │   │   │   └── elixir.vim
│       │   │   │   ├── spec
│       │   │   │   │   ├── indent
│       │   │   │   │   │   ├── anonymous_functions_spec.rb
│       │   │   │   │   │   ├── blocks_spec.rb
│       │   │   │   │   │   ├── case_spec.rb
│       │   │   │   │   │   ├── cond_spec.rb
│       │   │   │   │   │   ├── documentation_spec.rb
│       │   │   │   │   │   ├── embedded_elixir_spec.rb
│       │   │   │   │   │   ├── if_spec.rb
│       │   │   │   │   │   ├── lists_spec.rb
│       │   │   │   │   │   ├── pipeline_spec.rb
│       │   │   │   │   │   └── tuples_spec.rb
│       │   │   │   │   ├── spec_helper.rb
│       │   │   │   │   └── syntax
│       │   │   │   │       ├── alias_spec.rb
│       │   │   │   │       ├── atom_spec.rb
│       │   │   │   │       ├── comments_spec.rb
│       │   │   │   │       ├── default_argument_spec.rb
│       │   │   │   │       ├── demodule_spec.rb
│       │   │   │   │       ├── doc_spec.rb
│       │   │   │   │       ├── embedded_elixir_spec.rb
│       │   │   │   │       ├── exunit_spec.rb
│       │   │   │   │       ├── guard_spec.rb
│       │   │   │   │       ├── kernel_function_spec.rb
│       │   │   │   │       ├── keyword_spec.rb
│       │   │   │   │       ├── list_spec.rb
│       │   │   │   │       ├── module_function_spec.rb
│       │   │   │   │       ├── records_spec.rb
│       │   │   │   │       ├── sigil_spec.rb
│       │   │   │   │       ├── strings_spec.rb
│       │   │   │   │       ├── struct_spec.rb
│       │   │   │   │       └── variable_spec.rb
│       │   │   │   └── syntax
│       │   │   │       ├── eelixir.vim
│       │   │   │       └── elixir.vim
│       │   │   ├── vim-monokai
│       │   │   │   ├── LICENSE.txt
│       │   │   │   ├── README.md
│       │   │   │   └── colors
│       │   │   │       └── monokai.vim
│       │   │   ├── vim-rails
│       │   │   │   ├── CONTRIBUTING.markdown
│       │   │   │   ├── README.markdown
│       │   │   │   ├── autoload
│       │   │   │   │   └── rails.vim
│       │   │   │   ├── compiler
│       │   │   │   │   └── rails.vim
│       │   │   │   ├── doc
│       │   │   │   │   ├── rails.txt
│       │   │   │   │   └── tags
│       │   │   │   └── plugin
│       │   │   │       └── rails.vim
│       │   │   └── vim-rspec
│       │   │       ├── CHANGELOG.md
│       │   │       ├── LICENSE
│       │   │       ├── README.md
│       │   │       ├── Rakefile
│       │   │       ├── VimFlavor
│       │   │       ├── VimFlavor.lock
│       │   │       ├── bin
│       │   │       │   ├── os_x_iterm
│       │   │       │   ├── os_x_iterm2
│       │   │       │   └── os_x_terminal
│       │   │       ├── plugin
│       │   │       │   └── rspec.vim
│       │   │       └── t
│       │   │           └── rspec_test.vim
│       │   ├── colors
│       │   ├── pack
│       │   │   ├── bundle
│       │   │   │   ├── opt
│       │   │   │   │   └── vim-scriptease
│       │   │   │   │       ├── README.markdown
│       │   │   │   │       ├── autoload
│       │   │   │   │       │   └── scriptease.vim
│       │   │   │   │       ├── doc
│       │   │   │   │       │   └── scriptease.txt
│       │   │   │   │       └── plugin
│       │   │   │   │           └── scriptease.vim
│       │   │   │   └── start
│       │   │   └── minpac
│       │   │       ├── opt
│       │   │       │   ├── minpac
│       │   │       │   │   ├── README.md
│       │   │       │   │   ├── appveyor.yml
│       │   │       │   │   ├── autoload
│       │   │       │   │   │   └── minpac
│       │   │       │   │   │       ├── LICENSE.async-vim.txt
│       │   │       │   │   │       ├── impl.vim
│       │   │       │   │   │       └── job.vim
│       │   │       │   │   ├── doc
│       │   │       │   │   │   ├── minpac.txt
│       │   │       │   │   │   └── tags
│       │   │       │   │   ├── plugin
│       │   │       │   │   │   └── minpac.vim
│       │   │       │   │   ├── test
│       │   │       │   │   │   ├── Make_all.mak
│       │   │       │   │   │   ├── Make_win.mak
│       │   │       │   │   │   ├── Makefile
│       │   │       │   │   │   ├── README
│       │   │       │   │   │   ├── runtest.vim
│       │   │       │   │   │   ├── setup.vim
│       │   │       │   │   │   ├── small.vim
│       │   │       │   │   │   └── test_minpac.vim
│       │   │       │   │   └── tools
│       │   │       │   │       ├── appveyor-dl.bat
│       │   │       │   │       ├── dl-kaoriya-vim.py
│       │   │       │   │       └── pull-async-vim.sh
│       │   │       │   └── vim-scriptease
│       │   │       │       ├── README.markdown
│       │   │       │       ├── autoload
│       │   │       │       │   └── scriptease.vim
│       │   │       │       ├── doc
│       │   │       │       │   ├── scriptease.txt
│       │   │       │       │   └── tags
│       │   │       │       └── plugin
│       │   │       │           └── scriptease.vim
│       │   │       └── start
│       │   │           ├── vim-surround
│       │   │           │   ├── README.markdown
│       │   │           │   ├── doc
│       │   │           │   │   ├── surround.txt
│       │   │           │   │   └── tags
│       │   │           │   └── plugin
│       │   │           │       └── surround.vim
│       │   │           └── vim-unimpaired
│       │   │               ├── README.markdown
│       │   │               ├── doc
│       │   │               │   ├── tags
│       │   │               │   └── unimpaired.txt
│       │   │               └── plugin
│       │   │                   └── unimpaired.vim
│       │   ├── plugin
│       │   │   └── sensible.vim
│       │   └── vim -> /opt/Code/dotfiles/editors/vim/vim
│       ├── vimrc
│       └── vimrc.pre-feb-26-2018
├── git
│   ├── gitattributes
│   ├── gitconfig
│   └── gitexcludes
├── jobs
│   ├── Linux
│   ├── bin
│   │   └── rm_ds_store_files.sh
│   ├── macOS
│   │   └── com.chrisrjones.rm_ds_store_files.plist
│   └── scripts
├── lang
│   └── elixir
│       └── iex.exs
├── mutt
│   └── muttrc
├── re
│   ├── lldb
│   │   └── lldbinit
│   └── radare
│       └── radare2rc
├── shells
│   ├── bash
│   │   ├── bash_profile
│   │   └── bashrc
│   ├── fish -> /opt/Code/dotfiles/config/fish
│   └── zsh
│       ├── zlogin
│       └── zshrc
└── terms
    ├── hyper
    │   └── hyper.js
    ├── iterm2
    │   └── com.googlecode.iterm2.plist
    └── tmux
        └── tmux.conf

185 directories, 1535 files

</pre>
</details>

<a href="useful-links"></a>

## Useful Links _in no particular order_
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
  - [x] ~~don't create session files when launching a man page~~
  - [x] ~~Figure out a sane solution for previewing markdown ie. .md documents~~
  - [x] ~~Figure out what is causing lines to be hard wrapped! 😖~~
### Fish
  - [x] ~~Figure out why `grc` is borking PATH on Linux 😑~~

GithHub: [@ipatch](https://github.com/ipatch)<br />
Twitter: [@truckmonth](https://twitter.com/truckmonth)

<!-- foobar -->
