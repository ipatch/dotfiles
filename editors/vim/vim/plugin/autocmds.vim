if has('autocmd')

  "-----------------------------
  " autocmd > easy jmp for ruby src files
  ""
  augroup rubypath
    autocmd!

    autocmd FileType ruby setlocal suffixesadd+=.rb
  augroup END

  "-----------------------------
  " autocmd > add dir above `tags` file to vim path, ie. `set path`
  "--
  " augroup UpdatePath
  "   let s:default_path = escape(&path, '\ ') " store default value of 'path'

  "   " Always add the current file's directory to the path and tags list if not
  "   " already there. Add it to the beginning to speed up searches.
  "   autocmd BufNewFile,BufRead,BufEnter *
  "         \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
  "         \ exec "set path-=".s:tempPath |
  "         \ exec "set path-=".s:default_path |
  "         \ exec "set path^=".s:tempPath |
  "         \ exec "set path^=".s:default_path
  "   let s:default_path = escape(&path, '\ ') " store default value of 'path'

    " " Always add the current file's directory to the path and tags list if not
    " " already there.  Add it to the beginning to speed up searches.
    " autocmd! BufRead,BufEnter *
    "       \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
    "       \ exec "set path-=".s:tempPath |
    "       \ exec "set path-=".s;default_path |
    "       \ exec "set path^=".s:tempPath |
    "       \ exec "set path^=".s:default_path
    " " autocmd!
    " autocmd BufNewFile,BufRead,BufEnter * let &path += fnamemodify(tagfiles()[0], ':p:h')
  " augroup END

  """"""""""""""""""""""""""""""
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
