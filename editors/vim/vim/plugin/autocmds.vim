if has('autocmd')

  "-----------------------------
  " autocmd / create parent dir when saving a buffer if not present
  ""
  function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
      let dir=fnamemodify(a:file, ':h')
      if !isdirectory(dir)
        call mkdir(dir, 'p')
      endif
    endif
  endfunction
  augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup END
  
  "-----------------------------
  " autocmd / save session file using `vim-obsession`
  ""
  augroup auto_mksession
    autocmd!
    " autocmd BufEnter * checktime

    " " function! MakeSession()
    "   " let b:sessiondir = system("echo -n \"$echo $HOME)/.vim/tmp/sessions\"")
    "   " let b:filename = getcwd()
    "   execute "normal Obsess ~/.vim/tmp/sessions/fooiebars"
    "   " exe "mksession!"  . b:filename
    "   " exec "edit! " . b:filename
    "   " exe "g:^cd :d"
    "   " exe "x"
    " endfunction
  augroup END

  "-----------------------------
  " autocmd / easy jmp for ruby src files
  ""
  " augroup rubypath
  "   autocmd!
  "   autocmd FileType ruby setlocal suffixesadd+=.rb
  "   autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  " augroup END

  """"""""""""""""""""""""""""""
  " autocommand / update buffer if file has changed on window focus 
  ""
  augroup buffer_refresh
    autocmd!
    autocmd buffer_refresh FocusGained,BufEnter * checktime 
  augroup END

  """"""""""""""""""""""""""""""
  " autocommand / `line_return`
  " NOTE: return to the line number when reopening a buffer / file & no save required, position is saved to `~/.viminfo`
  ""
  augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
  augroup END

  """"""""""""""""""""""""""""""
  " autocommand / `conceal_return`
  " NOTE: a simple command / function to resume conceal settings when reopening a
  " bufffer
  ""

  """"""""""""""""""""""""""""""
  " autocommand / `fold_return`
  " NOTE: a simple command / function to resume fold settings when reopening a
  " buffer
  ""
endif
