function fish_user_key_bindings
  # fzf_key_bindings

  # User provided key bindings
  # NOTE: `\e` is the "meta" key, ie. ⌘  on macOS
  bind \ev 'fish_clipboard_paste'
  bind \ec 'fish_clipboard_copy'

  if [ $TERM = tmux-256color ]
    # bind -k up 'history --merge ; up-or-search'
    bind \e\[A 'history --merge ; up-or-search'
  else
    # DON'T merge history
  end
end
