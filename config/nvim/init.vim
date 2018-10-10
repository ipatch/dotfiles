scriptencoding utf-8
""""""""""""""""""""""""""""""
"  ~ My init.vim ~ for Neovim
""""""""""""""""""""""""""""""
" Author: Chris Jones [http://chrisrjones.com]
" Source: https://github.com/ipatch/dotfiles/blob/master/config/nvim/init.vim
""
" NOTE: see `$HOME/.vimrc` for more settings

""""""""""""""""""""""""""""""
" Load vim configuration, runtimepath, packpath, and .vimrc
""
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Hard-wrap long lines as I type them
set textwidth=0

""""""""""""""""""""""""""""""
" ~ OS ~ specific settings
""

" CREDIT: 💳 https://vi.stackexchange.com/a/2574/10550
if os ==? 'macos' || os ==? 'linux'

  " set the default python PATH, to supposedly boost 🏎  performance
  let g:python_host_prog = '/home/capin/.pyenv/versions/neovim2/bin/python'

  " To disable python 2 support, uncomment the below line
  " let g:loaded_python_provider = 1

  let g:python3_host_prog = '/home/capin/.pyenv/versions/neovim3/bin/python'

  " TODO: Try and get `command + c` to work on remote linux servers

  " let g:node_host_prog = '/home/.asdf/installs/nodejs/10.4.1/.npm/bin/neovim-node-host'
  let g:node_host_prog = system("echo -n \"$(echo $HOME)/.config/yarn/bin/neovim-node-host\"")
endif

""""""""""""""""""""""""""""""
" set (n)vim as pager
""
let $PAGER=''

""""""""""""""""""""""""""""""
" set nvim to manpager in env var
"" 
let $MANPAGER=''

set ttyfast " faster redrawing

""""""""""""""""""""""""""""""
" settings for displaying errors
""
let g:errorformat =
  \ '%f:%l:%c: %trror: %m,' .
  \ '%f:%l:%c: %tarning: %m,' .
  \ '%f:%l:%c: %tote: %m'

