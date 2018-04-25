" CREDIT: https://stackoverflow.com/a/47656092/708807

""""""""""""""""""""""""""""""
" Session Manangement
""

""""""""""""""""""""""""""""""
" NOTE: the options are restored with the vimrc so don't store them in the
" Session
" set sessionoptions-=options
""
" NOTE: don't want help windows to be restored:
" set sessionoptions-=help
""
" NOTE: don't persist options and mappings because it can corrupt sessions.
" set sessionoptions-=options
""

" Update a session, BUT ONLY IF IT ALREADY EXISTS
" function! SessionSave()
"   if v:this_session != ""
"     echo "Saving."
"     exe 'mksession! ' . '"' . v:this_session . '"'
"   else
"     echo "No Session."
"   endif
" endfunction

" " Creates a session
" function! MakeSession()
"   let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"   if (filewritable(b:sessiondir) != 2)
"     exe 'silent !mkdir -p ' b:sessiondir
"     redraw!
"   endif
"   let b:sessionfile = b:sessiondir . '/session.vim'
"   exe "mksession! " . b:sessionfile
" endfunction

" " Loads a session if it exists
" function! LoadSession()
"   if argc() == 0
"     let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
"     let b:sessionfile = b:sessiondir . "/session.vim"
"     if (filereadable(b:sessionfile))
"       exe 'source ' b:sessionfile
"     else
"       echo "No session loaded."
"     endif
"   else
"     let b:sessionfile = ""
"     let b:sessiondir = ""
"   endif
" endfunction


" au VimEnter * nested :call LoadSession()
" au VimLeave * :call SessionSave()
" map <leader>m :call MakeSession()<CR>

" " " Save and persist session
" " command! -nargs=? -complete=customlist,<SID>session_complete SessionSave
" "   \ call s:session_save(<q-args>)

" " " Load and persist session
" " command! -nargs=? -complete=customlist,<SID>session_complete SessionLoad
" "   \ call s:session_load(<q-args>)

" " " Save session on quit if one is loaded
" " augroup sessionsave
" "   autocmd!
" "   " If session is loaded, write session file on quit
" "   autocmd VimLeavePre *
" "     \ if ! empty(v:this_session) && ! exists('g:SessionLoad')
" "     \ | execute 'mksession! '.fnamescape(v:this_session)
" "     \ | endif
" " augroup END

" " function! s:session_save(name) abort
" "   if ! isdirectory(g:session_directory)
" "     call mkdir(g:session_directory, 'p')
" "   endif
" "   let filename = empty(a:name) ? badge#project() : a:name
" "   let file_path = g:session_directory.'/'.file_name.'.vim'
" "   execute 'mksession! '.fnamescape(file_path)
" "   let v:this_session = file_path

" "   echohl MoreMsg
" "   echo 'Session `'.file_name.'` is now persistent'
" "   echohl None
" " endfunction

" " function! s:session_load(name) abort
" "   let file_path = g:session_directory.'/'.a:name.'.vim'

" "   if ! empty(v:this_session) && ! exists('g:SessionLoad')
" "       \ | execute 'mksession! '.fnamescape(v:this_session)
" "       \ | endif

" "   noautocmd silent! %bwipeout!
" "   execute 'silent! source '.file_path
" " endfunction

" " function! s:session_complete(A, C, P)
" "   return map(
" "     \ split(glob(g:session_directory.'./*.vim'), '\n'),
" "     \ "fnamemodify(v:val, ':t:r')"
" "     \ )
" " endfunction

" " " Adding automations for when entering or leaving Vim
" " if(argc() == 0) " Vim called without arguments
" "   au VimEnter * nested :call session_load()
" "   au VimLeave * :call save_session(1)
" " else
" "   au VimLeave * :call session_load(0)
" " endif



" " function! MakeSession(overwrite)
" "   if &filetype ==? 'man'
" "     return
" "   else
" "     let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
" "     if (filewritable(b:sessiondir) != 2)
" "       exe 'silent !mkdir -p ' b:sessiondir
" "       redraw!
" "     endif
" "     let b:filename = b:sessiondir . '/session.vim'
" "     if a:overwrite == 0 && !empty(glob(b:filename))
" "       return
" "     endif
" "     exe "mksession! " . b:filename
" "   endif
" " endfunction

" " function! LoadSession()
" "   if &filetype ==? 'man'
" "     return
" "   else
" "     let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
" "     let b:sessionfile = b:sessiondir . "/session.vim"
" "     if (filereadable(b:sessionfile))
" "       exe 'source ' b:sessionfile
" "     else
" "       echo "No session loaded."
" "     endif
" "   endif
" " endfunction

