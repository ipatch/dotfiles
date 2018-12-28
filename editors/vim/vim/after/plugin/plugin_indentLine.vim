scriptencoding utf-8

"""""""""""""""""""""""""""""
" plugin - indentLine
""
" SEE: https://github.com/Yggdroot/indentLine
""

let g:indentLine_setColors = 1 " overwrite colorscheme, use default grey
let g:indentLine_setConceal = 0

let s:box_drawings_light_vertical='│'

let g:indentLine_char=s:box_drawings_light_vertical

let g:indentLine_bufNameExclude=['']

" DO NOT use indentLine for the below file types, ie. vim help files and specific man pages.

if has('nvim') && !has('nvim-0.2.2')
 " Older versions of Neovim set the runtime path incorrectly, causing problems
 " with JSON.
 let g:indentLine_fileTypeExclude=['help', 'json', 'reason', '1', '3', '5', '6', '7', '8']
else
 let g:indentLine_fileTypeExclude=['help', 'reason', '1', '3', '5', '6', '7', '8']
endif
