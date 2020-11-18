"""""""""""""""""""""""""""""
" Key mappings / bindings
" NOTE: `meta` ie. `⌘.` within iTerm2 require escape sequences to be mapped
" NOTE: apparently `:map` and `:map!` will map to all modes in (n)vim
" NOTE: the below configuration line will map the `spacebar` to ':' so that
" way `Shift+;` does not have to be pressed to begin a command in normal mode.
""

" BUG: vim ≥ 8.2 the below mapping will TOTALLY break any mouse actions
" which becomes a total PITA when trying to use `vimdiff`
if has('nvim')
  nnoremap <esc> :
elseif v:version > 8 || v:version == 8 " Check for Vim8 ...sort of
  nnoremap <space> :
endif


" NOTE: - the below insert mappings will bind 'jk' / 'kj' to ESC
" key functionality, so need to use <ESC> in insert mode
imap jk <esc>
imap kj <esc>
imap jj <esc>
imap kk <esc>

noremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

" save changes to current buffer/file
noremap <leader>w :w<CR>
" close buffer/file
noremap <leader>x :bw<CR>

" Command mode shortcuts
""
" go into command mode and print the working dir
" TODO: figure out a way to print the `cwd` or `pwd` quckily from `NORMAL` mode
" NOTE: `:pwd` is hacky  
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" the below key mapping will indent the entire file 😯
nnoremap <leader>i mmgg=G`m<CR>

" bubbling text - Normal mode, <M-???> the `M` refers to the meta key which is
" `alt` on macOS
nnoremap <M-k> :m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==

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
" cmap mkd !mkdir -p %:p:h " NO GO!!!

" Toggle spell checking
nnoremap <silent> <leader>s :set spell!<CR>

" Open a new buffer in current session
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

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
" inoremap <M-v> <esc>"+p
" Generic undo using `⌘ + z` for normal and insert modes
nnoremap <M-z> u
inoremap <M-z> <C-o>u

""""""""""""""""""""""""""""""
" Binding - Buffer Handling
""
" nnoremap <leader>t :enew<CR>

"""""""""""''"
" Toggle last
" ...two open buffers
""
nnoremap <leader><leader> <c-^>

""""""""""""""
" switch to buffer #1 through #9
""
" NOTE use <leader>+<{1..9}>
" NOTE use `<ctrl>+p` to fuzzy search for files
" NOTE use `<ctrl>+g` to close the above mentioned window
" NOTE the above bindings require fzf to be installed
""

""""""""""""""""""""""""""""""
" buffers <tab>
""
" NOTE cycle through list of open buffers
" nnoremap <leader>b :buffers<cr>:b<space>

""""""""""""""""""""""""""""""
" Splits - vertical & horizontal
""
" Split current buffer vertically with empty buffer to the right
" nnoremap <C-w>\ :vsplit 0<CR>
" Split curren buffer horizontally with empty buffer below
" nnoremap  <C-w>- :split 0<CR>

"" pseudo maximize toggle
" open split in new tab, ie. fill window
" nnoremap <C-w>z :tab sp<CR>

" NOTE: `vim unmaximize, toggle, shrink, restore buffer size
" use `<C-w>c` to close maximized window and restore to previous layout

