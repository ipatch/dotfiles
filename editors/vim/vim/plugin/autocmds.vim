if has('autocmd')

  """""""""""""""""""""""""""""
  " autocommand - update buffer if file has changed on window focus 
  ""
  augroup buffer_refresh
    autocmd!
    autocmd buffer_refresh FocusGained,BufEnter * checktime 
  augroup END

  """"""""""""""""""""""""""""""
  " autocommand > `line_return`
  " NOTE: return to the line number when reopening a buffer / file & no save required, position is saved to `~/.viminfo`
  ""
  augroup resCur
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
  augroup END


  """"""""""""""""""""""""""""""
  " autocommand - `conceal_return`
  " NOTE: a simple command / function to resume conceal settings when reopening a
  " bufffer
  ""

  """"""""""""""""""""""""""""""
  " autocommand - `fold_return`
  " NOTE: a simple command / function to resume fold settings when reopening a
  " buffer
  ""
endif
