"""""""""""""""""""""""""""""
" Key mappings / bindings
" NOTE: `meta` ie. `⌘.` within iTerm2 require escape sequences to be mapped
" NOTE: apparently `:map` and `:map!` will map to all modes in (n)vim
""

" BUG: 🐛 vim ≥ 8.2, the below mapping TOTALLY breaks mouse actions ie.
" ...no scrolling with `vimdiff`
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
" TODO: figure out a way to print the `cwd` or `pwd` quickly from `NORMAL` mode
" NOTE: `:pwd` is hacky, 
" UPDATE: ...obviously set a normal mode mapping for below commands  
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" indent the entire file 😯, do you believe in magic
nnoremap <leader>i mmgg=G`m<CR>

" bubble text, Normal mode, <M-???>, `M` is meta key, `alt` on macOS
nnoremap <M-k> :m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==

" bubble multiple lines - Visual mode
" FIXME: the below mapping is BORKED!!!
vmap <S-k> xkP`[V`] vmap <S-j> xp`[V`]

" navigate virtually wrapped lines document lines as single line.
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

" Toggle fold of current position.
nnoremap <Tab> za

" NOTE: iterm2 make sure to set proper escape sequences.
vnoremap <M-c> "+y
nnoremap <M-v> "+p
" inoremap <M-v> <esc>"+p
" Generic undo using `⌘ + z` for normal and insert modes
nnoremap <M-z> u
inoremap <M-z> <C-o>u

""""""""""""""
" Toggle last
" ...two open buffers
""
nnoremap <leader><leader> <c-^>

"---------------------------
" NOTE: plugin related mappings, ie. FZF
"--
" normal mode `<ctrl>+p` to fuzzy search for files
nnoremap <C-p> :FZF<cr>

" NOTE: plugin/fzf close terminal buffer with Escape key
" REF: https://github.com/junegunn/fzf.vim/issues/544#issuecomment-457456166
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"-----------------------------
" plugin/coc
" NOTE: add a more useful exp, codelens is the inline evaluation text using
" the ▸
"--
nmap <leader>1 :call coc#config('codeLens.enable', 'true')<CR>
nmap <leader>2 :call coc#config('codeLens.enable.', 'false')<CR>

""""""""""""""""""""""""""""""
" Splits - vertical & horizontal
" FIXME: TODO: this shit fucked
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

