function! MarkdownFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else
    return "="
  endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=MarkdownFoldText()

