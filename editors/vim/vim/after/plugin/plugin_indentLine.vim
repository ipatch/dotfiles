scriptencoding utf-8

"""""""""""""""""""""""""""""
" plugin - indentLine
""
" SEE: https://github.com/Yggdroot/indentLine
""

let g:indentLine_setColors = 1 " default gray
" let g:indentLine_setColors = 0 " use colorscheme

let s:box_drawings_light_vertical='│'

" let g:indentLine_conceallevel = 2

let g:indentLine_char=s:box_drawings_light_vertical

let g:indentLine_bufNameExclude=['']

" DO NOT use indentLine for the below file types, ie. vim help files and specific man pages.

if has('nvim') && !has('nvim-0.2.2')
 " Older versions of Neovim set the runtime path incorrectly, causing problems
 " with JSON.
 let g:indentLine_fileTypeExclude=['help', 'json', 'reason', '1', '3', '5', '6', '7', '8', 'markdown']
else
 let g:indentLine_fileTypeExclude=['help', 'reason', '1', '3', '5', '6', '7', '8', 'markdown']
endif
