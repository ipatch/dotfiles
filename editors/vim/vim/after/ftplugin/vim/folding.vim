"""""""""""""""""""""""""""""
" folding for .vim & .vimrc files
""

function! VimFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^"\{1,35}') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

" the below line instructs vim to use a custom expression to handle folds
setlocal foldmethod=expr
setlocal foldexpr=VimFolds()

function! VimFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

setlocal foldtext=VimFoldText()

