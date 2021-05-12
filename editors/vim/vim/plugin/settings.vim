""""""""""""""""""""""""""""""
" ~ settings.vim ~ for Vim >= 8 && Neovim
" Author: Chris Jones
" Source: http://github.com/ipatch/dotfiles/blob/master/editors/vim/settings.vim
""

"""""""""""""""""""""""""""""
" ~ settings.vim ~
""
set mouse=a " enable mouse support
set title " Set the title on the terminal tab
set number " print absolute line number
set relativenumber " print numbers realitve to absolute
set background=dark
set cursorline " Highlight current line
set backspace=eol,start,indent " Configure sane backspace
filetype plugin indent on " detect & enable filetype specific plugins
runtime macros/matchit.vim
syntax on
set history=500 " History for days 😛
set showcmd " Show incomplete cmds in lower right 
set noshowmode " let status line show mode
set laststatus=2
set modelines=5
set visualbell t_vb= " DON'T abbr to `vb` use `visualbell`
" set path+=$PWD/** " useful for quickly jmp between src files, ie. `gf`
" TODO: make `path+=` more robust, ie. mk werk for both win and *nix
" NOTE: `win` `set path+=.\**`
set autoread " automatically re-read file if changes occur outside of vim

"""""""""""""""""""""""""""""
" hidden chars
""
set listchars+=tab:‣\
set listchars+=nbsp:⦸ " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=extends:» " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:« " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:• " BULLET (U+2022, UTF-8: E2 80 A2)
set listchars+=eol:¬
set listchars+=space:␣ " Symbol for the space key
set fillchars+=stl:\ ,stlnc:\
"""""""""""""""
" toggle hidden chars & Settings for hidden chars
""
nmap <leader>h :set list!<CR>

if has('linebreak')
  let &showbreak='↳ ' " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

""""""""""""""""""""""""""""""
" Spelling
""
if has('syntax')
  set spellcapcheck= " don't check for capital letters at start of sentence
endif

set spelllang=en_us " set the language for spelling words

" BUG: 🐛 enabling the below line breaks copy/paste of emojis in neovim
" language en_US
lan en_US.UTF-8

""""""""""""""""""""""""""""""
" wrapping
""
set wrap
set linebreak

""""""""""""""""""""""""""""""
" search
""
set hlsearch " Highlight search results
set ignorecase " Ignore case when sarching
set smartcase " become case-sensitive if uppercase present
"
" Stop highlighting on Enter
map <CR> :nohl<CR> 
set incsearch
set nojoinspaces
set display+=lastline
set showmatch " show matching braces

"""""""""""""""""""""""""""""
" Indentation / tab shit
""
set ts=2 sts=2 sw=2 expandtab 
set shiftwidth=2 " Indent 2 spaces < and > commands as well.
set softtabstop=2
set tabstop=2 " Indicates how many `spaces` a `tab` will indent
set expandtab " spaces are better than tabs 💥
set nofoldenable
set tabstop=2
set autoindent " DON'T abbrv to `ai`, use `autointdent`
set smartindent 
set hidden " set sane buffer switching
set smarttab " <tab>/<BS> indent/dedent in leading whitespace
""""""""""""""""""""""""""""""
" Scrolling
""
set scrolloff=3 " start scrolling 3 lines before edge of viewport

"""""""""""""""""""""""""""""
" Settings > Visual Tabs
""
" NOTE: tabs AREN"T buffers, always try and use buffers when possible.
set showtabline=0 " only show if 2 or more tabs.

""""""""""""""""""""""""""""""
" settings > sessions
""
" NOTE: `localoptions` appears to save conceal settings used with `indentLine`
" 🚨 NOTE: `localoptions` BREAKS return cursor position
set sessionoptions=buffers,folds,winsize,blank,slash,unix,localoptions

""""""""""""""""""""""""""""""
" settings > gutter
""
set foldcolumn=2 " width of gutter outlining folds

""""""""""""""""""""""""""""
" create directories for Vim related files if they don't exist, ie. `-p`
""
" DANGER: DO NOT UNCOMMENT the below lines unless you like terribly slow load times 🤯
""
" 
" silent execute '!mkdir -p $HOME/.vim/tmp/backup'
" silent execute '!mkdir -p $HOME/.vim/tmp/sessions'
" silent execute '!mkdir -p $HOME/.vim/tmp/swap'
" silent execute '!mkdir -p $HOME/.vim/tmp/undo'
" silent execute '!mkdir -p $HOME/.vim/tmp/views'

" Enable smart joining of commented lines.
" TODO: figure out sane way to use `shift+j` and `shift+k` to join lines
" SEE: `:h formatoptions` for more settings
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " remove comment leader when joining comments
endif

""""""""""""""""""""""""""""""
" settings > backups
""
if exists('$SUDO_USER') " setup backup files for Vim & Neovim
  set nobackup " don't create backup files for root
  set nowritebackup " don't create backup files for root
else
  " backup files to `~/.vim` first if dir exists, if can't write then `~/.local`
  set backupdir=~/.vim/tmp/backup// " keep backup files out of the way
  set backupdir+=~/.local/.vim/tmp/backup// 
  set backupdir+=. " last resort put backup files in the current directory.
endif

""""""""""""""""""""""""""""""
" settings > swap files
""
if exists('$SUDO_USER') " setup swap files for Vim & Neovim
  set noswapfile " don't create root owned swap files
else
  set updatecount=80 " update swapfile every 80 typed chars
  set directory=~/.vim/tmp/swap// " seperate swap files
  set directory+=~/.local/.vim/tmp/swap// " seperate swap files
  set directory+=. " last resort, store swap in dir
endif

""""""""""""""""""""""""""""""
" settings > folds
""
if has('folding')
  if has('windows')
    set fillchars=vert:┃ " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:· " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
  set foldmethod=indent " not as cool as syntax, but faster
  set foldlevelstart=99 " start unfolded
endif

set formatoptions+=n " smart auto-indenting inside numbered lists
set lazyredraw " don't update screen during macro playback
set shiftround " always indent by multiple of shiftwidth
set shortmess+=I " no splash screen
set shortmess+=A " ignore annoying swapfile messages.
set shortmess+=a " use abbr in message `[RO]` instead of `[readonly]`

if has('windows')
  set splitbelow " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright " open vertical splits to the right of the current window
endif

" set textwidth=80 " automatically hard wrap at 80 columns - NO THANKYOU!

""""""""""""""""""""""""""""""
" settings > undo files
""
if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile " don't create root-owned files
  else
    set undodir=~/.vim/tmp/undo// " keep undo files out of the way
    set undodir+=~/.local/.vim/tmp/undo//
    set undodir+=.
    set undofile " actually use undo files
    set updatetime=2000 " CursorHold interval
  endif
endif

""""""""""""""""""""""""""""""
" settings > sessions
""

""""""""""""""""""""""""""""""
" settings > views
" NOTE: `~/.vim/tmp/views` is the default dir to save folds
""
" `== 2` checks for an exact match of `mkview`
if exists(':mkview') == 2
  " echom 'making views is a thing'
  if exists('$SUDO_USER')
    " no view file(s) for super users
    set viewdir=
  else
    set viewdir=~/.vim/tmp/views
    au BufWinLeave *.* silent! mkview
    au BufWinEnter *.* silent! loadview
    " Save fold settings.
    " Don't save options.
    " set viewoptions-=options
    " set viewoptions=options,folds
    " set viewoptions=folds
  endif
endif

""""""""""""""""""""""""""""""
" viminfo - settings
""
if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo= " don't create root-owned files
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
    set shada= " don't create root-owned files
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

