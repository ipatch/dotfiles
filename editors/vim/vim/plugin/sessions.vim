""""""""""""""""""""""""""""""
" Session Manangement
""

""""""""""""""""""""""""""""""
" 🚨 NOT IMPLEMENTED!
"
" NOTE: this file is a scaffolding for automatting session creation when opening Vim from a certain directory.
"
" NOTE: the `options` are restored with the vimrc so don't store them in a
" `session.vim` file, and don't persist options because it can corrupt sessions.
" set sessionoptions-=options
""
" NOTE: don't want help windows to be restored:
" set sessionoptions-=help
""

let g:session_dir = $HOME.'/.vim/sessions'
let g:vim_launch_dir = $PWD

" NOTE: to print the output of the above variable
" :echo session_dir

function! MakeSession(overwrite)
  if (filewritable(g:session_dir) != 2) " check if sessiondir exists
    exe 'silent !mkdir -p ' g:session_dir
    redraw!
  endif
  " let b:filename = b:sessiondir . '/' . &b:vimlaunchdir . '/session.vim'
  " set directory=~/.vim/sessions
"   let file_name = empty(a:file) ? block#project() : a:file
  let b:converted_launch_dir = return substitute(a:vim_launch_dir a:/, a:-, "g")
  let b:file_name = g:session_dir . '/' exe echo(converted_launch_dir).vim
  if a:overwrite == 0 && !empty(glob(b:file_name))
    return
  endif
  exe "mksession! " . b:file_name
endfunction

" function! LoadSession()
"   let b:vimlaunchdir = $PWD
"   let b:sessiondir = $HOME . "/.vim/sessions"
"   let b:sessionfile = b:sessiondir . b:vimlaunchdir . '/session.vim'
"   if (filereadable(b:sessionfile))
"     exe 'source ' b:sessionfile
"   else
"     echo "No session loaded."
"   endif
" endfunction

" " Adding automation for when entering or leaving Vim
" if(argc() == 0)
"   au VimEnter * nested :call LoadSession()
"   au VimLeave * :call MakeSession(1)
" else
"   au VimLeave * :call MakeSession(0)
" endif

