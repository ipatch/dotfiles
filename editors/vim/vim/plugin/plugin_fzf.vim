""""""""""""""""""""""""""""""
" plugin - FZF
""
if &runtimepath =~# 'fzf'
  nmap ; :Buffers<CR>
  nmap <Leader>f :Files<CR>
  command! FZFMru call fzf#run({
        \  'source':  v:oldfiles,
        \  'sink':    'e',
        \  'options': '-m -x +s',
        \  'down':    '40%'})
  nmap <Leader>r :FZFMru<CR>
  nnoremap <C-p> :<C-u>FZF<CR>
  nnoremap <Leader>m :History<CR>

  " You can set up fzf window using a Vim command (Neovim or Vim 8 required)
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10split enew' }

  " --column: Show column number
  " --line-number: Show line number
  " --no-heading: Do not show file headings in results
  " --fixed-strings: Search term as a literal string
  " --ignore-case: Case insensitive search
  " --no-ignore: Do not respect .gitignore, etc...
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  " --color: Search color options

  command! -bang -nargs=* Find call fzf#vim#grep(
        \'rg
        \--column
        \--line-number
        \--no-heading 
        \--fixed-strings 
        \--ignore-case 
        \--no-ignore 
        \--hidden 
        \--follow 
        \--glob "!.git/*" 
        \--color "always" '.shellescape(<q-args>), 1, <bang>0)
endif
