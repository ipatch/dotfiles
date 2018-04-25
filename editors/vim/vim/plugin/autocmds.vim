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
      " Save/restore folds and cursor position.
      autocmd BufWritePost,BufLeave,WinLeave ?* if wincent#autocmds#should_mkview() | call wincent#autocmds#mkview() | endif
      if has('folding')
        autocmd BufWinEnter ?* if wincent#autocmds#should_mkview() | silent! loadview | execute 'silent! ' . line('.') . 'foldopen!' | endif
      else
        autocmd BufWinEnter ?* if wincent#autocmds#should_mkview() | silent! loadview | endif
      endif
    elseif has('folding')
      " Like the autocmd described in `:h last-position-jump` but we add
      " `:foldopen!`.
      autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | execute 'silent! ' . line("'\"") . 'foldopen!' | endif
    else
      autocmd BufWinEnter * if line("'\"") > 1 && line("'\"") <= line('$') | execute "normal! g`\"" | endif
    endif
  augroup END
endif
