""""""""""""""""""""""""""""""
" plugin - commentary
""
" Easy commenting in source files using tpope's plugin.
" CREDIT: https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
noremap <leader>c :Commentary<cr>

""""""""""""""""""""""""""""""
" vim-commentary JSX
"""
"augroup
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
"augroup END

""""""""""""""""""""""""""""""
" gitconfig
""
autocmd FileType gitconfig setlocal commentstring=#\ %s

