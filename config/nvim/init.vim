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

  " NOTE: TODO: coc health check will fail if python2 provider is not enabled

  " set the default python PATH, to supposedly boost 🏎  performance
  let g:python_host_prog = '/home/capin/.pyenv/versions/py2neovim/bin/python'

  " To disable python 2 support, uncomment the below line
  " let g:loaded_python_provider = 1

  " WARNING: !!!! python ≥ 3.8 will fail health check, seems to be macos related
  " ...boooo

  let g:python3_host_prog = expand('~/.pyenv/versions/py379neovim/bin/python')
"
" let g:python3_host_prog = '/usr/local/bin/python3'
 " let g:python3_host_prog = expand('~/.pyenv/versions/py380neovim/bin/python')
" let g:python3_host_prog = '/Users/capin/.pyenv/versions/3.8.6/bin/python3'
  " let g:python3_host_prog = expand('~/.pyenv/shims/python')

  let g:node_host_prog = system("echo -n \"$(echo $HOME)/.yarn/bin/neovim-node-host\"")

  " ruby
  let g:ruby_host_prog = system("echo -n \"$(echo $HOME)/.asdf/shims/neovim-ruby-host\"")

  " TODO: Try and get `command + c` to work on remote linux servers

  " perl, no thank you
  let g:loaded_perl_provider = 0
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

