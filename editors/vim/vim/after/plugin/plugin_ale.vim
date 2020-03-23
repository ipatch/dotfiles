""""""""""""""""""""""""""""""
" plugin - ALE
""

" expiermenting with code completion
" let g:ale_completion_enabled = 1

let g:ale_linters = {
      \ 'sh' : ['shellcheck'],
      \ 'html' : ['tidy'],
      \ 'markdown' : ['markdownlint'],
      \ 'javascript': ['eslint'],
      \ 'javascript.jsx' : ['eslint'],
      \ }

let g:ale_fixer = {
      \ 'javascript': ['eslint'],
      \}

let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['stylelint', 'eslint']}
let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard']}

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1 " default
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_sign_error                 = '>>'
let g:ale_sign_warning               = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
hi ALEErrorSign guifg=#FF0000
hi ALEWarningSign guifg=#FFFF00

