" CSS specific settings for working with `.css` files
"

" Auto add closing curly brace for the love of all that is sane.
" Set CSS files to use 2 spaces when <tab> is pressed.
augroup filetypedetect
  setlocal shiftwidth=2
  setlocal tabstop=2
  autocmd! BufNewFile,BufRead *.css setfiletype css
  inoremap {<CR> {<CR>}<Esc>ko
augroup END
