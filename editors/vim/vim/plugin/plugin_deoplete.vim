""""""""""""""""""""""""""""""""""""
" Settings for Neovim plugins added via minpac.
" plugin - deoplete
" NOTE: requires `python3` provider to be installed
""
if has('nvim')
  let b:deoplete_disable_auto_complete = 1
  let g:deoplete_disable_auto_complete = 1

  let g:deoplete#source = {}

  " Disable the candidates in Comment/String syntaxes.
  call deoplete#custom#source('_',
        \ 'disabled_syntaxes', ['Comment', 'String'])

  let g:deoplete#sources.python = ['LanguageClient']
  let g:deoplete#sources.js =['LanguageClient']
  let g:deoplete#sources.javascript = ['LanguageClient']
  let g:deoplete#sources.rs = ['LanguageClient']
   " let g:deoplete#enable_at_startup = 1
  " let g:deoplete#enable_debug = 1
  " let g:deoplete#enable_profile = 1
  " " call deoplete#enable_logging('DEBUG', '/Users/capin/logs/deoplete.log')
  " let g:deoplete#enable_smart_case = 1

  " if !exists('g.deoplete#omni#input_patterns')
  "   let g:deoplete#omni#input_patterns = {}
  " endif

  " NOTE: `g:deoplete#sources` has been deprecated
  "https://gist.github.com/afnanenayet/8c2ee0fdabb8d1e292b788f9723673c5#gistcomment-2593832
  " call deoplete#custom#option({
  "       \ 'camel_case': v:true,
  "       \ 'sources': {
  "       \   'go': ['LanguageClient'],
  "       \   'python': ['LanguageClient'],
  "       \ },
  "       \ })
  "   call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_length'])
  " call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
endif
