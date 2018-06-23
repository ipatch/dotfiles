""""""""""""""""""""""""""""""
" plugin - ALE
""
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ }
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

