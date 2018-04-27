if has('autocmd')
  augroup WincentAutocmds
    autocmd!

    autocmd VimResized * execute "normal! \<c-w>="

    " Disable paste mode on leaving insert mode.
    autocmd InsertLeave * set nopaste

    if has('nvim')
      " Sync with corresponding non-nvim settings in ~/.vim/plugin/settings.vim
    endif

    if has('mksession')
      " Save / restore folds and cursor position.
      
    endif

  augroup END
endif
