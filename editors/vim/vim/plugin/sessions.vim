" CREDIT: https://stackoverflow.com/a/47656092/708807

function! MakeSession(overwrite)
  if &filetype ==? 'man'
    return
  else
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
      exe 'silent !mkdir -p ' b:sessiondir
      redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    if a:overwrite == 0 && !empty(glob(b:filename))
      return
    endif
    exe "mksession! " . b:filename
  endif
endfunction

function! LoadSession()
  if &filetype ==? 'man'
    return
  else
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  endif
endfunction

" Adding automations for when entering or leaving Vim
if(argc() == 0) " Vim called without arguments
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif
