"""""""""""""""""""""""""""""
" ~ settings.vim ~
""

""""""""""""""""""""""""""""""
" Optional settings
""
" set directory=~/.vim/tmp/backup                 " for the backup files
" set directory=~/.vim/tmp/sessions               " for the session files
" set directory=~/.vim/tmp/swap                   " for the swap files
" set directory=~/.vim/tmp/undo                   " for the undo files
" set directory=~/.vim/tmp/views                  " for the view files

""""""""""""""""""""""""""""
" create directories for Vim related files
""
silent execute '!mkdir -p $HOME/.vim/tmp/backup'
silent execute '!mkdir -p $HOME/.vim/tmp/sessions'
silent execute '!mkdir -p $HOME/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.vim/tmp/views'

silent execute '!mkdir -p $HOME/.local/.vim/tmp/backup'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/sessions'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/swap'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/undo'
silent execute '!mkdir -p $HOME/.local/.vim/tmp/views'

" Enable smart joining of commented lines.
" TODO: figure out sane way to use `shift+j` and `shift+k` to join lines
" SEE: `:h formatoptions` for more settings
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j    " remove comment leader when joining comments
endif

""""""""""""""""""""""""""""""
" backups - settings
""
if exists('$SUDO_USER') " setup backup files for Vim & Neovim
  set nobackup            " don't create backup files for root
  set nowritebackup       " don't create backup files for root
else
  " backup files to `~/.vim` first if dir exists, if can't write then `~/.local`
  set directory=~/.vim/tmp/backup      " keep backup files out of the way
  set directory+=~/.local/.vim/tmp/backup 
  set directory+=. " as a last resort put backup files in the current directory.
endif

""""""""""""""""""""""""""""""
" swap - settings
""
if exists('$SUDO_USER') " setup swap files for Vim & Neovim
  set noswapfile          " don't create root owned swap files
else
set updatecount=80                    " update swapfile every 80 typed chars
  set directory=~/.vim/tmp/swap//         " seperate swap files
  set directory+=~/.local/.vim/tmp/swap// " seperate swap files
  set directory+=.                        " last resort, store swap in directory
endif

""""""""""""""""""""""""""""""
" folding - settings
""
if has('folding')
  if has('windows')
    set fillchars=vert:┃ " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
  set foldmethod=indent                 " not as cool as syntax, but faster
  set foldlevelstart=99                 " start unfolded
  set foldtext=wincent#settings#foldtext() " see `~/.vim/autoload/wincent/settings.vim` for the `foldtext` func def
endif

set formatoptions+=n              " smart auto-indenting inside numbered lists
set lazyredraw                    " don't update screen during macro playback
set shiftround                    " always indent by multiple of shiftwidth
set shortmess+=I                  " no splash screen
set shortmess+=A                  " ignore annoying swapfile messages.
set shortmess+=a " use abbr in message `[RO]` instead of `[readonly]`

if has('windows')
  set splitbelow           " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright    " open vertical splits to the right of the current window
endif

" set textwidth=80   " automatically hard wrap at 80 columns - NO THANKYOU!

""""""""""""""""""""""""""""""
" undo - settings
""
if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo      " keep undo files out of the way
    set undodir+=~/.local/.vim/tmp/undo
    set undodir+=.
    set undofile                      " actually use undo files
    set updatetime=2000                   " CursorHold intervalendif
  endif
endif


""""""""""""""""""""""""""""""
" session - settings
""
if has('mksession')
  if exists('$SUDO_USER')
    " no session file
  else
    if isdirectory('~/.vim/tmp/sessions')
      let g:sessiondir = $HOME.'/.vim/sessions'
    endif
  endif
endif

""""""""""""""""""""""""""""""
" view - settings
""
if has('mkview')
  if exists('$SUDO_USER')
    " no view file
    set viewdir=
  else
    if isdirectory('~/.vim/tmp/views')
      set viewdir=~/.vim/tmp/views
    endif
  endif
endif

""""""""""""""""""""""""""""""
" viminfo - settings
""
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

if has('nvim') " Neovim uses a `shada` file as opposed to `viminfo`
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

" NOTE: To change the `mode` to `visual-block` / `v-block` `ctrl+v`
if has('virtualedit')
  set virtualedit=block
endif

set whichwrap=b,h,l,s,<,>[,],~  " allow <BS>/h/l<Left>/<Right>/<Space>, ~ to cross line boundaries

