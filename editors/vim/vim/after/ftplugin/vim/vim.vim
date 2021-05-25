set nospell
" setlocal textwidth=80
" set colorcolumn=+1

let b:ale_linters = ['vint']

""""""""""""""""""""""""""""""
" filetype syntax highlighting 🌈  shit 💩
""
augroup filetypedetect
 autocmd BufNewFile,BufRead *.nvim set filetype=vim
augroup END
