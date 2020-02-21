" sass specific settings for working with `.scss` files
"

" Auto add closing curly brace for the love of all that is sane.
" Set sass files to use 2 spaces when <tab> is pressed.
augroup filetypedetect
  setlocal shiftwidth=2
  setlocal tabstop=2
  autocmd! BufNewFile,BufRead *.scss setfiletype scss
  inoremap {<CR> {<CR>}<Esc>ko

""""""""""""""""""""""""""""""
" scss - use `/* */` for commenting lines in `~/.gitconfig`
""
autocmd FileType scss setlocal commentstring=/*\ %s\ */

augroup END
