if has('nvim')
  " Wrap in try/catch to avoid errors on initial install before plugin is available
  try
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

    " use ripgrep instead of grep
    call denite#custom#var('grep', 'command', ['rg'])

    " Custom options for ripgrep
    "   --vimgrep:  Show results with every match on it's own line
    "   --hidden:   Search hidden directories and files
    "   --heading:  Show the file name above clusters of matches from each file
    "   --S:        Search case insensitively if the pattern is all lowercase
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

    " Recommended defaults for ripgrep via Denite docs
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    " Remove date from buffer list
    call denite#custom#var('buffer', 'date_format', '')

    " Open file commands
    call denite#custom#map('insert,normal', "<C-p>", '<denite:do_action:tabopen>')
    call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
    call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

    " Custom options for Denite
    "   auto_resize             - Auto resize the Denite window height automatically.
    "   prompt                  - Customize denite prompt
    "   direction               - Specify Denite window direction as directly below current pane
    "   winminheight            - Specify min height for Denite window
    "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
    "   prompt_highlight        - Specify color of prompt
    "   highlight_matched_char  - Matched characters highlight
    "   highlight_matched_range - matched range highlight
    let s:denite_options = {'default' : {
          \ 'auto_resize': 1,
          \ 'prompt': 'λ:',
          \ 'direction': 'rightbelow',
          \ 'winminheight': '10',
          \ 'highlight_mode_insert': 'Visual',
          \ 'highlight_mode_normal': 'Visual',
          \ 'prompt_highlight': 'Function',
          \ 'highlight_matched_char': 'Function',
          \ 'highlight_matched_range': 'Normal'
          \ }}

    " Loop through denite options and enable them
    function! s:profile(opts) abort
      for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
          call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
      endfor
    endfunction

    call s:profile(s:denite_options)
  catch
    echo 'Denite not installed. It should work after running :packupdate'
  endtry

  " nnoremap ; :Denite buffer -split=floating -winrow=1<CR>
  nmap ; :Denite buffer<CR>

  nnoremap <leader>t :Denite file/rec -split=floating -winrow=1<CR>

  " TODO: FIXME: below binding borked!
  nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>

  " define mappings while in dentie window
  " <CR>        - Opens currently selected file
  " q or <Esc>  - Quite denite window
  " d           - close currently selected file/buffer
  " p           - preview currently selected file

  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
          \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
          \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-o>
          \ denite#do_map('open_filter_buffer')
  endfunction
endif
