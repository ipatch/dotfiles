""""""""""""""""""""""""""""""""""""
" Settings for Neovim plugins added via minpac.
" plugin - deoplete
" NOTE: requires `python3` provider to be installed
" NOTE: `g:deoplete#sources` has been deprecated
""
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " let b:deoplete_disable_auto_complete = 1
  " let g:deoplete_disable_auto_complete = 1

  let g:deoplete#source = {}

  let g:deoplete#sources#javascript = ['LanguageClient']

  " Disable the candidates in Comment/String syntaxes.
  " call deoplete#custom#source('_',
  "       \ 'disabled_syntaxes', ['Comment', 'String'])
  
  " deoplete tab-complete
  inoremap <expr><s-tab> pumvisible() ? "\<c-j>" : "\<s-tab>"
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif
