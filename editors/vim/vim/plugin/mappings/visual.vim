" Visual mode mappings

" Move VISUAL LINE selection within buffer.
xnoremap <silent> K :call wincent#mappings#visual#move_up()<CR>
xnoremap <silent> J :call wincent#mappings#visual#move_down()<CR>
