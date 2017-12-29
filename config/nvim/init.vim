" ====================================================
"  ~My init.vim~
"  ===================================================
"  Author: Chris Jones [http://chrisrjones.com]
"  Source: https://github.com/ipatch/dotfiles/blob/master/config/nvim/init.vim
"  ===========================================================================

" set character encoding, ie. utf-8 is a 'dialect' of unicode.
set encoding=utf-8

call plug#begin('~/.config/nvim/plugged')

" Plugins go here.  Example:
" Plug 'foo/bar'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Polyglot loads language syntax highlighting support on demand!
Plug 'sheerun/vim-polyglot'
" the below two plugs are themes for styling such things as text.
Plug 'chriskempson/base16-vim'
" Plug 'tomasr/molokai'
" end - plugs for themes
Plug 'neomake/neomake'
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []
  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_mycredo_maker = {
        \ 'exe': 'mix',
        \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }	
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features.
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc' " makes the documentation look pretty :)
Plug 'tpope/vim-commentary'

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

" Note - the below insert mappings will bind 'jk' / 'kj' to the ESC
" key functionality, so the ESC key does not need to be pressed in insert 
" mode.
imap jk <esc>
imap kj <esc>

" the below key mapping will indent the entire file
map <Leader>i mmgg=G`m<CR>

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

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case wehn searching
set ignorecase
" the below setting will turn off `ignorecase` if a capital letter is present
" in the search, ie. `S`
set smartcase
" Stop highlighting on Enter
map <CR> :nohl<CR>

" Highlight current line
set cursorline

" Set the title on the terminal tab
set title

set background=dark

syntax enable
" ============================================================================
" Set the colorscheme for neovim 
" colorscheme molokai
" NOTE: the below line `base16colorspace` needs to be set before the
" colorscheme.
let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-default-dark

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" NOTE: the above line is ignored in Neovim 0.1.5 above, use this line
" instead.
if has('nvim-0.1.5')
  set termguicolors
endif

" move cursor with mouse
set mouse=a

" show incomplete commands in lower right corner
set showcmd

" show display menu when using `tab` completeion
set wildmenu

" keep context in buffer when repostioning 🖕
" NOTE: to test the below feature use the below key combination, <z>, <enter>
set scrolloff=7

" set autoindent for autoindenting new lines after pressing <CR> / <enter>
set ai
"set smart indent, pairs 🍷 well with autoindent
set si


" Easy commenting of lines using tpope's plugin.
" CREDIT: 💳 https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
noremap <leader>c :Commentary<cr>

" Use system clipboard
if has('macunix')
  set clipboard=unnamed
endif

" =============================================================================
" Useful things to know about key mappings.
" `vmap` sets / replaces the key mapping in visual mode
" `nnoremap` - don't remap the current keystroke for normal mode
" `inoremap` - don't remap the current key binding for insert mode
" =============================================================================

" Try and get sane copy / paste within nvim using iTerm2
" CREDIT: 💳 https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

" TODO: figure out how to set `undo` to `command + z` for both modes.
" NOTE: apparently `:map` and `:map!` will map to all modes of (n)vim
" CREDIT: 💳 https://stackoverflow.com/a/21282417/708807
" NOTE: if using iTerm2 on macOS make sure the proper escape sequence is
" mapped within the iTerm2 settings.
nnoremap <M-z> u
inoremap <M-z> <C-o>u

" TODO: figure out a way to toggle the Netrw browser with <command>+<\>

let g:netrw_liststyle = 3
" Do not display the banner when using Netrw
let g:netrw_banner = 0
" Display the netrw file browser in a vertical split
let g:netrw_browse_split = 1
" Set the default width when opening the netrw explorer
let g:netrw_winsize = 25

" Reload $HOME/.config/nvim/init.vim after the file is saved.
" if has ('autocmd') " Remain compatible with earlier versions
"  autocmd BufWritePost $HOME/.config/nvim/init.vim source $MYVIMRC
" endif " has autocmd

" How to setup OS specific settings for neovim
" CREDIT: 💳 https://vi.stackexchange.com/a/2574/10550
if has('unix')
  " set the default python PATH, to supposedly boost 🏎 the performance of
  " neovim
  let g:python_host_prog = '/home/capin/.asdf/shims/python'

  " diable python 2 support
  let g:loaded_python_provider = 1

  " report the python interperter path, by adding it to init.vim
  let g:python3_host_prog = '/home/capin/.asdf/shims/python'

  " NOTE: to check whether nvim has clipboard support run the below command
  " :echo has('clipboard')

  " Clipboard integration
  set clipboard+=unnamedplus

  " Try and get `command + c` to work on remote linux servers
  vnoremap <M-c> "+y
  
endif

" =============================================================================
" Cool hacky stuff
" =============================================================================

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END

" =============================================================================
" Useful hacks for working with `$HOME/.config/nvim/init.vim or $MYVIMRC
" =============================================================================
map <leader>vm :tabe $MYVIMRC<CR>
map <leader>sv :source $MYVIMRC<CR>

