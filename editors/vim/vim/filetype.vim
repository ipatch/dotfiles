" NOTE: ipatch, settings for my custom filetypes 

if exists("did_load_filetypes")
  finish
endif
" augroup filetypedetect
"   au BufRead,BufNewFile *.json set filetype=jsonc
"   au BufRead,BufNewFile *.json set syntax=jsonc
"   au FileType jsonc let g:indentLine_enabled=0
" augroup END


