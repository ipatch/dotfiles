"""""""""""""""""""""""""""""
" Key mappings / bindings
" NOTE: `meta` ie. `⌘.` within iTerm2 require escape sequences to be mapped
" NOTE: apparently `:map` and `:map!` will map to all modes in (n)vim
" NOTE: the below configuration line will map the `spacebar` to ':' so that
" way `Shift+;` does not have to be pressed to begin a command in normal mode.
""

nnoremap <space> :

" NOTE: - the below insert mappings will bind 'jk' / 'kj' to ESC
" key functionality, so need to use <ESC> in insert mode
imap jk <esc>
imap kj <esc>
imap jj <esc>
imap kk <esc>

" use `,,` for escape <ESC>
inoremap ,, <ESC>

noremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" Fast saving
noremap <leader>w :w<CR>

" Command mode shortcuts
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" the below key mapping will indent the entire file 😯
nnoremap <leader>i mmgg=G`m<CR>

" go into command mode and print the working dir
" TODO: figure out a way to print the `cwd` or `pwd` quckily from `NORMAL` mode
" NOTE: `:pwd` is hacky  

" bubbling text - Normal mode
nnoremap <S-k> ddkP
nnoremap <S-j> ddp

" bubble multiple lines - Visual mode
vmap <S-k> xkP`[V`]
vmap <S-j> xp`[V`]

" navigate lines that have been virtually wrapped within a document as single.
nnoremap j gj
nnoremap k gk

" NOTE: if `<C-o>` is not specified then the `gj` or `gk` will literally be
" printed to the screen.
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" create a directory if it doesn't exist
nnoremap <silent> <leader>mkd :!mkdir -p %:p:h<CR>

" Toggle spell checking
nnoremap <silent> <leader>s :set spell!<CR>

" Open a new buffer in current session
nnoremap ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" When opening a readonly file, ie. /etc/hosts `w!!` 🚑
" cmap w!! w !sudo tee % >/dev/null %
cmap w!! %!sudo tee > /dev/null %

" Normal mode mappings
" CREDIT: @wincent

" Toggle fold of current postion.
nnoremap <Tab> za

" NOTE: iterm2 make sure to set proper escape sequences.
vnoremap <M-c> "+y
nnoremap <M-v> "+p
inoremap <M-v> <esc>"+p
" Generic undo using `⌘ + z` for normal and insert modes
nnoremap <M-z> u
inoremap <M-z> <C-o>u

""""""""""""""""""""""""""""""
" Binding - Buffer Handling
""
nnoremap <leader>t :enew<CR>

""""""""""""""""""""""""""""""
" Splits - vertical & horizontal
""
" nnoremap <C-w>- :split<CR>

" Split current buffer vertically and add an empty buffer to the right
nnoremap <silent> <leader>v :vsplit 0<CR>

" Split current buffer horizontally, and add an empty buffer below
nnoremap <silent> sh :split 0<CR>

