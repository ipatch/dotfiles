""""""""""""""""""""""""""""""""""""
" Settings for Neovim plugins added via minpac.
" plugin - deoplete
" NOTE: requires `python3` provider to be installed
" NOTE: `g:deoplete#sources` has been deprecated
""
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  " let b:deoplete_disable_auto_complete = 1
  let g:deoplete#omni#input_patterns = {}

  set completeopt=longest,menuone,preview

  let g:deoplete#sources = {}
  let g:deoplete#sources.javascript = ['LanguageClient', 'file', 'buffer']
  let g:deoplete#sources.typescript = ['LanguageClient', 'file', 'buffer']

  " Disable the candidates in Comment/String syntaxes.
  " call deoplete#custom#source('_',
  "       \ 'disabled_syntaxes', ['Comment', 'String'])
  
  " deoplete tab-completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <C-space> deoplete#manual_complete('omni')
  inoremap <expr> <C-l> deoplete#refresh()
endif
