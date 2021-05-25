syn region jsonComment start="/\*" end="\*/"
hi link jsonCommentError Comment
hi link jsonComment Comment


" NO WORK!
" au BufRead *.json let g:indentLine_setConceal = 0
