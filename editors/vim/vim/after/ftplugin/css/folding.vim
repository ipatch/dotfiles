" Vim folding file using custom expression, for CSS
" SEE: `:help foldexpr`
" SEE: http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" SEE: http://www.vimregex.com/

function! CSSFolds()
  let thisline = getline(v:lnum) " get the current contents of the line
  " getline(v:foldstart) =~# '^\s*/\* =\+' ? getline(v:foldstart + 1) : foldtext()
  " create a regex that looks for a `{` as the last char of a line
  " NOTE: `if match(thisline, '^#') >= 0`  " check for `#` at the beginning of line 
  if match(thisline, '{$') >= 0
    return ">1"
  else
    return "="
  endif
  return "1"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=CSSFolds()
