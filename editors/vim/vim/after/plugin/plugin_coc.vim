" NOTE: path to global `package.json` for coc installed extensions
" `~/.config/coc/extensions/package.json`

" NOTE: there is an additional config file fof coc.nvim
" `~/.config/nvim/coc-settings.json`

function! CocBuildUpdate()
  " NOTE: this function replaces the old `BuildCoc` func
  if has('nvim')
    " NOTE: setup a `list` in VimL to supply the Coc `install_extension` func
    " TODO: autogen global_extensions in a var, ie. don't hardcode
    let g:coc_global_extensions = [
          \ 'coc-css',
          \ 'coc-html',
          \ 'coc-json',
          \ 'coc-eslint',
          \ ]
    call coc#util#install()
    call coc#util#install_extension(g:coc_global_extensions)
  endif
endfunction

command! CocBuildUpdate :call CocBuildUpdate()
command! CocUpdateBuild :call CocBuildUpdate()

call SetupCommandAlias("cocbuildupdate", "CocBuildUpdate")
call SetupCommandAlias("cocupdatebuild", "CocUpdateBuild")

" NOTE: unfortunately (n)Vim abbr's don't tab ⇥ complete like fish shell ...boooo

" plugin > coc > use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" plugin / coc / completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" plugin / coc / close preview window when completion is done.
augroup coc_close_pum
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" plugin / coc / tab through completion choices
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" plugin / coc / no new line / carriage return after selection
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" plugin / coc / trigger autocomplete menu
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

