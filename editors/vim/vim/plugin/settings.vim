"""""""""""""""""""""""""""""
" ~ settings.vim ~
""

"""""""""""""""""""""""""""""
" mappings
""

""""""""""""""""""""""""""""
" create directories for Vim related files
""
silent execute '!mkdir -p $HOME/.local/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.vim/tmp/undo'


""""""""""""""""""""""""""""""
"
""
set listchars=tab:▸\ ,eol:¬
nmap <leader>l :set list!<CR>

scriptencoding utf-8

if exists('$SUDO_USER')
  set noswapfile          " don't create root owned files
else
  set directory=~/.local/.vim/tmp/swap// 
  set directory+=~/.vim/tmp/swap//      " keep backup files out of the way
  set directory+=.
endif

if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif
  set foldmethod=indent                 " not as cool as syntax, but faster
  set foldlevelstart=99                 " start unfolded
endif

set formatoptions+=n                    " smart auto-indenting inside numbered lists

set scrolloff=3                         " start scrolling 3 lines before edge of viewport
set shiftround                          " always indent by multiple of shiftwidth
set shiftwidth=2                        " spaces per tab (when shifting)
set shortmess+=I                        " no splash screen

if has('linebreak')
  let &showbreak='⤷ '                 " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
endif

set smarttab                          " <tab>/<BS> indent/dedent in leading whitespace

if has('syntax')
  set spellcapcheck=                  " don't check for capital letters at start of sentence
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

" set tabstop=2                         " spaces per tab

if has('termguicolors')
  set termguicolors                   " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif

" set textwidth=80                      " automatically hard wrap at 80 columns - NO THANKYOU!


if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    " TODO: figure out how to create dirs if they don't exist.
    set undodir=~/.local/.vim/tmp/undo
    set undodir+=~/.vim/tmp/undo      " keep undo files out of the way
    set undodir+=.
    set undofile                      " actually use undo files
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                      " don't create root-owned files
  else
    if isdirectory('~/.local/.vim/tmp')
      set viminfo+=n~/.local/.vim/tmp/viminfo
    else
      set viminfo+=n~/.vim/tmp/viminfo " override ~/.viminfo default
    endif

    if !empty(glob('~/.vim/tmp/viminfo'))
      if !filereadable(expand('~/.vim/tmp/viminfo'))
        echoerr 'warning: ~/.vim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

" if has('mksession')
"   if isdirectory('~/.local/.vim/tmp')
"     set viewdir=~/.local/.vim/tmp/view
"   else
"     set viewdir=~/.vim/tmp/view       " override ~/.vim/view default
"   endif
"   set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
" endif

if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

