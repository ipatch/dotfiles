" Vim & Neovim syntax file
" filetype: markdown, ie. `.md`
" https://git.io/vprKe
" Syntax shit for working with markdown documents, ie. `.md` files

""""""""""""""""""""""""""""""
" markdown `.md` syntax support
" NOTE: `conceallevel=0` equals text shown normally, ie. no concealing 
""
augroup markdown_filetype
  autocmd BufNewFile,BufReadPost *.{md,markdown,mkd,mkdn} set filetype=markdown 
augroup END

" for fenced language support in markdown documents
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'js=javascript', 'json=javascript', 'ruby']


" set the default conceal level for markdown `.md` documents
" NOTE: `cole=0` DO NOT hide / conceal any text, display everything.
set cole=0
