"""""""""""""""""""""""""""""
"  ~ My init.vim ~ for neovim
"""""""""""""""""""""""""""""
"  Author: Chris Jones [http://chrisrjones.com]
"  Source: https://github.com/ipatch/dotfiles/blob/master/config/nvim/init.vim
""

"""""""""""""""""""""""""""""
" Load vim configuration, runtimepath, packpath, and .vimrc
""
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

set guifont=Cousine\ for\ Powerline:h13
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color

call plug#begin('~/.config/nvim/plugged')

" Plugins go here.  Example:
" Plug 'foo/bar'

Plug 'tpope/vim-projectionist' " required for some navigation features.
Plug 'slashmili/alchemist.vim'
Plug 'powerman/vim-plugin-AnsiEsc' " makes the documentation look pretty :)

call plug#end()

" the below key mapping will indent the entire file
map <Leader>i mmgg=G`m<CR>

" Hard-wrap long lines as I type them
set textwidth=0

set hlsearch          " Highlight search results
set incsearch         " Incremental search, search as you type
set ignorecase        " Ignore case when searching
" the below setting will turn off `ignorecase` if a capital letter is present
" in the search, ie. `S`
set smartcase
" Stop highlighting on Enter
map <CR> :nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline settings / keybindings https://github.com/vim-airline/vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
" NOTE: https://github.com/vim-airline/vim-airline/issues/142#issuecomment-145317103
let g:airline_powerline_fonts=1 " this setting presents pretty glyphs using powerline fonts.
" set the color scheme for vim-airline
let g:airline_theme = 'base16' " keep the base16 colorscheme consistent.

"""""""""""""""""""""""""""""
" vim-fugitive settings - https://github.com/tpope/vim-fugitive
""

set statusline=%{fugitive#statusline()}


"""""""""""""""""""""""""""""
" indentLine - settings / configuration
""
let g:indentLine_setColors = 1 

let base16colorspace=256 " Access colors present in 256 colorspace
colorscheme base16-default-dark

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" NOTE: the above line is ignored in Neovim 0.1.5 above, use this line
" instead.
if has('nvim-0.1.5')
  set termguicolors
endif


" Easy commenting of lines using tpope's plugin.
" CREDIT: 💳 https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
noremap <leader>c :Commentary<cr>

" Use system clipboard
if has('macunix')
  set clipboard=unnamed
endif

" Try and get sane copy / paste within nvim using iTerm2
" CREDIT: 💳 https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y
" TODO: figure out how to map <command>+<v> as paste
nnoremap <M-v> "+p
inoremap <M-v> <esc>"+p 

" NOTE: apparently `:map` and `:map!` will map to all modes of (n)vim
" CREDIT: 💳 https://stackoverflow.com/a/21282417/708807
" NOTE: if using iTerm2 on macOS make sure the proper escape sequence is
" mapped within the iTerm2 settings.
nnoremap <M-z> u
inoremap <M-z> <C-o>u

" TODO: figure out a way to toggle the Netrw browser with <command>+<\>
" CREDIT: https://shapeshed.com/vim-netrw/   

let g:netrw_liststyle = 3
" Do not display the banner when using Netrw
let g:netrw_banner = 0
" Display the netrw file browser in a vertical split
let g:netrw_browse_split = 1
" Set the default width when opening the netrw explorer
let g:netrw_winsize = 25
" TODO: document what the below variable does to netrw
let g:netrw_altv = 1
" Set atom style macOS key binding to open the project drawer
" CREDIT: https://stackoverflow.com/a/23069285/708807
nnoremap <M-\> :Lexplore<cr>
inoremap <M-\> :Lexplore<cr>

" The below setting is useful for changing to the current directory
" in which the file is located when toggling netrw
set autochdir

" To setup OS specific settings for neovim
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

"""""""""""""""""""""""""""""
" Cool hacky stuff
""

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"""""""""""""""""""""""""""""
" Useful hacks for working with `$HOME/.config/nvim/init.vim or $MYVIMRC
""
map <leader>vm :tabe $MYVIMRC<CR>
map <leader>sv :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""
" set (n)vim as pager
""
let $PAGER=''
" ==================================
" set nvim to manpager in env var
" ==================================
let $MANPAGER=''

" Appearance - settings related to developer happiness ❤️   when using nvim
set showbreak=… " show ellipsis at breaking
set autoindent " automatically set indent of new line
set ttyfast " faster redrawing
set shell=/bin/sh
set showmatch " show matching braces

" make comments and HTML attributes italic
" TODO; figure out why comments aren't showing up in italics
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlAttrib cterm=italic
highlight Type cterm=italic
highlight Normal ctermbg=none

" don't conceal markdown links
function! ToggleConcealLevel()
    if &conceallevel == 0
        setlocal conceallevel=2
    elseif &conceallevel == 1
        setlocal conceallevel=0
    elseif &conceallevel == 2
        setlocal conceallevel=0
    endif
endfunction

nnoremap <silent> ` :call ToggleConcealLevel()<CR>
