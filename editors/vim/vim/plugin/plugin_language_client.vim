"""""""""""""""""""""""""""""""""""""
" plugin - LanguageClient-neovim
""
let g:LanguageClient_autoStart = 1
" nnoremap <leader>lcs :LanguageClientStart<CR>
" let g:LanguageClient_logginLevel = 'DEBUG'
" let g:LanguageClient_loggingFile = '~/logs/languageclient.log'
" let g:LanguageClient_serverStderr = '~/logs/languageserver.log'
" let g:LanguageClient_loadSettings = 1

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }

      " \ 'javascript': ['flow-language-server', '--stdio'],
" NOTE: <silent> does not echo to the command line
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanguageClient_textDocument_documentSymbol()<CR>

set omnifunc=LanguageClient#complete
set completefunc=LanguageClient#complete

