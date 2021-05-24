Files contained in this directory are primarily settings related to Vim & Neovim Plugins that I load via minpac.  All files that end in `.vim` will be loaded after my `~/.vimrc` is loaded when starting Vim.  To disable a file contained within this directory from loading move / rename a `.vim` file to `.bak`.

**Ex**

```shell
mv ./plugin_vim_commentary.vim ./plugin_vim_commentary.vim.bak
```

Restart Vim or Neovim and settings added, modified, or changed within the file will no longer be loaded when Vim or Neovim is launched.

The above is useful for testing plugin related settings.

The plugin setting files contained within this repo follow the below convention

```shell
plugin_[VIM_PLUGIN_NAME].vim
```

<strong>Ex</strong>

```shell
plugin_indentLine.vim
```

The Vim Plugin [IndentLine](https://github.com/Yggdroot/indentLine) uses _camelCase_ naming convention for the plugin name where as [lightline](https://github.com/itchyny/lightline.vim) does not use _camelCase_ naming convention.

<strong>Ex</strong>

```shell
plugin_lightline.vim
```
