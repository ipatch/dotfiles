"""""""""""""""""""""""""""""
" ~ settings.vim ~
""

""""""""""""""""""""""""""""""
" Optional settings
""
" set backupdir=~/.vim/tmp/                   " for the backup files
" set directory=~/.vim/tmp/                   " for the swap files

""""""""""""""""""""""""""""
" create directories for Vim related files
""
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/swap'


""""""""""""""""""""""""""""""
" toggle hidden chars & Settings for hidden chars
""
nmap <leader>l :set list!<CR>
set listchars=nbsp:⦸        " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅ " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)

set listchars+=extends:» " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:« " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•    " BULLET (U+2022, UTF-8: E2 80 A2)
set listchars+=eol:¬
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
if has('linebreak')
  let &showbreak='↳ ' " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

" Enable smart joining of commented lines.
" TODO: figure out sane way to use `shift+j` and `shift+k` to join lines
" SEE: `:h formatoptions` for more settings
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j    " remove comment leader when joining comments
endif


" NOTE: setup backup files for Vim & Neovim
if exists('$SUDO_USER')
  set nobackup            " don't create backup files for root
  set nowritebackup       " don't create backup files for root
else
  " backup files to `~/.vim` first if dir exists, if can't write then `~/.local`
  set directory=~/.vim/tmp/backup      " keep backup files out of the way
  set directory+=~/.local/.vim/tmp/backup 
  " as a last resort put backup files in the current directory.
  set directory+=.
endif

" NOTE: setup swap files for Vim & Neovim
if exists('$SUDO_USER')
  set noswapfile          " don't create root owned swap files
else
  set directory=~/.vim/tmp/swap//         " seperate swap files
  set directory+=~/.local/.vim/tmp/swap// " seperate swap files
  set directory+=.                        " last resort, store swap in directory
endif

if has('folding')
  if has('windows')
    set fillchars=vert:┃             " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
  set foldmethod=indent                 " not as cool as syntax, but faster
  set foldlevelstart=99                 " start unfolded
  set foldtext=wincent#settings#foldtext() " see `~/.vim/autoload/wincent/settings.vim` for the `foldtext` func def
endif

set formatoptions+=n                    " smart auto-indenting inside numbered lists

set lazyredraw                          " don't update screen during macro playback

set scrolloff=3                         " start scrolling 3 lines before edge of viewport
set shiftround                          " always indent by multiple of shiftwidth
set shiftwidth=2                        " spaces per tab (when shifting)
set shortmess+=I                        " no splash screen
set shortmess+=A                      " ignore annoying swapfile messages.
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
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

" set textwidth=80                      " automatically hard wrap at 80 columns - NO THANKYOU!


if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo      " keep undo files out of the way
    set undodir+=~/.local/.vim/tmp/undo
    set undodir+=.
    set undofile                      " actually use undo files
  endif
endif

set updatecount=80                    " update swapfile every 80 typed chars
set updatetime=2000                   " CursorHold interval


if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                    " don't create root-owned files
  else
    if isdirectory('~/.vim/tmp')
      set viminfo+=n~/.vim/tmp/viminfo
    endif

    if !empty(glob('~/.vim/tmp/viminfo'))
      if !filereadable(expand('~/.vim/tmp/viminfo'))
        echoerr 'warning: ~/.vim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

if has('nvim')
  if exists('$SUDO_USER')
    set shada=                      " don't create root-owned files
  else
    if isdirectory('~/.local/share/nvim/shada')
      " For a detailed explanation about the `shada` file
      " https://neovim.io/doc/user/usr_21.html#21.3
      set shada='1000,f1,<500,:100,h,%,n~/.local/share/nvim/shada/main.shada
    endif
  endif
endif

if has('mksession')
  if isdirectory('~/.vim/tmp')
    set viewdir=~/.vim/tmp/view
  endif
  set viewoptions=cursor,folds
endif

" NOTE: To change the `mode` to `visual-block` / `v-block`
" `ctrl+v`
if has('virtualedit')
  set virtualedit=block
endif

set whichwrap=b,h,l,s,<,>[,],~  " allow <BS>/h/l<Left>/<Right>/<Space>, ~ to cross line boundaries


