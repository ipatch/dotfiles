"""""""""""""""""""""""""""""
" plugin - lightline.vim
""
let g:lightline = {
      \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
      \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
      \ 'component_type': {'buffers': 'tabsel'},
      \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \ 'gitbranch': 'fugitive#head',
      \ 'filename': 'LightlineFilename'
      \ },
      \ }

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unnamed = '[No Name]'

function! LightlineFilename()
  let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let l:modified = &modified ? ' +' : ''
  return l:filename . l:modified
endfunction

" TODO: figure out why this shit a'int working 🙄
nmap <Leader>1 <Plug>Lightline#bufferline#go(1)
nmap <Leader>2 <Plug>Lightline#bufferline#go(2)
nmap <Leader>3 <Plug>Lightline#bufferline#go(3)
nmap <Leader>4 <Plug>Lightline#bufferline#go(4)
nmap <Leader>5 <Plug>Lightline#bufferline#go(5)
nmap <Leader>6 <Plug>Lightline#bufferline#go(6)
nmap <Leader>7 <Plug>Lightline#bufferline#go(7)
nmap <Leader>8 <Plug>Lightline#bufferline#go(8)
nmap <Leader>9 <Plug>Lightline#bufferline#go(9)

"""""""""""""""
" plugin - lightline - mode map
" NOTE: abbreviations for mode maps
" n - normal
" i - insert
" R - replace
" v - visual
" V - v-line
" c - command
" s - select
" S - s-line
" t - terminal
""
let g:lightline.mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c' : 'COMMAND',
      \ 's' : 'SELECT',
      \ 'S' : 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'TERMINAL',
      \ }

   endif " END - minpac added plugin settings 

