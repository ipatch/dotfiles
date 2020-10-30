"-------------------------------
" Vim & Neovim syntax file
" NOTE: `conceallevel=0` equals text shown normally, ie. no concealing 
" filetype: markdown, ie. `.md` syntax support
" https://git.io/vprKe
" Syntax shit for working with markdown documents, ie. `.md` files
"--

augroup markdown_filetype
  autocmd BufNewFile,BufReadPost *.{md,markdown,mkd,mkdn} set filetype=markdown 
  " autocmd! Filetype markdown nnoremap <buffer> gf :call MarkDownGF()<CR>
augroup END


" for fenced language support in markdown documents
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'js=javascript', 'json=javascript', 'ruby']

" set the default conceal level for markdown `.md` documents
" NOTE: `cole=0` DO NOT hide / conceal any text, display everything.
set cole=0

" EXP with navigating through sections of markdown documents
" NOTE: the below func is incomplete ucomment above binding to use func
" REF: https://vi.stackexchange.com/a/9345/10550
function! MarkDownGF()
  " Get the filename under the cursor
    let cfile=expand('<cfile>')
    " Separate the filename from the section
    let parts=split(cfile, '#')

    " No section marked
    if (len(parts) == 1)
        execute "normal! gf"
    " There was a subsection in the file name
    else
        execute "e " . parts[0]
        let pattern = "^" . repeat('\#',len(parts)-1) . "\\\s*" . parts[len(parts)-1] . "$"
        call search(pattern, 'w')
    endif
    " let raw_filename = expand('<cfile>')
    " let arg = substitute(raw_filename, '\([^#]*\)\(#\{1,6\}\)\([^#]*\)', '+\/\2\\\\s\3 \1', 'g')
    " execute "edit" arg
endfunction
