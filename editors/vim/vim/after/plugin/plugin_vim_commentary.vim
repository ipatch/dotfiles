""""""""""""""""""""""""""""""
" plugin - commentary
""
" Easy commenting in source files using tpope's plugin.
" CREDIT: https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
" TODO; figure out how to only load settings from this file if
" vim-commentary is loaded
noremap <leader>c :Commentary<cr>

""""""""""""""""""""""""""""""
" vim-commentary JSX
"""
"augroup
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
"augroup END

""""""""""""""""""""""""""""""
" gitconfig - use `#` for commenting lines in `~/.gitconfig`
""
autocmd FileType gitconfig setlocal commentstring=#\ %s

""""""""""""""""""""""""""""""
" scss - use `/* */` for commenting lines in `~/.gitconfig`
""
" vim/neovim needs custom commentstrings preferable in the
" `$HOME/.vim/after/ftplugin/filetype.vim` file to make sure custom
" commentstrings are loaded after default commentstrings
" SEE: https://github.com/tpope/vim-commentary/issues/90#issuecomment-359606243

