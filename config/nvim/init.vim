" ====================================================
"  ~My init.vim~
"  ===================================================
"  Author: Chris Jones [http://chrisrjones.com]
"  Source: https://github.com/ipatch/dotfiles/blob/master/config/nvim/init.vim
"  ===========================================================================


call plug#begin('~/.config/nvim/plugged')

" Plugins go here.  Example:
" Plug 'foo/bar'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
call plug#end()

" Easy access to the start of the line, the below configuration will
" map the '^' key to the '0' key, and move the cursor to the first
" character of a line.
nmap 0 ^

" Want to set this before any others, the default 'leader' key is \
" set the 'leader' key to ','
let g:mapleader = ','

" Note - the below configuration line will map the 'space bar' to ':' so that
" way 'Shift+;' does not have to be pressed to begin a command in normal mode.
nmap <space> :

" Sane tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

" Line numbers
set number

" set character encoding
set encoding=utf-8

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case wehn searching
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" Highlight current line
set cursorline

" Set the title on the terminal tab
set title

set background=dark
syntax enable
colorscheme molokai
