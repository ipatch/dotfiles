" https://github.com/suy/vim-context-commentstring

if !exists('g:context#commentstring#table')
    let g:context#commentstring#table = {}
endif
let g:context#commentstring#table['javascript.jsx'] = {
            \ 'jsComment' : '// %s',
            \ 'jsImport' : '// %s',
            \ 'jsxStatment' : '// %s',
            \ 'jsxRegion' : '{/*%s*/}',
\}
