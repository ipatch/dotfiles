" Syntax bullshit for JS files using Vim / Neovim

" augroup auto_filetype
"   " autocmd BufNewFile,BufRead *.jsx set filetype=javascript
" augroup END
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.js setfiletype javascript
augroup END

" if executable('javascript-typescript-stdio')
  " let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  " augroup js_lang_client
    " autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
  " augroup END
" else
  " echom 'javascript-typescript-stdio not installed!\n'
  " :cq
" endif
