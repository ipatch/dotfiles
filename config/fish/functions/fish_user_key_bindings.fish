function fish_user_key_bindings
  # fzf_key_bindings

  if [ $TERM = tmux-256color ]
    # bind -k up 'history --merge ; up-or-search'
    bind \e\[A 'history --merge ; up-or-search'
  else
    # DON'T merge history
  end
end
