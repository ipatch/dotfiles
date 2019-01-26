if has('autocmd')
  """""""""""""""""""""""""""""
  " autocommand - update buffer if file has changed on window focus 
  ""
  augroup buffer_refresh
    autocmd!
    autocmd buffer_refresh FocusGained,BufEnter * checktime 
  augroup END

  """"""""""""""""""""""""""""""
  " autocommand - `line_return`
  " NOTE: return to the line number when reopening a buffer / file
  " NOTE: buffer does not need saving to remember position 👍
  " NOTE: the line position is written to `~/.viminfo`
  ""
  augroup line_return
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   execute "normal! g`\"" |
          \ endif
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

