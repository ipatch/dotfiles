function! CocBuildUpdate()
  " `~/.config/coc/extensions/package.json`
  " NOTE: this function replaces the old `BuildCoc` func
  if has('nvim')
    " NOTE: setup a `list` in VimL to supply the Coc `install_extension` func
    " TODO: autogen global_extensions in a var, ie. don't hardcode
    let g:coc_global_extensions = [
          \ 'coc-css',
          \ 'coc-html',
          \ 'coc-json',
          \ ]
    call coc#util#install()
    call coc#util#install_extension(g:coc_global_extensions)
  endif
endfunction

command! CocBuildUpdate :call CocBuildUpdate()
command! CocUpdateBuild :call CocBuildUpdate()

call SetupCommandAlias("cocbuildupdate", "CocBuildUpdate")
call SetupCommandAlias("cocupdatebuild", "CocUpdateBuild")

" NOTE: unfortunately (n)Vim abbr's don't tab ⇥ complete like they do in fish ...boooo

" plugin > coc > use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" plugin > coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" plugin > coc > close preview window when completion is done.
augroup coc_close_pum
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END
" plugin > coc > tab through completion choices
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" plugin > coc > no new line / carriage return after selection
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" plugin > coc > trigger autocomplete menu
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

