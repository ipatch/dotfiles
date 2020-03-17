" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " au! BufRead,BufNewFile *.json setfiletype ruby 
  au BufRead,BufNewFile tsconfig.json		set filetype=jsonc 
  au BufRead,BufNewFile tsconfig.json set syntax=jsonc
augroup END


